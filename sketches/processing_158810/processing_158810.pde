
/* @pjs font="handbrush.ttf"; preload="pear.jpg ; */


PImage space ;
PFont special ;
space = loadImage("pear.jpg");
special = createFont("handbrush.ttf", 220) ; 



// start here




size(480, 640) ;

background(255, 0, 0) ;

image(space, 0, 0, width, height) ;

fill(255, 0, 0) ;
rect(30, 50, 100, 100, 12);

fill(255, 255, 255) ;
textFont(special, 100) ;
text("PEARS", 150, 140) ;

textFont(special, 50) ;
text("$1.50 /LB.", 150, 250) ;
text("GROWN IN THE USA", 83, 600) ;





