
// Oliver Haimson  alhaimso
// Homework 2
// copyright 2012

size(400,400);
smooth();
background(39,59,111);

float x, y, w, h, sw;
x = width*.5;
y = height*.5;
w = 200;
h = 200;
sw = 7;

fill(28,114,183);
noStroke();
ellipse(x,y,w,h);

noFill();
stroke(193,159,35);
strokeWeight(sw);
ellipse(x,y,w,h);

stroke(165,31,27);

// O

beginShape();
curveVertex(x-.15*w, y-.44*h);
curveVertex(x-.26*w, y-.36*h);
curveVertex(x-.4*w, y-.19*h);
curveVertex(x-.44*w, y);
curveVertex(x-.39*w, y+.21*h);
curveVertex(x-.22*w, y+.38*h);
curveVertex(x-.15*w, y+.25*h);
curveVertex(x-.12*w, y);
curveVertex(x-.15*w, y-.25*h);
curveVertex(x-.24*w, y-.36*h);
curveVertex(x-.31*w, y-.26*h);
curveVertex(x-.23*w, y-.23*h);
curveVertex(x-.17*w, y-.27*h);
curveVertex(x-.085*w, y-.435*h);
curveVertex(x-.05*w, y-.5*h);
endShape();

// L

beginShape();
curveVertex(x-.13*w, y+.5*h);
curveVertex(x-.1*w, y+.435*h);
curveVertex(x+.05*w, y-.15*h);
curveVertex(x-.02*w, y-.445*h);
curveVertex(x-.07*w, y-.15*h);
curveVertex(x+.02*w, y+.44*h);
curveVertex(x+.08*w, y+.5*h);
endShape();

// H

beginShape();
curveVertex(x, y+.6*h);
curveVertex(x+.1*w, y+.44*h);
curveVertex(x+.19*w, y);
curveVertex(x+.13*w, y-.43*h);
curveVertex(x+.11*w, y-.05*h);
curveVertex(x+.16*w, y+.4*h);
curveVertex(x+.26*w, y);
curveVertex(x+.35*w, y+.27*h);
curveVertex(x+.44*w, y+.1*h);
curveVertex(x+.43*w, y-.1*h);
curveVertex(x+.27*w, y-.2*h);
endShape();


//saveFrame("hw2.jpg");

