#prerequisites: install Flask via pip (pip install Flask)
from flask import Flask
from flask import request
from faceService import getFaceDetails 

app = Flask(__name__)

# @app.route('/')
# def hello():
#     return "Hello World!"


@app.route('/', methods=['POST'])
def parse_request():
    data = request.get_data()  # empty in some cases
    # always need raw data here, not parsed form data
    #return "yay"
    return getFaceDetails(data)
    

if __name__ == '__main__':
	app.run()