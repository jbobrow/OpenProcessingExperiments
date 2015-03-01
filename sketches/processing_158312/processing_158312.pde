
/* @pjs font="WireOne.ttf"; preload="kidhead.jpg" ; */

PImage kidhead ;
PFont wireone ;

kidhead = loadImage("kidhead.jpg") ;
wireone = createFont("WireOne.ttf", 228) ;

// start my program here

size(526, 622) ;

background(255, 0, 0) ;

image(kidhead, 0, 0, width, height) ; // draw image

noStroke() ;
fill(#000000) ;
rect(80, 400, 120, 115, 7) ;

textFont(wireone, 80) ; // setting the type
text("Goofy and the Spoofs", 80, 100) ; 


