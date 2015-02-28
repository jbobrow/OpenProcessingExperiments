
/*@pjs preload="hatachi.png";*/


PImage img;

size(400,400);

background(255,255,148);

stroke(85);
strokeWeight(2);

fill(117,227,255,100);
ellipse(100,100,100,100);
ellipse(200,200,100,100);
ellipse(300,300,140,140);
ellipse(100,200,140,140);

fill(255,127,151,100);
ellipse(250,60,200,200);
ellipse(90,350,200,200);
ellipse(450,400,350,350);

fill(51,148,113,100);
ellipse(340,160,100,100);
ellipse(200,200,100,100);
ellipse(300,300,140,140);
ellipse(230,350,150,150);
ellipse(1,1,400,400);
ellipse(90,350,200,200);

fill(255,252,175,100);
ellipse(350,-50,200,200);
ellipse(270,220,130,130);
ellipse(1,80,150,150);
ellipse(300,510,300,300);

img = loadImage("hatachi.png");
tint(81,81,81);
image(img,20,100,300,300);


