from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from os import path
from flask_login import LoginManager

sql = SQLAlchemy()
DB_NAME = "database.sql"


def create_app():
    app = Flask(__name__)
    app.config['SECRET_KEY'] = 'oops!'
    app.config['SQLALCHEMY_DATABASE_URI'] = f'sqlite:///{DB_NAME}'
    sql.init_app(app)
    

    from .auth import auth
    app.register_blueprint(auth, url_prefix='/')

    from .models import User, Booking, Flight

    with app.app_context():
        sql.create_all()

    login_manager = LoginManager()
    login_manager.login_view = 'auth.login'
    login_manager.init_app(app)

    @login_manager.user_loader
    def load_user(id):
        return User.query.get(int(id))

    return app

def create_database(app):
    if not path.exists('applicationn/' + DB_NAME):
        sql.create_all(app=app)
        print('Created Database!')