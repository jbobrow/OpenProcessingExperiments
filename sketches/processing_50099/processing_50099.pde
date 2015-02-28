
/*
  Interactive 2
  Weekly Assignment
  Week 1 - Faces002
*/

size(500, 500);
background(#d5d5d5);
smooth();
stroke(0);
strokeWeight(3);
fill(255);

// Face
rect(100,50, 300,350);

// Left Eye
rect(100,130, 110,50);
noStroke();
fill(0);
rect(142,130, 26,50);

// Left Eyebrow
stroke(0);
line(100,130, 155,100);
line(155,100, 210,130);
line(155,50, 155,100); // Vertical Line

// Right Eye
stroke(0);
fill(255);
rect(290,130, 110,50);
noStroke();
fill(0);
rect(332,130, 26,50);

// Right Eyebrow
stroke(0);
line(290,130, 345,100);
line(345,100, 400,130);
line(345,50, 345,100); // Vertical Line

// Nose
stroke(0);
strokeWeight(3);
fill(255);
line(210,180, 210,280);
line(210,280, 290,280);
line(290,280, 290,180);

arc(155,255, 110,110, 0,PI); // Semicircle on left face
arc(345,255, 110,110, 0,PI); // Semicircle on right face

// Mouth
line(155,310, 155,400);
line(345,310, 345,400);
fill(0);
rect(155,335, 190,70);
stroke(0);
fill(255);
rect(155,406, 190,39);

