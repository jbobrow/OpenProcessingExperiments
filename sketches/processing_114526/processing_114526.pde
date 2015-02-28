
/*@pjs preload="hana.png";*/

PImage img;
int w=50;

size(400,400);
background(255,200,255);
img=loadImage("hana.png");

stroke(255,150);
strokeWeight(w);
line(0,0,0,400);
line(w*2,0,w*2,400);
line(w*4,0,w*4,400);
line(w*6,0,w*6,400);
line(w*8,0,w*8,400);

stroke(255,150);
strokeWeight(w);
line(0,0,400,0);
line(0,w*2,400,w*2);
line(0,w*4,400,w*4);
line(0,w*6,400,w*6);
line(0,w*8,400,w*8);

tint(255,120,180);
image(img,300,300,100,100);

tint(255,150,200);
image(img,325,325,50,50);

tint(255,180,220);
image(img,337,337,25,25);

strokeWeight(1);
noFill();
stroke(255,130,180,200);

ellipse(380,200,50,50);
ellipse(200,380,50,50);


stroke(255,130,180,100);

ellipse(390,270,25,25);
ellipse(270,390,25,25);

