
//Homework 2
//Sabrina Li
//Copyright Sabrina Li January 2014 Pittsburgh, PA

size(400, 400);
background(164, 229, 232);
smooth();

float x, y, d;
x = 200;
y = 200;
d = 200;

//head
fill(255, 233, 209);
noStroke();
ellipse(x, y, d, d);

//nose
strokeWeight(4);
stroke(209, 181, 152);
beginShape();
curveVertex(x, y-0.25*d);
curveVertex(x, y-0.15*d);
curveVertex(x-0.1*d, y+0.1*d);
curveVertex(x+0.05*d, y+0.1*d);
curveVertex(x, y+0.25*d);
curveVertex(x-0.05*d, y+0.3*d);
endShape();

//left eye
stroke(0, 0, 0);
beginShape();
curveVertex(x-0.32*d, y-0.22*d);
curveVertex(x-0.3*d, y-0.15*d);
curveVertex(x-0.2*d, y-0.05*d);
curveVertex(x-0.1*d, y-0.15*d);
curveVertex(x-0.08*d, y-0.22*d);
endShape();

//right eye
beginShape();
curveVertex(x+0.08*d, y-0.22*d);
curveVertex(x+0.1*d, y-0.15*d);
curveVertex(x+0.2*d, y-0.05*d);
curveVertex(x+0.3*d, y-0.15*d);
curveVertex(x+0.32*d, y-0.22*d);
endShape();

//glasses
noFill();
stroke(74, 102, 116);
strokeWeight(2);
ellipse(x-0.2*d, y-0.1*d, 0.25*d, 0.25*d);
ellipse(x+0.2*d, y-0.1*d, 0.25*d, 0.25*d);
line(x-0.1*d, y-0.16*d, x+0.1*d, y-0.16*d);

//mouth
stroke(255, 209, 223);
strokeWeight(4);
arc(x, y+0.2*d, 0.25*d, 0.25*d, QUARTER_PI, 3*QUARTER_PI);

//saveFrame("hw2.jpg");

