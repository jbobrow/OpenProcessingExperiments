
// Narahari Bharadwaj (nbharad)
// Copyright 2014

size(400, 400);
background(128, 0, 128);
float x = width*0.5;
float y = height*0.5;
smooth();
fill(0, 255, 0);
stroke(200, 400, 300);
strokeWeight(2);
ellipse(x, y, x*0.75, y*0.75);
fill(255, 0, 0);
stroke(127, 127, 127);
strokeWeight(2);
ellipse(x, y, x*0.5, y*0.5);
fill(0, 0, 255);
stroke(100, 300, 200);
ellipse(x, y, x*0.25, y*0.25);
stroke(0, 0, 0);
strokeWeight(1);
line(x*0.875, y, x*1.125, y);
line(x, y*0.875, x, y*1.125);
fill(255, 255, 255);
textSize(15);
text("25", x*0.65, y);
text("50", x*0.775, y);
fill(204, 102, 0);
triangle(x*0.875, y, x*1.125, y, x, y*0.875);
triangle(x*0.875, y, x*1.125, y, x, y*1.125);
stroke(0, 0, 0);
strokeWeight(5);
point(x, y);
strokeWeight(1);
line(x, y*0.875, x, y*1.125);
fill(255, 255, 255);
textSize(8);
text("100", x*0.9, y);


