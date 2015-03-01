
/* @pjs font="Sancreek-Regular.ttf"; preload="boy.jpg" ; */

PImage boy ;
PFont western ;
boy = loadImage("boy.jpg") ;
western = createFont("Sancreek-Regular.ttf", 220) ;

size(640, 480) ;
fill(255, 0, 0) ;
image(boy, 0, 0, 640, 480) ;
rect(10, 10, 10, 10) ;

noStroke() ;

textFont(western, 50) ;
text("Conference Eagle", 100, 100) ;


