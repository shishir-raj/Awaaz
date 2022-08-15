import fnmatch

import sys
sys.path.append('/var/www/projectawaaz/')

import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "projectawaaz.settings")

import django
django.setup()

from website.models import Content

index = 0

languages = ['tamil', 'gujarati']
for language in languages:
	matches = []
	for root, dirnames, filenames in os.walk('poems/'+language):
	    for filename in fnmatch.filter(filenames, '*'):
	    	matches.append(os.path.join(os.getcwd(),'poems/'+language,filename))
	    	index += 1

	for file in matches:
		with open (file,"r") as f:
			first_line = f.readlines()[0]
			if " / " not in first_line:
				first_line = first_line.replace('/',' / ')
			title = first_line.split(' / ')[0]
			author = first_line.split(' / ')[1].replace("\n","")
			poem = Content(content_type="poem", title=title, author=author, language=language, weight=0, visible=1, path=file.split("website", 1)[1])
			poem.save()
		with open ("/var/www/projectawaaz/website/static/content/" + language,"a") as listfile:
			listfile.write(title + "\n")