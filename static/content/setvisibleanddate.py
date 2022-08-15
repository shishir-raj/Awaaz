import fnmatch
from shutil import copyfile

import sys
sys.path.append('/var/www/projectawaaz/')

import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "projectawaaz.settings")

import django
django.setup()

from website.models import Content

date = '26.06.2016'
languages = ['english', 'hindi', 'marathi']

for language in languages:
    try:
        os.makedirs(os.path.join(os.getcwd(), 'poems/'+language, date))
    except:
        pass
    titles = []
    files = []
    with open(os.path.join('poems/'+language, 'Names.txt'), 'r') as f:
        for line in f:
            titles.append(line.rstrip())
    print len(titles)
    matches = []
    for root, dirnames, filenames in os.walk('poems/'+language):
        for filename in [x for x in filenames if x.isdigit()]:
            matches.append(os.path.join(os.getcwd(),'poems/'+language,filename))

    for file in matches:
        with open (file,"r") as f:
            first_line = f.readlines()[0]
            if " / " not in first_line:
                first_line = first_line.replace('/',' / ')
            title = first_line.split(' / ')[0]
            author = first_line.split(' / ')[1].replace("\n","")
            if title in titles:
                files.append(file)
                # poem = Content(content_type="poem", title=title, author=author, language=language, path=file.split("website", 1)[1])
                # poem.save()
    
    for file in files:
        newpath = os.path.join(os.getcwd(), 'poems/'+language,
                               date, file.split(language+'/', 1)[1]
                              )
        # copyfile(file, newpath)
        # os.remove(file)
        print newpath