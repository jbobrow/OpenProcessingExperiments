
/**Brandon Brown*/
/* @pjs font="FjallaOne-Regular.ttf"; preload="clouds_sky.jpg" ; */

PImage Sky; //nickmname!!
PFont Fjalla; //nickname!!

size(1024, 681);
background(255,0,0);

Sky = loadImage("clouds_sky.jpg");
image(Sky,0,0);

noFill();
stroke(#F0F0F0, 80);
strokeWeight(100);
rect(0,0,960,681);

/*stroke(255);
strokeWeight(10);  // Default
line(0, 20, 1024, 20);
**/

Fjalla = createFont("FjallaOne-Regular.ttf", 400);
textFont(Fjalla, 130);

fill(#F0F0F0, 90);
text("ASPIRE", 190, 200);
text("TO INSPIRE", 190, 330);
text("BEFORE YOU", 190, 460);
text("EXPIRE", 190, 590);


