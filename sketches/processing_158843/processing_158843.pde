
/* @pjs preload="billy-mays.jpg" ; */

// load here
PImage billy ;
PFont special ;
billy = loadImage("billy-mays.jpg") ;
special = createFont("Ubuntu-BoldItalic.ttf", 16) ;

// start here


size(640, 480) ;
background(250, 0, 250) ;
fill(250, 100, 0) ;
image(billy, 180, 20, 280, 300) ;

rect(550, 20, 20, 400) ;
rect(500, 420, 120, 20) ;
triangle(500, 440, 520, 440, 500, 460) ;
triangle(620, 440, 600, 440, 620, 460) ;

fill(0, 0, 255) ;
textFont(special, 20) ;
text("Billy Mays here with a special Processing offer!", 20, 340) ;
text("Check out the new Sand Walking Stick!", 20, 360) ;
text("It's patented design grips any terrain!", 20, 380) ;


