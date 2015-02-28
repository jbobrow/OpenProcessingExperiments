
/*@pjs preload="flower.png";*/

PImage img;

size(400,400);
background(90,115,160);
img = loadImage("flower.png");

tint(0,30,80,120);
image(img,300,300,150,150);

tint(0,0,98,105);
image(img,250,250,200,200);

tint(0,0,98,105);
image(img,50,50,180,180);

stroke(170);
strokeWeight(2);
line(0,200,108,156);

tint(0,64,98,105);
image(img,25,25,100,100);

stroke(170);
strokeWeight(2);
line(0,170,108,156);

stroke(170);
strokeWeight(2);
line(0,150,108,156);

stroke(255,100,100,100);
strokeWeight(8);
noFill();
ellipse(140,143,29,29);

stroke(0,70,98,105);
triangle(200, 40, 360, 360, 40, 360);

triangle(360,40,360,360,40,200);

stroke(255,200,230,100);
strokeWeight(10);
noFill();
ellipse(50,350,50,50);

stroke(255,200,230,100);
strokeWeight(8);
noFill();
ellipse(350,50,30,30);



