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


@auth.route('/seed-flights', methods=['GET'])
def seed_flights():
    flights = [
        Flight(id=1, departure_city="Cairo", destination_city="Dubai", departure_date=date(2025, 1, 10), flight_class="Economy", available_seats=50, price=300.0),
        Flight(id=2, departure_city="Cairo", destination_city="Paris", departure_date=date(2025, 1, 15), flight_class="Business", available_seats=20, price=800.0),
        Flight(id=3, departure_city="Doha", destination_city="Abu Dhabi", departure_date=date(2025, 2, 20), flight_class="Economy", available_seats=70, price=200.0),
        Flight(id=4, departure_city="New York", destination_city="London", departure_date=date(2025, 3, 5), flight_class="First Class", available_seats=10, price=1200.0),
        Flight(id=5, departure_city="Tokyo", destination_city="Seoul", departure_date=date(2025, 4, 12), flight_class="Economy Class", available_seats=150, price=400.0)
    ]

    for flight in flights:
        existing_flight = Flight.query.filter_by(id=flight.id).first()
        if not existing_flight:
            sql.session.add(flight)

    sql.session.commit()
    return "Flights have been added to the database successfully!"


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
                        return render_template('flight details.html', user=current_user, flights=flights)

            except ValueError:
                flash('Invalid date or passenger count.', category='error')

    return render_template('homeScreen.html', user=current_user)


@auth.route('/flight_details')
@login_required
def flight_details():
    return render_template("flight details.html", user=current_user)


@auth.route('/information', methods=['GET', 'POST'])
@login_required
def information():
    if request.method == 'POST':
        required_fields = [
            ("airline", "Airline"),
            ("passport_number", "Passport Number"),
            ("full_name", "Full Name"),
            ("date_of_birth", "Date of Birth"),
            ("date_of_issue", "Date of Issue"),
            ("date_of_expiry", "Date of Expiry"),
            ("phone_number", "Phone Number"),
            ("email_address", "E-mail Address")
        ]

        for field, label in required_fields:
            if not request.form.get(field):
                flash(f"{label} is required.", category="error")
                return redirect(url_for("auth.information"))

        airline = request.form.get("airline")
        passport_number = request.form.get("passport_number")
        full_name = request.form.get("full_name")
        date_of_birth = request.form.get("date_of_birth")
        date_of_issue = request.form.get("date_of_issue")
        date_of_expiry = request.form.get("date_of_expiry")
        phone_number = request.form.get("phone_number")
        email_address = request.form.get("email_address")

        if not passport_number.isdigit() or len(passport_number) < 6:
            flash("Passport Number must be at least 6 numbers.", category="error")
            return redirect(url_for("auth.information"))

        try:
            dob = datetime.strptime(date_of_birth, "%Y-%m-%d").date()
            if (date.today().year - dob.year) < 18:
                flash("You must be at least 18 years old.", category="error")
                return redirect(url_for("auth.information"))
        except ValueError:
            flash("Invalid Date of Birth format.", category="error")
            return redirect(url_for("auth.information"))

        try:
            issue_date = datetime.strptime(date_of_issue, "%Y-%m-%d").date()
            expiry_date = datetime.strptime(date_of_expiry, "%Y-%m-%d").date()

            if issue_date >= expiry_date:
                flash("Date of Issue must be before Date of Expiry.", category="error")
                return redirect(url_for("auth.information"))

            if expiry_date < date.today():
                flash("Passport Expiry Date must not be in the past.", category="error")
                return redirect(url_for("auth.information"))
        except ValueError:
            flash("Invalid Date format for Issue or Expiry.", category="error")
            return redirect(url_for("auth.information"))

        if not phone_number.isdigit() or len(phone_number) != 11:
            flash("Phone Number must be exactly 11 digits.", category="error")
            return redirect(url_for("auth.information"))

        if "@" not in email_address or "." not in email_address.split("@")[-1]:
            flash("Invalid E-mail Address.", category="error")
            return redirect(url_for("auth.information"))

        booking_ref = passport_number[-4:]

        booking = Booking(
            airline=airline,
            booking_ref=booking_ref,
            email_or_last_name=email_address
        )
        sql.session.add(booking)
        sql.session.commit()

        flash("Information submitted successfully! Proceed to payment.", category="success")
        return redirect(url_for("auth.payment"))

    return render_template("information.html", user=current_user)



@auth.route('/payment', methods=['GET', 'POST'])
@login_required
def payment():
    if request.method == 'POST':
        card_number = request.form.get('card_number')
        cardholder_name = request.form.get('cardholder_name')
        exp_month = request.form.get('exp_month')
        exp_year = request.form.get('exp_year')
        ccv = request.form.get('ccv')

        if not card_number or len(card_number) != 16 or not card_number.isdigit():
            flash('Card number must be 16 numbers.', category='error')
            return redirect(url_for('auth.payment'))

        if not cardholder_name or len(cardholder_name) < 3:
            flash('Cardholder name must be at least 3 characters.', category='error')
            return redirect(url_for('auth.payment'))

        if not exp_month or not exp_year or not exp_month.isdigit() or not exp_year.isdigit():
            flash('Invalid expiration date.', category='error')
            return redirect(url_for('auth.payment'))

        if int(exp_month) < 1 or int(exp_month) > 12:
            flash('Expiration month must be between 01 and 12.', category='error')
            return redirect(url_for('auth.payment'))

        if int(exp_year) < datetime.now().year:
            flash('Expiration year must not be in the past.', category='error')
            return redirect(url_for('auth.payment'))

        if not ccv or len(ccv) != 3 or not ccv.isdigit():
            flash('CCV must be 3 digits.', category='error')
            return redirect(url_for('auth.payment'))

        flash('Payment processed successfully!', category='success')
        return redirect(url_for('auth.success'))  

    return render_template('creditcard.html', user=current_user)


@auth.route('/success')
@login_required
def success():
    return render_template("success.html", user=current_user)


@auth.route('/flight_status', methods=['GET', 'POST'])
@login_required
def flight_status():
    flights = []
    if request.method == 'POST':
        flight_number = request.form.get('flight_number') 
        date = request.form.get('date')  
    
        if not flight_number and not date:
            flash('Please provide at least Flight Number or Date.', category='error')
            return render_template('flight status.html', user=current_user)

        try:
            query = Flight.query
            if flight_number:
                flight_id = int(flight_number)
                query = query.filter(Flight.id == flight_id)

            if date:
                flight_date = datetime.strptime(date, '%Y-%m-%d').date()
                query = query.filter(Flight.departure_date == flight_date)

            flights = query.all()

            if not flights:
                flash('No flights found matching the provided details.', category='error')

        except ValueError:
            flash('Invalid Flight Number or Date format.', category='error')

    return render_template('flight status.html', user=current_user, flights=flights)




@auth.route('/check-in', methods=['GET', 'POST'])
@login_required
def check_in():
    if request.method == 'POST':
        airline = request.form.get('airline')
        booking_ref = request.form.get('booking_ref')
        email_or_last_name = request.form.get('email_or_last_name')

        if not airline or not booking_ref or not email_or_last_name:
            flash('All fields are required (Airline, Booking Ref/PNR, and Email/Last Name).', category='error')
            return render_template("Checkin.html", user=current_user)

        booking = Booking.query.filter_by(
            airline=airline,
            booking_ref=booking_ref,
            email_or_last_name=email_or_last_name
        ).first()

        if booking:
            flash('Check-In completed successfully!', category='success')
            return redirect(url_for('auth.booked'))
        else:
            flash('No booking found with the provided details.', category='error')

    return render_template("Checkin.html", user=current_user)



@auth.route('/booked')
@login_required
def booked():
    return render_template("booked.html", user=current_user)

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


@auth.route('/edit-profile', methods=['GET', 'POST'])
@login_required
def edit_profile():
    if request.method == 'POST':
        username = request.form.get('username')
        phone = request.form.get('phone')

        if not username or len(username) < 2:
            flash('Username must be at least 2 characters.', category='error')
            return render_template('Editprofile.html', user=current_user)

        if User.query.filter(User.username == username, User.id != current_user.id).first():
            flash('Username is already taken.', category='error')
            return render_template('Editprofile.html', user=current_user)

        if not phone or not phone.isdigit() or len(phone) != 11:
            flash('Phone number must be exactly 11 numbers.', category='error')
            return render_template('Editprofile.html', user=current_user)

        current_user.username = username
        current_user.phone = phone
        sql.session.commit()

        flash('Profile updated successfully!', category='success')
        return redirect(url_for('auth.profile'))

    return render_template('Editprofile.html', user=current_user)
