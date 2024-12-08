from . import sql
from flask_login import UserMixin
from sqlalchemy.sql import func


class Note(sql.Model):
    id = sql.Column(sql.Integer, primary_key=True)
    data = sql.Column(sql.String(10000))
    date = sql.Column(sql.DateTime(timezone=True), default=func.now())
    user_id = sql.Column(sql.Integer, sql.ForeignKey('user.id'))


class User(sql.Model, UserMixin):
    id = sql.Column(sql.Integer, primary_key=True)
    email = sql.Column(sql.String(150), unique=True, nullable=False)  # تأكد من أن الإيميل فريد
    password = sql.Column(sql.String(150), nullable=False)  # تأكد من أن كلمة المرور موجودة
    firstname = sql.Column(sql.String(150), nullable=False)  # تأكد من أن الاسم الأول موجود
    lastname = sql.Column(sql.String(150), nullable=True)
    username = sql.Column(sql.String(150), unique=True, nullable=False)
    