
/* @pjs preload = "fruit.jpg"; */

PImage img = loadImage ("fruit.jpg");
size (500, 500);
image (img, 0, 0);
filter (BLUR, 8);



