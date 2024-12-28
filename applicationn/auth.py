from flask import Blueprint, render_template, request, flash, redirect, url_for
from .models import User, Booking,Flight
from werkzeug.security import generate_password_hash, check_password_hash
from . import sql
from flask_login import login_user, login_required, logout_user, current_user
from datetime import datetime, date

auth = Blueprint('auth', __name__)

@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')

        user = User.query.filter_by(email=email).first()
        if not email or len(email) < 4:
            flash('Email must be greater than 3 characters.', category='error')
        elif user:
            if check_password_hash(user.password, password):
                flash('Logged in successfully!', category='success')
                login_user(user, remember=True)
                return redirect(url_for('auth.home'))
            else:
                flash('Incorrect password, try again.', category='error')
        else:
            flash('Email does not exist.', category='error')

    return render_template("login.html", user=current_user)

@auth.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('auth.login'))

@auth.route('/sign-up', methods=['GET', 'POST'])
def sign_up():
    if request.method == 'POST':
        email = request.form.get('email')
        password1 = request.form.get('password1')
        password2 = request.form.get('password2')
        firstname = request.form.get('firstname')
        lastname = request.form.get('lastname')
        username = request.form.get('username')

        user = User.query.filter_by(email=email).first()
        use = User.query.filter_by(username=username).first()
        if user:
            flash('Email already exists.', category='error')
        elif use:
            flash('Username already exists.', category='error')
        elif len(email) < 4:
            flash('Email must be greater than 3 characters.', category='error')
        elif len(firstname) < 2:
            flash('First name must be greater than 1 character.', category='error')
        elif password1 != password2:
            flash('Passwords don\'t match.', category='error')
        elif len(password1) < 7:
            flash('Password must be at least 7 characters.', category='error')
        else:
            new_user = User(email=email,
                            password=generate_password_hash(password1),
                            firstname=firstname,
                            lastname=lastname,
                            username=username)
            sql.session.add(new_user)
            sql.session.commit()
            login_user(new_user, remember=True)
            flash('Account created!', category='success')
            return redirect(url_for('auth.login'))

    return render_template("sign_up.html", user=current_user)


@auth.route('/home', methods=['GET', 'POST'])
@login_required
def home():
    if request.method == 'POST':
        from_city = request.form.get('from')
        to_city = request.form.get('to')
        departure_date = request.form.get('start')
        return_date = request.form.get('return')
        flight_class = request.form.get('class')
        passengers = request.form.get('passenger')

        if not from_city:
            flash('Departure city is required.', category='error')
        elif not to_city:
            flash('Destination city is required.', category='error')
        elif not departure_date:
            flash('Departure date is required.', category='error')   
        elif not flight_class:
            flash('Flight class is required.', category='error')
        elif not passengers:
            flash('Number of passengers is required.', category='error')
        else:
            try:
                departure_date = datetime.strptime(departure_date, '%Y-%m-%d').date()
                return_date = datetime.strptime(return_date, '%Y-%m-%d').date() if return_date else None
                passengers = int(passengers)

                if departure_date < date.today():
                    flash('Departure date cannot be in the past.', category='error')
                elif return_date and return_date < departure_date:
                    flash('Return date cannot be before the departure date.', category='error')
                elif passengers < 1:
                    flash('Passenger count must be at least 1.', category='error')
                else:
                    flights = Flight.query.filter(
                        Flight.departure_city.ilike(f'%{from_city}%'),
                        Flight.destination_city.ilike(f'%{to_city}%'),
                        Flight.departure_date == departure_date,
                        Flight.flight_class.ilike(f'%{flight_class}%'),
                        Flight.available_seats >= passengers
                    ).all()

                    if not flights:
                        flash('No flights available for the given criteria.', category='error')
                    else:
                        return render_template('homeScreen.html', user=current_user, flights=flights)

            except ValueError:
                flash('Invalid date or passenger count.', category='error')

    return render_template('homeScreen.html', user=current_user)

@auth.route('/seed-flights')
def seed_flights():
    # إضافة رحلات وهمية
    flights = [
        Flight(departure_city="Cairo", destination_city="Dubai", departure_date=date(2025, 1, 5), flight_class="Economy", available_seats=100, price=200.0),
        Flight(departure_city="Cairo", destination_city="Paris", departure_date=date(2025, 6, 10), flight_class="Business", available_seats=50, price=500.0),
        Flight(departure_city="Dubai", destination_city="London", departure_date=date(2025, 7, 1), flight_class="Economy", available_seats=150, price=300.0)
    ]

    for flight in flights:
        sql.session.add(flight)

    sql.session.commit()
    return "Flights added successfully!"


@auth.route('/check-in', methods=['GET', 'POST'])
@login_required
def check_in():
    if request.method == 'POST':
        airline = request.form.get('airline')
        booking_ref = request.form.get('booking_ref')
        email_or_last_name = request.form.get('email_or_last_name')

        if not airline or not booking_ref or not email_or_last_name:
            flash('Please fill in all fields.', category='error')
        else:
            new_booking = Booking(
                airline=airline,
                booking_ref=booking_ref,
                email_or_last_name=email_or_last_name
            )
            sql.session.add(new_booking)
            sql.session.commit()
            flash('Check-In completed successfully!', category='success')

    return render_template("Checkin.html", user=current_user)



@auth.route('/flight_status')
@login_required
def flight_status():
    return render_template("flight status.html", user=current_user)


@auth.route('/profile')
@login_required
def profile():
    return render_template("profile.html", user=current_user)
    
@auth.route('/change-password', methods=['GET', 'POST'])
@login_required
def change_password():
    if request.method == 'POST':
        current_password = request.form.get('current_password')
        new_password = request.form.get('new_password')
        confirm_new_password = request.form.get('confirm_new_password')

        if not current_password or not new_password or not confirm_new_password:
            flash('All fields are required!', category='error')
        elif not check_password_hash(current_user.password, current_password):
            flash('Current password is incorrect.', category='error')
        elif new_password != confirm_new_password:
            flash('New passwords do not match.', category='error')
        elif len(new_password) < 7:
            flash('New password must be at least 7 characters long.', category='error')
        else:
            current_user.password = generate_password_hash(new_password)
            sql.session.commit()
            flash('Password updated successfully!', category='success')
            return redirect(url_for('auth.profile'))

    return render_template('Change Password.html', user=current_user)

