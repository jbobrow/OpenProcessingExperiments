

size(500, 500); // set the size of the window
background(255); // draw a white background
smooth (); // smooth (); allows anti aliasing.

//set ellipses and rects to center mode
ellipseMode(CENTER);
rectMode(CENTER);

//zoog's body
stroke(0);
fill(150);
rect(100,100,20,100);

//zoog's head
fill(255);
ellipse(100,70,60,60);
fill(0);

//Zoog's eyes
ellipse(81,70,16,32);
ellipse(119,70,16,32);
stroke(0);

// Zoog's legs
line(90,150,80,160);
line(110,150,120,160);



