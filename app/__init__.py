from flask import Flask
from app.routes import routes  # ensure this line exists

app = Flask(__name__)
app.register_blueprint(routes)
