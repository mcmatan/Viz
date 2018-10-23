#prerequisites: install Flask via pip (pip install Flask)
from flask import Flask
from flask import request
from flask import jsonify
from faceService import getFaceDetails 

app = Flask(__name__)

@app.route('/', methods=['POST'])
def parse_request():
    data = request.get_data() 
    responseJson = jsonify(getFaceDetails(data))
    return responseJson

if __name__ == '__main__':
	app.run()