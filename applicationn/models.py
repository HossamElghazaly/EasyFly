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
    