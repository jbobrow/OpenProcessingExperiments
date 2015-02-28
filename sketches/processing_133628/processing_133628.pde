
/*
putting computation in to the real world
========================================
interesting fields to research:
- projection mapping, techno architecture, etc.
- building objects in real life: laser cutting / 3D printing

old / repurposed technologies: IKEA hacks
http://www.ikeahackers.net/

found objects
http://www.thecreatorsproject.com/blog/old-movies-are-projected-onto-hundreds-of-dvds-to-create-beautiful-audio-visual-mosaic

lit tree
http://www.kimchiandchips.com/littree.php

projector snow
http://imgur.com/a/SmOGs

ANALOG is infite resolution
use physics, biology, chemistry: running paint, mixed media, alchemy
http://joshualightshow.com/

outsource (to sloppy?) production
http://www.china-handart.com/
http://paintyourpizza.com/about/

ole kristinsen: work in progress
http://ole.kristensen.name/works/work-in-progress/

jonas lund: paint your pizza
http://paintyourpizza.com/

aaron koblin: 10.000 cents
http://www.tenthousandcents.com/

ishac bertran: generative photography
http://www.generativephotography.com/

kimchi and chips: lit tree
http://www.kimchiandchips.com/littree.php

zimoun
http://www.zimoun.net/

*/


/* @pjs preload="links.jpg"; */ 
PImage metalImage;
 
void setup(){
  size( 400, 300 );
  metalImage = loadImage("links.jpg");
  image( metalImage, 0, 0, metalImage.width, metalImage.height );
}
 
 
void draw(){
  //if( frameCount < 2 ) image( metalImage, 0, 0, metalImage.width, metalImage.height );
}


