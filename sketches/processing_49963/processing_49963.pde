
// Homework #2 48-257
// Humaira Tasnim htasnim Copyright 2012

size (400, 400);
smooth ();
background (2, 78, 104);

float x, y, diameter, wd, ht;
x = 200;
y = 200;
diameter = 700;
wd = diameter/2;
ht = diameter/2;

fill (33, 98, 120);
noStroke ();
ellipse (x, y, wd, ht);

// Initials
noFill();
strokeWeight (5);
stroke (97, 180, 207);

// h
beginShape ();
  vertex (x - (0.25 * wd), y - (0.25 * ht));
  vertex (x - (0.25 * wd), y + (0.25 * ht));
  curveVertex (x - (0.25 * wd), y);
  curveVertex (x - (0.25 * wd), y);
  curveVertex (x - (0.05 * wd), y - (0.06 * ht));
  curveVertex (x - (0.025 * wd), y + (0.45 * ht));
  curveVertex (x - (0.025 * wd), y + (0.45 * ht));
endShape ();

// t
beginShape();
  curveVertex (x + (0.025 * wd), y - (0.45 * ht));
  curveVertex (x + (0.025 * wd), y - (0.45 * ht));
  curveVertex (x + (0.025 * wd), y + (0.05 * ht));
  curveVertex (x + (0.1 * wd), y + (0.25 * ht) + (0.06 * ht));
  curveVertex (x + (0.25 * wd), y + (0.25 * ht));
  curveVertex (x + (0.25 * wd), y + (0.25 * ht));
endShape();

beginShape();
  vertex (x + (0.025 * wd), y - (0.2 * ht));
  vertex (x + (0.2 * wd), y - (0.2 * ht));  
endShape();

//saveFrame("hw2.jpg");

