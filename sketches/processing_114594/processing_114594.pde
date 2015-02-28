
/*@pjs preload="test1.png";*/
PImage img;

size(400, 400);
background(213, 135, 25);
img = loadImage("test1.png");

tint(0, 153, 0);
image(img, 0, 0);

tint(0, 0, 255, 127);
image(img, 150, 150, 150, 150);

tint(0, 0, 255, 127);
image(img, 150, 150, 150, 150);

tint(0, 0, 255, 127);
image(img, 150, 180, 150, 150);

tint(0, 0, 255, 127);
image(img, 150, 210, 150, 150);

tint(0, 0, 255, 127);
image(img, 150, 240, 150, 150);

tint(0, 0, 255, 127);
image(img, 150, 270, 150, 150);

tint(0, 0, 255, 127);
image(img, 150, 300, 150, 150);

tint(0, 0, 255, 127);
image(img, 150, 330, 150, 150);

tint(0, 0, 255, 127);
image(img, 150, 360, 150, 150);

noStroke(); 
ellipse(0, 150, 50, 50);

noStroke(); 
ellipse(400, 150, 50, 50);

 


