
// Homework #1
// Humaira Tasnim htasnim Copyright 2012

size (400, 400);
smooth ();

// Background
background (21, 95, 129);
stroke (216, 48, 68);
line (200, 200, 400, 0);
line (198, 198, 396, 0);
line (196, 196, 392, 0);
line (194, 194, 388, 0);
line (192, 192, 384, 0);
point (190, 190);
point (200, 180);
point (210, 170);
point (220, 160);
point (230, 150);
point (240, 140);
point (250, 130);
point (260, 120);
point (270, 110);
point (280, 100);
point (290, 90);
point (300, 80);
point (310, 70);
point (320, 60);
point (330, 50);
point (340, 40);
point (350, 30);
point (360, 20);
point (370, 10);

noStroke ();
fill (216, 48, 68);
triangle (400, 0, 200, 200, 400, 400);

// H
fill (255, 255, 255);
rect (0, 75, 50, 25);
rect (50, 100, 25, 200);
ellipse (62.5f, 300, 25, 25);
arc (50, 100, 50, 50, TWO_PI-PI/2, TWO_PI);

quad (75, 200, 150, 200, 150, 225, 75, 225);

rect (150, 50, 25, 310);
rect (175, 360, 250, 25);
ellipse (162.5f, 50, 25, 25);
arc (175, 360, 50, 50, PI/2, PI);

// T
rect (270, 20, 25, 300);
ellipse (282.5f, 320, 25, 25);

rect (220, 20, 200, 25);
ellipse (220, 32.5f, 25, 25);

//saveFrame("hw1.jpg");

