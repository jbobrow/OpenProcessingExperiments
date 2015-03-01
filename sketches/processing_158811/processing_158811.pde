
/* @pjs font="BlissfulThinking.otf"; preload="chairs.jpg ; */


PImage space ;
PFont special ;
space = loadImage("chairs.jpg");
special = createFont("BlissfulThinking.ttf", 220) ; 



// start here




size(640, 480) ;

background(255, 0, 0) ;

image(space, 0, 0, width, height) ;

fill(0, 0, 0) ;
rect(30, 350, 500, 100, 12);

fill(255, 255, 255) ;
textFont(special, 100) ;
text("", 150, 140) ;

textFont(special, 45) ;
text("Desk Chairs 50% Off", 62, 420) ;





