
/* @pjs preload="city.jpg"; */
size(500,260);
PImage img = loadImage("city.jpg");
image(img, 0,0,500, 260);
filter(DILATE);
filter(POSTERIZE,9);


