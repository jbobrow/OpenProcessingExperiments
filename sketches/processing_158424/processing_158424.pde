
/* @pjs font="Lobster.ttf"; preload="family.jpg" ; */

PImage family ;
PFont lobster ;

size(500, 375) ;
family = loadImage("family.jpg") ;
image(family, 0, 0, 500, 375) ;
lobster = createFont("Lobster.ttf", 30) ;
textFont(lobster, 70) ;

fill(#000000) ;
text("Hace frio hoy", 63, 303) ;

fill(#EEEEEE) ;
text("Hace frio hoy", 60, 300) ;


