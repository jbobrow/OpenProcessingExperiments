
/* @pjs preload="veg.jpg"; */

size(390,500);

PImage img = loadImage("veg.jpg");
image(img, 0, 0);
img.filter(INVERT);
image(img, 50,0);







