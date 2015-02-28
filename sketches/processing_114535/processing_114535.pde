
/*@pjs preload="discover.png";*/


PImage img;

size(400,400);
point(100,300);
background(200,160,160);
img = loadImage("discover.png");

tint(0,153,0);
image(img,0,0);

tint(0,0,0);
image(img,400,400,400,400);


strokeWeight(10);
noFill();
ellipse(100,100,200,200);

strokeWeight(15);
line(10,300,60,200);

strokeWeight(5);
noFill();
ellipse(200,300,80,30);

strokeWeight(2);
line(167,270,184,255);

strokeWeight(2);
line(184,255,273,353);

strokeWeight(2);
line(273,353,248,365);
 
strokeWeight(2);
line(248,365,167,270);




rectMode(CENTER);


