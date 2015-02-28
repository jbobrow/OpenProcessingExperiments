
size(500, 500);
smooth();
background(254,255,0);
 
//black outer eyes
noStroke();
fill(0);
ellipse(170, 150, 50, 50);
ellipse(330, 150, 50, 50);

//white eye highlight
fill(255);
ellipse(180, 140, 12, 12);
ellipse(340, 140, 12, 12);
 
//nose
fill(0);
triangle(240,200, 267,200, 254,212);

//cheeks
fill(255,9,0);
stroke(255,84,38);
ellipse(100,200,55,55);
ellipse(400,200,55,55);

//mouth = filled in arc
noFill();
stroke(0);

arc(270, 202, 40, 40,  radians(40),radians(140));  // upper half of circle
arc(240, 202, 40, 40,  radians(40),radians(140));  // upper half of circle


