
/*@pjs preload="testn1.png";*/
PImage img;

size(400,400);
background(0,0,0);

img = loadImage("testn1.png");

tint(255,255,255);
image(img,0,0);

tint(0,0,255);
image(img,150,150,150,150);

tint(0,0,255);
image(img,0,0,150,150);

tint(0,255,0);
image(img,100,100,100,100);

tint(6,252,238);
image(img,200,200,150,150);



