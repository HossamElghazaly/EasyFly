from . import sql
from flask_login import UserMixin
from sqlalchemy.sql import func

class User(sql.Model, UserMixin):
    id = sql.Column(sql.Integer, primary_key=True)
    email = sql.Column(sql.String(150), unique=True, nullable=False)
    password = sql.Column(sql.String(150), nullable=False)
    firstname = sql.Column(sql.String(150), nullable=False)
    lastname = sql.Column(sql.String(150), nullable=True)
    username = sql.Column(sql.String(150), unique=True, nullable=False)


class Flight(sql.Model):
    id = sql.Column(sql.Integer, primary_key=True)
    departure_city = sql.Column(sql.String(150), nullable=False)
    destination_city = sql.Column(sql.String(150), nullable=False)
    departure_date = sql.Column(sql.Date, nullable=False)
    flight_class = sql.Column(sql.String(50), nullable=False)
    available_seats = sql.Column(sql.Integer, nullable=False)
    price = sql.Column(sql.Float, nullable=False)


class Booking(sql.Model):
    id = sql.Column(sql.Integer, primary_key=True)
    airline = sql.Column(sql.String(100), nullable=False)
    booking_ref = sql.Column(sql.String(10), nullable=False)
    email_or_last_name = sql.Column(sql.String(150), nullable=False)
    created_at = sql.Column(sql.DateTime(timezone=True), server_default=func.now())