
/*@pjs preload="syoukadai123png.png,syoukdai5.png";*/

PImage img;
PImage img2;

size(400, 400);
background(0, 0, 0);
img = loadImage("syoukadai123png.png");
img2 = loadImage("syoukdai5.png");

tint(25, 105, 55);
image(img, 0, 0);
image(img2, 0, 0);
stroke(143, 146, 148);
strokeWeight(5);
line(0, 0, 200, 200);
line(400, 0, 200, 200);
line(0, 400, 200, 200);
line(400, 400, 200, 200);
line(200, 0, 200, 400);
line(0, 200, 400, 200);
stroke(143, 123, 35);
strokeWeight(15);
line(0, 0, 0, 400);
line(0, 0, 400, 0);
line(400, 0, 400, 400);
line(0, 400, 400, 400);


rectMode(CENTER);
rect(100, 300, 50, 50);
rect(300, 300, 50, 50);
rect(100, 100, 50, 50);
rect(300, 100, 50, 50);

stroke(143, 1, 35);
strokeWeight(8);
line(45, 35, 355, 35);
line(45, 370, 355, 370);











