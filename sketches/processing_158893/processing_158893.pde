
/* @pjs font="RockSalt.ttf" ; preload="mustard-drink.jpg" ; */
size(500, 480) ;

PImage Mustard ;
PFont RockSalt ;


Mustard = loadImage("mustard-drink.jpg") ;
image(Mustard, 0, 0, 600, 480) ;

RockSalt = createFont("RockSalt.ttf", 40) ;
textFont(RockSalt, 60) ;
text("MUSTARD", 30, 390) ;

textFont(RockSalt, 22) ;
text("a drink for CHAMPIONS.", 35, 435 ) ;

ellipse(15, 375, 20, 20);
ellipse(390, 375, 20, 20);



