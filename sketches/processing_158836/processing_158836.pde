
/* @pjs preload="Unknown.jpeg" ; font="Oswald-Light.ttf" ; */

//load here
PImage anchor ;
PFont rabbit ;
anchor = loadImage("Unknown.jpeg") ;
rabbit = createFont("Oswald-Light.ttf", 200) ;

size(640, 480) ;
background(255) ;
println("Anchor Tent");
fill(0, 130, 0) ;
image(anchor, 20, 290, 200, 200) ;
triangle(180, 320, 380, 320, 280, 120) ;
fill(0) ;
triangle(260, 320, 300, 320, 280, 120) ;
fill(0, 130, 200) ;
textFont(rabbit, 50) ;
text("Inroducing the new anchored tent!", 35, 80) ;
textFont(rabbit, 20) ;
text("Now your belongings will always be secure,", 240, 360) ;
text("rain, wind, or wildlife!", 250, 400) ;


