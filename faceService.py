import httplib, urllib, base64
import traceback
import requests
import operator
import json


headers = {
    'Content-Type': 'application/octet-stream',
    'Ocp-Apim-Subscription-Key': '8abfbd61f9954230880cd9ba184c93fe'
}

def getFaceDetails(imageData) :
    res = requests.post(url='https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect?returnFaceId=true&returnFaceLandmarks=false&returnFaceAttributes=emotion',
                    data=imageData,
                    headers=headers)

    array = json.loads(res.text)
    results = array[0]
    faceRectangle = results["faceRectangle"]
    emotion = results["faceAttributes"]["emotion"]
    bestEmotion = max(emotion.iteritems(), key=operator.itemgetter(1))[0]

    return {"bestEmotion": bestEmotion, "faceRectangle": faceRectangle}
