
size (720, 480);
smooth ();
strokeWeight(2);
background (120, 36, 50);
ellipseMode (RADIUS);

// Neck
stroke (145); 
line (280, 257, 299, 1175);
line (276, 257, 276, 162);
line (286, 257, 286, 162);

// Antennae 
line (280, 34, 246, 112);
line (300, 155, 306, 56) ;
line (276, 155, 342, 170);

// Body
noStroke ();
fill (140, 134, 27);
ellipse (220, 336, 55, 55);
fill (10, 45, 100);
rect (219, 275, 95, 120);
fill (100, 67, 60);
rect (219, 325, 90, 6);

// Head
fill (255);
ellipse (276, 155, 55, 55);
fill (153, 45, 123);
ellipse (295, 159, 12, 12);
fill (0);
ellipse (269, 150, 3, 3);
fill (153, 45, 123);
ellipse (263, 150, 14, 14);
ellipse (272, 185, 10, 10);
