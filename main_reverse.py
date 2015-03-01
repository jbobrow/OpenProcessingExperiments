#
#	Python script to scrape processing sketches from openProcessing.org
#	by Jonathan Bobrow, 2015
#
#	This should only need to be run once to gather all of the processing sketches hosted
#
#	The script pings the site and if there is a sketch by this number, it looks inside the
#	sourceCode div and writes that code into a file, saving that file inside of a folder
#	with the same name, so Processing will be happy when asking it to run this sketch
#
#	EDIT THESE VALUES:
#	start_sketch - what is the first sketch we should begin scraping from
#	end_sketch - what is the last sketch we should scrape
#	my_location - location to save the sketches in
#


# Notes for running Processing sketches from terminal
# in terminal, run the processing sketch from the folder like so
# processing-java --sketch=full_path/processing_XXXXX --output=processing_XXXXX --run


import os
import re
import urllib2
from bs4 import BeautifulSoup as soup
from os.path import expanduser, join

# edit these values
start_sketch = 150000 #
end_sketch = 190000 #
my_location = '/Users/greg/Documents/code/OpenProcessingExperiments/sketches'

def downloadSourceCode(sketchNum):
	print sketchNum
	url = "http://www.openprocessing.org/sketch/%s/code" % sketchNum
	web_soup = soup(urllib2.urlopen(url))

	# get main-content div
	result = web_soup.find(name="div", attrs={'class': 'sourceCode'})
	if result:
		print 'downloading %s' % sketchNum
		sourceCode = result.text
		#print sourceCode

		name = "processing_%s" % sketchNum
		path = expanduser('%s/%s/' % (my_location, name))
		filename = '%s.pde' % name
		fullpath = join(path, filename)
		if not os.path.exists(path): os.makedirs(path)
		text_file = open(fullpath, "w")		
		text_file.write(sourceCode.encode('utf-8'))
		text_file.close()

for sketchNum in xrange(start_sketch, end_sketch):
	downloadSourceCode(sketchNum)