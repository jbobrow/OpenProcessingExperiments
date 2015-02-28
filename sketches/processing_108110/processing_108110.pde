
// Hyun Jean Kwon
// © Hyun Jean Kwon 2013

size(400, 400);
background (210, 250, 240);
rectMode( CENTER);

//vs
float x = 200;
float y = 200;

float w = 250;
float h = 250;

//glasses
strokeWeight(10);
strokeCap(PROJECT);
stroke (255, 105, 0);
line (x-(0.5*w), y-(0.25*h), x+(0.5*w), y-(0.25*h));
fill(255, 0, 232);
ellipse (x+(0.225*w), y-(0.225*h), w*0.3, h*0.3);
ellipse (x-(0.225*w), y-(0.225*h), w*0.3, h*0.3);

line (x+(0*w), y-(0.3*h), x+(0*w), y-(0.4*h));
//nose
noFill ();
strokeWeight(7.5);
strokeCap(PROJECT);
beginShape ();
curveVertex (x-(0.1*w), y+(0*h));
curveVertex (x-(0.1*w), y+(0.1*h));
curveVertex (x+(0*w), y+(0.2*h));
curveVertex (x+(0.1*w), y+(0.1*h));
curveVertex (x+(0.1*w), y+(0*h));
endShape ();
//nose2
beginShape ();
curveVertex (x+(0*w), y+(0.3*h));
curveVertex (x+(0.1*w), y+(0.1*h));
curveVertex (x+(0*w), y-(0.25*h));
curveVertex (x+(0*w), y-(0.6*h));
endShape ();

//mustache
fill(255, 98, 0);
beginShape ();
curveVertex (x-(0.4*w), y+(0.35*h));
curveVertex (x-(0.2*w), y+(0.25*h));
curveVertex (x+(0*w), y+(0.19*h));
curveVertex (x+(0.2*w), y+(0.25*h));
curveVertex (x+(0.4*w), y+(0.35*h));
endShape ();

//mustache2
beginShape ();
curveVertex (x-(0.3*w), y+(.175*h));
curveVertex (x-(0.2*w), y+(.25*h));
curveVertex (x-(0.1*w), y+(.275*h));
curveVertex (x+(0*w), y+(.25*h));
curveVertex (x+(.1*w), y+(.175*h));
endShape ();

//mustache3
beginShape ();
curveVertex (x-(0.1*w), y+(.175*h));
curveVertex (x+(0*w), y+(.25*h));
curveVertex (x+(.1*w), y+(.275*h));
curveVertex (x+(.2*w), y+(.25*h));
curveVertex (x+(.3*w), y+(.175*h));
endShape ();



