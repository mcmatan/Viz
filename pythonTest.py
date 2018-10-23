
import operator

array = [{"faceId":"9c9f5c9b-8200-41ae-b0e2-946c47382782","faceRectangle":{"top":122,"left":59,"width":177,"height":177},"faceAttributes":{"emotion":{"anger":0.0,"contempt":0.0,"disgust":0.0,"fear":0.0,"happiness":1.0,"neutral":0.0,"sadness":0.0,"surprise":0.0}}}]

results = array[0]
faceRectangle = results["faceRectangle"]
emotion = results["faceAttributes"]["emotion"]
bestEmotion = max(emotion.iteritems(), key=operator.itemgetter(1))[0]


print(bestEmotion)