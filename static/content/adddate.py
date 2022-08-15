import fnmatch

import sys
sys.path.append('/var/www/projectawaaz/')

import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "projectawaaz.settings")

import django
django.setup()

from website.models import Content

languages = ['tamil', 'gujarati']
date = '26.06.2016'
for language in languages:
	poems = Content.objects.filter(language=language)
	for poem in poems:
		oldpath = poem.path
		number = oldpath.split(language+'/', 1)[1]
		newpath = oldpath.rsplit(number, 1)[0] + date + "/" + number
		poem.path = newpath
		poem.save()