
/*@pjs preload="onpu.png";*/
PImage img;

size(400,400);
background(204,204,104);
img=loadImage("onpu.png");

tint(0,0,255,127);
image(img,20,20,140,140);

tint(0,0,255,127);
image(img,20,260,140,140);

tint(0,0,255,127);
image(img,140,140,140,140);

tint(0,0,255,127);
image(img,250,20,140,140);

tint(0,0,255,127);
image(img,250,260,140,140);

stroke(3);
strokeWeight(1);
line(0,150,400,150);

stroke(3);
strokeWeight(1);
line(0,270,400,270);

stroke(3);
strokeWeight(1);
line(0,30,400,30);

stroke(3);
strokeWeight(1);
line(140,0,140,400);

stroke(3);
strokeWeight(1);
line(260,0,260,400);

stroke(3);
strokeWeight(1);
line(20,0,20,400);

stroke(3);
strokeWeight(1);
line(375,0,375,400);

noStroke();
ellipse(200,90,70,70);

noStroke();
ellipse(80,210,70,70);

noStroke();
ellipse(200,330,70,70);

noStroke();
ellipse(320,210,70,70);


