
// Raymond Liaw - rliaw@andrew.cmu.edu
// Copyright 2012

size(400,400);
// Set background color
background(51);

// No stroke and smooth
noStroke();
smooth();

// Background
fill(245, 191, 45);
ellipse(250, 100, 800, 550);
fill(200, 154, 29);
ellipse(250, 95, 800, 550);
fill(255);

// R
rect(140, 145, 30, 120);
// Serif
rect(125, 168, 20, 8);
fill(200, 154, 29);
arc(125, 144, 70, 50, 0, PI/2);
fill(255);
// R base
rect(118, 257, 73, 8);
// R end
ellipse(195, 165, 34, 34);
// R connector
beginShape();
vertex(169, 175);
bezierVertex(175, 158, 185, 150, 192, 149);
vertex(192, 175);
bezierVertex(182, 177, 176, 175, 170, 188);
endShape();

// L
rect(240, 95, 30, 170);
// Serif
rect(225, 109, 20, 8);
fill(200, 154, 29);
arc(225, 94, 70, 30, 0, PI/2);
fill(255);
// L base
rect(218, 257, 73, 8);

//saveFrame("hw1.jpg");

