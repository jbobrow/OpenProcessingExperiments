
size (400, 200);
background(0);
PImage img;
PImage imgs;
img = loadImage ("flag.jpg");
imgs = loadImage ("board.jpg");
image (img, 0, 0, 100, 100);
tint(255, 0, 0, 125);
image (imgs, 200, 0, 100, 100);


