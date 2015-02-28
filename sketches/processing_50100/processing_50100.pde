
/*
  Interactive 2
  Weekly Assignment
  Week 1 - Faces003
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
ellipseMode(CORNER);
ellipse(100,108, 110,110);

// Left Eyebrow
strokeWeight(10);
line(100,50, 210,130);

// Right Eye
strokeWeight(3);
ellipse(290,108, 110,110);

// Right Eyebrow
strokeWeight(10);
line(290,130, 400,50);

// Nose
strokeWeight(3);
line(210,164, 210,280);
line(210,280, 290,280);
line(290,280, 290,164);

ellipseMode(CENTER);
arc(155,255, 110,110, 0,PI); // Semicircle on left face
arc(345,255, 110,110, 0,PI); // Semicircle on right face

// Mouth
line(155,310, 155,400);
line(345,310, 345,400);
fill(0);
rect(155,335, 190,110);
stroke(0);
fill(255);
rect(155,445, 190,39);

