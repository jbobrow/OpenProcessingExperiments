
//Ji Hyun Kim
//bear
size(500,500);
background(255);
fill(225,225,0);

//body
beginShape();
vertex(200,250);
vertex(200,300);
vertex(160,300);
vertex(160,360);
vertex(200,360);
vertex(200,440);
vertex(230,440);
vertex(230,400);
vertex(250,400);
vertex(250,440);
vertex(280,440);
vertex(280,360);
vertex(320,360);
vertex(320,300);
vertex(280,300);
vertex(280,250);
endShape();

//head
ellipse(190,140,40,40);
ellipse(290,140,40,40);
ellipse(190,140,20,20);
ellipse(290,140,20,20);
ellipse(240,200,150,150);

//mouth and nose
rect(215,230, 50,15);
triangle(240,200, 235,210, 245,210);

//eyes
ellipse(210,180, 20,20);
ellipse(270,180, 20,20);
ellipse(210,180, 10,10);
ellipse(270,180, 10,10);
//eyelids
arc(210,180, 30,30, PI, TWO_PI);
arc(270,180, 30,30, PI, TWO_PI);
line(195,180, 225,180);
line(255,180, 285,180);
