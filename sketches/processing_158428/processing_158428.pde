
/* @pjs font="Audiowide-Regular.ttf" ; preload="alex.jpg" ; */
size(640, 480) ;

PImage Zarek ;
PFont Audiowide ;

Zarek = loadImage("alex.jpg") ;
image(Zarek, 0, 0, 640, 500) ;
fill(#0F0202) ;

fill(#FFFFFF) ;
Audiowide = createFont("Audiowide-Regular.ttf", 30) ;
textFont(Audiowide, 120) ;
text("BROTH", 10, 100) ;
text("is", 10, 250) ;
text("YUMMY", 10, 400) ;


