import fnmatch
import os

index = 0

languages = ['english']#,'marathi','gujarati','tamil','hindi']
for language in languages:
	for root, dirnames, filenames in os.walk('poems/'+language+"/26.06.2016"):
		for filename in filenames:
			with open(os.path.join('poems', language, "26.06.2016",filename), 'r') as file:
				data = file.readlines()
				if len(data) < 10:
					print os.path.join(language, filename) , len(data)