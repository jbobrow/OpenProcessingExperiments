
/*@pjs preload="hisi.png";*/
PImage img;

size(400,400);
background(0,255,155);
img = loadImage("hisi.png");

tint(255,0255,0);
image(img,0,0);

tint(0,0,255,110);
image(img,0,100,100,100);

tint(0,0,255,110);
image(img,100,0,100,100);

tint(0,0,255,140);
image(img,100,200,100,100);
image(img,0,300,100,100);
image(img,300,0,100,100);
image(img,200,100,100,100);
image(img,300,200,100,100);
image(img,200,300,100,100);

