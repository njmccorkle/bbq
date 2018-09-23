from flask import Flask
qmeter = Flask(__name__)

@qmeter.route("/")
def hello():
    return "<h1 style='color:blue'>Hello There!</h1>"

if __name__ == "__main__":
    qmeter.run(host='0.0.0.0')
