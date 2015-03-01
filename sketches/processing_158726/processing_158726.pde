
/* @pjs font="Lobster.ttf, Highway.ttf"; preload="giving-blood.jpg" ; */

PImage blood ;
PFont lobster ;
PFont highway ;

size(500, 500) ;
blood = loadImage("giving-blood.jpg") ;
image(blood, 0, 0, 500, 500) ;
lobster = createFont("Lobster.ttf", 30) ;
highway = createFont("Highway.ttf", 30) ;

textFont(highway, 40) ;

noStroke() ;
fill(#333399) ;

ellipse(352, 110, 210, 150) ;

fill(#FFFFFF) ;
text("Feeling", 293, 98) ;

fill(#FFFFFF) ;
text("generous?", 265, 143) ;

textFont(lobster, 50) ;

noStroke() ;
fill(#cc0000) ;
rect(0, 345, 500, 75) ;

fill(#000000) ;
text("Give us your blood!", 64, 400) ;

fill(#FFFFFF) ;
text("Give us your blood!", 62, 398) ;

textFont(highway, 30) ;

fill(#000000) ;
text("Saturday, October 4th", 103, 470) ;

fill(#FFFFFF) ;
text("Saturday, October 4th", 101, 468) ;


