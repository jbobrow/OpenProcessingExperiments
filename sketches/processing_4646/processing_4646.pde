
// setting the size of the window and background color
size (220, 300);
background (255,50,50);
smooth();

// draw background border
noFill();
stroke(0);
rect (2, 2, 215, 295);

//draw wings
stroke(0);
fill (0);
triangle (60, 40, 90, 80, 20, 150);
triangle (60, 80, 90, 80, 40, 160);
triangle (50, 80, 120, 80, 80, 160);
triangle (90, 100, 130, 100, 110, 170);
triangle (100, 80, 170, 80, 140, 160);
triangle (130, 80, 160, 80, 180, 160);
triangle (130, 80, 160, 40, 200, 150);

// draw the ears
triangle (90, 40, 100, 80, 80, 80);
triangle (130, 40, 140, 80, 120, 80);

// draw head
ellipseMode (CORNER);
ellipse (80, 55, 60, 45);

// draw eyes
ellipseMode (CORNER);
fill (235);
ellipse (85, 70, 23, 19);
ellipse (112, 70, 23, 19);

// draw pupils
ellipseMode (CENTER);
fill (0);
ellipse (99, 85, 3, 3);
ellipse (126, 85, 3, 3);

// draw eyebrow
rectMode (CORNER);
fill (0);
rect (85,70,50,6);

// draw fangs
fill (255);
triangle (95, 100, 105, 100, 100, 110);
triangle (105, 100, 110, 100, 107, 105);
triangle (110, 100, 115, 100, 113, 105);
triangle (115, 100, 125, 100, 122, 115);

// draw legs
strokeWeight (2);
line (55, 35, 60, 40);
line (60, 35, 60, 40);
line (65, 35, 60, 40);

line (155, 35, 160, 40);
line (160, 35, 160, 40);
line (165, 35, 160, 40);


