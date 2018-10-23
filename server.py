#prerequisites: install Flask via pip (pip install Flask)
from flask import Flask
from flask import request
from flask import jsonify
from faceService import getFaceDetails 

app = Flask(__name__)

@app.route('/', methods=['POST'])
def parse_request():
    data = request.get_data()  # empty in some cases
    return jsonify(getFaceDetails(data))

if __name__ == '__main__':
	app.run()