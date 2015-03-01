
/*@pjs preload="test.png,two-1.png";*/

PImage img1,img2;

size(300,300);
background(255);
img1=loadImage("test.png");
img2=loadImage("two-1.png");

tint(0,153,0);
image(img1,0,0);

tint(0,0,255,127);
image(img2,150,150,150,150);


