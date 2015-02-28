
size (800,600);
PImage img = loadImage("balloon.jpg");
image(img, 0, 0);
img.filter(INVERT);
image(img, 400, 0);


