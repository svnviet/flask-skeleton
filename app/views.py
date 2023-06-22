from flask import render_template, Blueprint
from config import BaseConfig

main_blueprint = Blueprint('main', __name__)


@main_blueprint.route('/')
def index():
    return render_template('index.html')

def static_media(file_name):
    return BaseConfig.static_media(path=file_name)