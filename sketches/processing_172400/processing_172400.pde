
/* @pjs preload="two.jpg,war.jpg"; */

PImage img=loadImage("two.jpg");
PImage img2=loadImage("war.jpg");
size(500, 500);
img.blend(img2, 0, 0, 400, 400, 20, 20, 450, 450, HARD_LIGHT);
image(img, 0, 0);



