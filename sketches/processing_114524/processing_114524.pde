
/*@pjs preload="on.png";*/

size(400, 400);
background(0, 0, 255);

stroke(0, 85, 255);
strokeWeight(1);
fill(0, 85, 255);
rectMode(CENTER);
rect(200, 20, 380, 20);
rect(200, 60, 380, 20);
rect(200, 100, 380, 20);
rect(200, 140, 380, 20);
rect(200, 180, 380, 20);
rect(200, 220, 380, 20);
rect(200, 260, 380, 20);
rect(200, 300, 380, 20);
rect(200, 340, 380, 20);
rect(200, 380, 380, 20);

stroke(0, 120, 255);
strokeWeight(1);
fill(0, 120, 255);
rectMode(CENTER);
rect(20, 200, 20, 380);
rect(60, 200, 20, 380);
rect(100, 200, 20, 380);
rect(140, 200, 20, 380);
rect(180, 200, 20, 380);
rect(220, 200, 20, 380);
rect(260, 200, 20, 380);
rect(300, 200, 20, 380);
rect(340, 200, 20, 380);
rect(380, 200, 20, 380);

PImage img;
img = loadImage("on.png");
tint(0, 0, 0);
image(img, 325, 325, 50, 50);

tint(0, 0, 0, 50);
image(img, 290, 290, 85, 85);




