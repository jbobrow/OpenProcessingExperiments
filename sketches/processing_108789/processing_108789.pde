
// Written by Jose Pertierra
// jpertier@andrew.cmu.edu
// Copyright Jose Periterra (September 3, 2013) All Rights Reserved

size(400, 400);
background(179, 18, 18);

// variables

float x = 200;
float y = 200;
float wd = 300;
float ht = 300; 

// face
noStroke();
fill(240, 196, 139);
ellipse(x, y, wd, ht);
ellipse(x - wd*.5, y, wd*0.1, ht*0.1);
ellipse(x + wd*.5, y, wd*0.1, ht*0.1);
fill(168, 102, 68);
ellipse(x - wd*.5, y, wd*0.01, ht*0.01);
ellipse(x + wd*.5, y, wd*0.01, ht*0.01);
fill(255, 255, 255);
arc(x, y - ht*.38, wd*0.65, ht*0.25, PI, TWO_PI);
arc(x - wd*0.38, y - ht*0.2, wd*0.2, ht*0.4, radians(125), radians(305));

// nose
noFill();
strokeWeight(2);
stroke(133, 80, 20);
beginShape();
  curveVertex(x, y - ht*0.25);
  curveVertex(x, y - ht*0.25);
  curveVertex(x + wd*0.25, y + ht*0.25);
  curveVertex(x, y + wd*0.25);
  curveVertex(x - wd*0.25, y + ht*0.25);
endShape();

// glasses
fill(255, 255, 255);
strokeWeight(2);
stroke(212, 127, 17);
line(x - wd*0.2, y - ht*0.3, x + wd*0.2, y - ht*0.3);
ellipse(x + wd*0.2, y - ht*0.2, wd*0.25, ht*0.25);
stroke(0, 0, 0);
ellipse(x - wd*0.2, y - ht*0.2, wd*0.25, ht*0.25);

// eyes

noStroke();
fill(31, 138, 209);
ellipse(x - wd*0.2, y - ht*0.2, wd*0.05, ht*0.05);
ellipse(x + wd*0.2, y - ht*0.2, wd*0.05, ht*0.05);
fill(0, 0, 0);
ellipse(x - wd*0.2, y - ht*0.2, wd*0.02, ht*0.02);
ellipse(x + wd*0.2, y - ht*0.2, wd*0.02, ht*0.02);

// mustache and mouth

fill(168, 102, 68);
arc(x, y + ht*0.4, wd*0.08, ht*0.05, 0, PI);
fill(255, 255, 255);
beginShape();
  curveVertex(x - wd*0.25, y + ht*0.50);
  curveVertex(x - wd*0.25, y + ht*0.50);
  curveVertex(x, y + ht*0.30);
  curveVertex(x + wd*0.25, y + ht*0.50);
  curveVertex(x, y + ht*0.40);
  curveVertex(x - wd*0.25, y + ht*0.50);
  curveVertex(x - wd*0.25, y + ht*0.50);
endShape();


