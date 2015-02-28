
size(500,350);
PImage img = loadImage("bridge1.png");
PImage img2 = loadImage("bridge2.png");

img.blend(img2, 12, 12, 480, 330, 10, 10, 480, 330, ADD);
image(img, 0, 0);

