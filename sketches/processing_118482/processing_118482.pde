
/*@pjs preload="TM2.png";*/

PImage img;

size(400,400);
background(0,0,0);
img = loadImage("TM2.png");


size(400,400);

background(100,230,250);



point(100,100);

stroke(0);
strokeWeight(1);
line(100,0,400,300);

stroke(0);
strokeWeight(1);
line(0,0,400,400);

stroke(0);
strokeWeight(1);
line(0,100,300,400);

stroke(0);
strokeWeight(1);
line(0,100,300,400);

stroke(0);
strokeWeight(1);
line(0,200,200,400);

stroke(0);
strokeWeight(1);
line(0,300,100,400);


strokeWeight(2);
fill(180,200,200);
ellipse(200,340,250,100);

strokeWeight(2);
fill(180,200,0);
ellipse(240,210,20,220);


strokeWeight(2);
fill(180,200,0);
ellipse(160,210,20,220);

strokeWeight(2);
fill(180,200,0);
ellipse(200,170,340,20);

strokeWeight(2);
fill(180,200,0);
ellipse(200,190,20,310);


stroke(0);
strokeWeight(1);
line(300,0,400,100);

stroke(0);
strokeWeight(1);
line(200,0,400,200);




tint(160,160,0);
image(img,0,0);





