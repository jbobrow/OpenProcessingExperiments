
/* @pjs preload = "pomm.jpg", "closepomm.jpg", "fruit.jpg" */

PImage img = loadImage ("pomm.jpg");
PImage img1 = loadImage ("closepomm.jpg");
PImage img2 = loadImage ("fruit.jpg");
size (300, 300);

img.blend (img2, 0, 0, 300, 300, 0, 150, 150, 150, HARD_LIGHT);
img.blend (img1, 0, 0, 300, 300, 0, 150, 100, 100, HARD_LIGHT);
image (img, 0, 0);





