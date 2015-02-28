
/*@pjs preload="kou5.png";*/


PImage img;

size(400, 400);
background(25, 15, 19);
img= loadImage("kou5.png");

stroke(100);
strokeWeight(10);
line(400, 60, 60, 60);

stroke(100);
strokeWeight(10);
line(0, 60, 30, 0);

stroke(100);
strokeWeight(10);
line(0, 400, 0, 0);

stroke(100);
strokeWeight(10);
line(400, 0, 0, 0);

stroke(100);
strokeWeight(10);
line(60, 0, 0, 30);

tint(250, 250, 200, 90);
image(img, 60, 0, 100, 91);

tint(250, 100, 20, 90);
image(img, 300, 100);

tint(250, 250, 250, 250);
image(img, 50, 90, 100, -100);

tint(255, 255, 255);
image(img, 200, 40, 0, 100);

tint(25, 20, 25);
image(img, 10, 90);

tint(115, 5, 5);
image(img, 90, 90);

tint(15, 15, 15);
image(img, 90, 120, 90, 90);


