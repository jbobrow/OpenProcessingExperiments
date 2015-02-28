
/*@pjs preload="t.png";*/

PImage img;

size(400,400);
background(167,239,121);
img=loadImage("t.png");

tint(255,255,255);
image(img,0,0);




tint(0,0,255,127);
image(img,200,200,300,300);

tint(0,0,255,127);
image(img,200,-90,300,300);

tint(0,0,255,127);
image(img,-100,-90,300,300);

tint(0,0,255,127);
image(img,-100,200,300,300);



stroke(0,102,60);  
strokeWeight(2);
line(150, 0, 400, 250);

strokeWeight(2);
line(0,150, 250, 400);

strokeWeight(2);
line(250, 0, 0, 250);

strokeWeight(2);
line(400,150,150,400);


strokeWeight(1);
ellipse(50,200,50,50);

strokeWeight(1);
ellipse(350,200,50,50);


