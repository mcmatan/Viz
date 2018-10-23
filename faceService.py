########### Python 2.7 #############
import httplib, urllib, base64
import traceback
import requests


a = 3


headers = {
    # Request headers
    'Content-Type': 'application/octet-stream',
    'Ocp-Apim-Subscription-Key': '8abfbd61f9954230880cd9ba184c93fe'
}

# params = urllib.urlencode({
#     # Request parameters
#     'returnFaceId': 'true',
#     'returnFaceLandmarks': 'false',
#     'returnFaceAttributes': 'emotion',
# })

def getFaceDetails(imageData) :
    res = requests.post(url='https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect?returnFaceId=true&returnFaceLandmarks=false&returnFaceAttributes=emotion',
                    data=imageData,
                    headers=headers)
    return res.text
    # return imageData

    
    # try:
    #     conn = httplib.HTTPSConnection('https://westcentralus.api.cognitive.microsoft.com')
    #     conn.request("POST", "/face/v1.0/detect?%s" % params, imageData, headers)
    #     response = conn.getresponse()
    #     data = response.read()
    #     print(data)
    #     print("Success")
    #     conn.close()
    # except Exception as e:
    #     #print("[Errno {0}] {1}".format(e.errno, e.strerror))
    #     print(str(e))
    #     print("Error")
    #     traceback.print_exc()
    return "bla"


# ####################################

# ########### Python 3.2 #############
# import http.client, urllib.request, urllib.parse, urllib.error, base64

# headers = {
#     # Request headers
#     'Content-Type': 'application/json',
#     'Ocp-Apim-Subscription-Key': '{subscription key}',
# }

# params = urllib.parse.urlencode({
#     # Request parameters
#     'returnFaceId': 'true',
#     'returnFaceLandmarks': 'false',
#     'returnFaceAttributes': '{string}',
# })

# try:
#     conn = http.client.HTTPSConnection('westus.api.cognitive.microsoft.com')
#     conn.request("POST", "/face/v1.0/detect?%s" % params, "{body}", headers)
#     response = conn.getresponse()
#     data = response.read()
#     print(data)
#     conn.close()
# except Exception as e:
#     print("[Errno {0}] {1}".format(e.errno, e.strerror))

# ####################################