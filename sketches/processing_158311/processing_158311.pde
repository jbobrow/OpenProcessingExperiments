
/* @pjs font="Lobster.ttf"; preload="brule.jpg" ; */

PImage brule ;
PFont lobster ;

size(400, 300) ;
brule = loadImage("brule.jpg") ;
image(brule, 0, 0) ;
lobster = createFont("Lobster.ttf", 30) ;
textFont(lobster, 50) ;

fill(#000000) ;
text("For your", 17, 85) ;
text("health!", 40, 129) ;

fill(#F3F86C) ;
text("For your", 15, 83) ;
text("health!", 38, 127) ;


