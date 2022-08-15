import fnmatch

import sys
sys.path.append('/var/www/projectawaaz/')

import os

index = 0

languages = ['english', 'hindi', 'marathi', 'tamil', 'gujarati']
for language in languages:
	matches = []
	for root, dirnames, filenames in os.walk('poems/'+language):
	    for filename in fnmatch.filter(filenames, '*'):
	    	if filename != "Names.txt":
	    		print root, filename
		    	matches.append(os.path.join(os.getcwd(),root,filename))
		    	index += 1

	for file in matches:
		with open (file,"r") as f:
			first_line = f.readlines()[0]
			if " / " not in first_line:
				first_line = first_line.replace('/',' / ')
			title = first_line.split(' / ')[0]
			author = first_line.split(' / ')[1].replace("\n","")
		with open ("/var/www/projectawaaz/website/static/content/" + language,"a") as listfile:
			listfile.write(title + "\n")