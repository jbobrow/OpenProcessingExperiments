
// hw 2
// name: Peter Teguh Salim
// e-mail: psalim@andrew.cmu.edu
// Copyright: Â© Peter Teguh Salim August 2012  Pittsburgh, PA 15213  All Rights Reserved

size(400,400);
background(210);
smooth();

float x, y, diam;

x = 200;
y = 200;
diam = 400;

// bounding circle
noStroke();
fill(255,255,255,56);
ellipseMode(CENTER);
ellipse(x, y, diam, diam);

// P
stroke(98,0,14);
strokeWeight(diam/50);
noFill();
beginShape(); 
vertex(x-diam/4, y-diam/2.5);
bezierVertex(x-diam/2, y, x, y+diam/2, x-diam/4, y+diam/2.5);
endShape();

beginShape();
curveVertex(x-diam/2.5, y-diam/4);
curveVertex(x-diam/2.5, y-diam/4);
curveVertex(x-diam/5, y-diam/3);
curveVertex(x-diam/20, y-diam/5);
curveVertex(x-diam/18, y);
curveVertex(x-diam/2.7, y+diam/4);
curveVertex(x-diam/2.7, y+diam/4);
endShape();

// T
stroke(140,0,14);
beginShape();
vertex(x-diam/7, y-diam/2.5);
bezierVertex(x+diam/8, y-diam/2, x+diam/4, y-diam/3, x+diam/4, y-diam/2.7);
endShape();

beginShape();
curveVertex(x+diam/12, y-diam/2.4);
curveVertex(x+diam/12, y-diam/2.4);
curveVertex(x+diam/15, y);
curveVertex(x-diam/15, y+diam/2.3);
curveVertex(x-diam/15, y+diam/2.3);
endShape();

// S
stroke(140,0,42);
beginShape();
curveVertex(x+diam/2.2, y-diam/20);
curveVertex(x+diam/2.2, y-diam/20);
curveVertex(x+diam/3, y-diam/5);
curveVertex(x+diam/5, y-diam/4);
curveVertex(x+diam/5.5, y);
curveVertex(x+diam/3, y+diam/10);
curveVertex(x+diam/2.8, y+diam/5);
curveVertex(x+diam/3.5, y+diam/3);
curveVertex(x, y+diam/2.3);
curveVertex(x, y+diam/2.3);
endShape();

//saveFrame("hw2.jpg");


