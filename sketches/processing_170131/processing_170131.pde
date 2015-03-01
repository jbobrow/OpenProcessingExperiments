
/* @pjs preload="5pointz.jpg"; */
size(500,260);
PImage img = loadImage("5pointz.jpg");
image(img, 0,0,500, 260);
filter(OPAQUE);
filter(POSTERIZE,9);



