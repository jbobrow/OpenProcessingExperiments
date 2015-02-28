
// homework 2, 51-257 A
// Min Kyung Kim
// minkyunk@andrew.cmu.edu
// Copyright Min Kyung Kim January 2013. All rights reserved.


// style
size (400, 400);
background (#B0C4DE);
smooth ( );

float x, y, wd, ht;
x = 100;
y = 100;
wd = 100;
ht = 100;

// temporary bounding box
noStroke ( );
fill (#B0C4DE);
rect (x * 0.5, y * 0.5, wd + y * 2, ht + y * 2);

// face
fill (#FFE4C4);
ellipse ( x + wd , y + ht , wd + y * 2, ht + y * 2 );

// glasses
fill (230);
stroke (100);
strokeWeight (8);
ellipse ( x + wd * 0.25, y + ht, wd, ht - y * 0.25 );
ellipse ( x + wd * 1.75, y + ht, wd, ht - y * 0.25 );
line ( x + wd * 0.75, y + ht, x + wd * 1.25, y + wd);

// left eye
stroke (0);
strokeWeight (10);
beginShape ( );
  curveVertex ( x + wd * 0.10, y + ht * 1.2 );
  curveVertex ( x + wd * 0.12, y + ht * 1.05);
  curveVertex ( x + wd * 0.25, y + ht * 0.92);
  curveVertex ( x + wd * 0.38, y + ht * 1.05);
  curveVertex ( x + wd * 0.40, y + ht * 1.2);
endShape ( );

// right eye
beginShape ( );
  curveVertex ( x + wd * 1.60, y + ht * 1.2 );
  curveVertex ( x + wd * 1.62, y + ht * 1.05);
  curveVertex ( x + wd * 1.75, y + ht * 0.92);
  curveVertex ( x + wd * 1.88, y + ht * 1.05);
  curveVertex ( x + wd * 1.90, y + ht * 1.2);
endShape ( );

// mouth
noStroke ( );
fill (#DB5093);
ellipse ( x + wd, y + ht * 2, wd - x * 0.5, ht - y * 0.75);


// The "M", bottom
// mustache, lower left
stroke (#F0F8FF);
strokeWeight (25);
beginShape ( );
  curveVertex ( x - wd * 0.7, y + ht * 2);
  curveVertex ( x + wd * 0.35, y + ht * 1.98);
  curveVertex ( x + wd * 0.5, y + ht * 1.96);
  curveVertex ( x + wd, y + ht * 1.85);
  curveVertex ( x + wd * 1.5 , y + ht * 1.75);
endShape ( );

// mustache, lower right
beginShape ( );
  curveVertex ( x + wd * 0.5, y + ht * 1.75);
  curveVertex ( x + wd, y + ht * 1.85);
  curveVertex ( x + wd * 1.5, y + ht * 1.96);
  curveVertex ( x + wd * 1.65, y + ht * 1.98);
  curveVertex ( x + wd * 2.5, y + ht * 2);
endShape ( );

// mustache, upper left
stroke (#F0F8FF);
strokeWeight (30);
beginShape ( );
  curveVertex ( x - wd * 0.7, y + ht * 2);
  curveVertex ( x + wd * 0.25, y + ht * 1.95);
  curveVertex ( x + wd * 0.4, y + ht * 1.88);
  curveVertex ( x + wd * 0.75, y + ht * 1.6);
  curveVertex ( x + wd * 1.1, y + ht * 0.7);
  endShape ( );

// mustache, upper right
beginShape ( );
  curveVertex ( x + wd * 1.1, y + ht * 0.7);
  curveVertex ( x + wd * 1.25, y + ht * 1.6);
  curveVertex ( x + wd * 1.6, y + ht * 1.88);
  curveVertex ( x + wd * 1.8, y + ht * 1.95);
  curveVertex ( x + wd * 2.8, y + ht * 2);
  endShape ( );

// mustache, middle
strokeWeight (27);
line ( x + wd * 0.75, y + ht * 1.6, x + wd, y + ht * 1.85);
line ( x + wd * 1.25, y + ht * 1.6, x + wd, y + ht * 1.85);

// The "M", top
// hair, left
strokeWeight (70);
beginShape ( );
  curveVertex ( x - wd, y + ht);
  curveVertex ( x - wd * 0.5, y + ht * 0.6);
  curveVertex ( x + wd * 0.1, y + ht * 0.1);
  curveVertex ( x + wd * 0.55, y - ht * 0.5); 
  curveVertex ( x + wd, y - ht);
endShape ( );

// hair, right
beginShape ( );
  curveVertex ( x + wd, y - ht);
  curveVertex ( x + wd * 1.45, y - ht * 0.5);
  curveVertex ( x + wd * 1.9, y + ht * 0.1);
  curveVertex ( x + wd * 2.5, y + ht * 0.6);
  curveVertex ( x + wd * 3, y + ht);
endShape ( );

// hair, middle
line ( x + wd * 0.55, y - ht * 0.5, x + wd, y + ht * 0.05);
line ( x + wd, y + ht * 0.05, x + wd * 1.45, y - ht * 0.5);

// saveFrame ("hw2.jpg");




