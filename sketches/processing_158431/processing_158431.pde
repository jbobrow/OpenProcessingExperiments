
/* @pjs font="SpecialElite.ttf"; preload="stars.jpg ; */


PImage space ;
PFont special ;
space = loadImage("stars.jpg");
special = createFont("SpecialElite.ttf", 220) ; 



// start here




size(640, 480) ;

background(255, 0, 0) ;

image(space, 0, 0, width, height) ;

fill(255, 255, 255) ;
rect(30, 50, 100, 100);


textFont(special, 100) ;
text("TODAY", 150, 140) ;
text("IS", 150, 250) ;
text("THURSDAY", 150, 360) ;





