
size(500,500); // set the size of the window
background(255); //draw a white background
smooth();

// set ellipses and rects to CENTER mode
ellipseMode(CENTER);
rectMode(CENTER);

// draw Gooz's body
stroke(0);
fill(150);
rect(250,250, 20,100);

// draw Gooz's head
fill(255);
ellipse(250,220, 60,60);

// draw Good's eyes
fill(0);
ellipse(231,220, 16,32);
ellipse(269,220,16,32);

// draw Gooz's legs
line(240,300,230,310);
line(260,300,270,310);


