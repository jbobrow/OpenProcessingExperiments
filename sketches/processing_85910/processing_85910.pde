
// Min Kyung Kim
// minkyunk@andrew.cmu.edu
// Copyright Min Kyung Kim January 2013

// style
size (400, 400);
PImage b;
b = loadImage ("universe.jpg");
background (b);
smooth ( );

// rectangles, upper and lower
noStroke ( );
fill (0, 140);
rect (0, 0, 400, 150);
rect (0, 250, 400, 150);

// stripe pattern, upper and lower
int x = 0;
 
while (x < 400) {
  stroke(100);
  strokeWeight(0.5);
  line(x, 0, x, 150);
  x = x + 5;
}

x = 0;

while (x < 400) {
  stroke (100);
  strokeWeight (0.5);
  line (x, 250, x, 400);
  x = x + 5;
}

//rectangles, left and right
fill (0, 180);
noStroke ( );
rect (0, 150, 100, 100);
rect (300, 150, 100, 100);

// The M, overall shape
triangle (100, 150, 190, 150, 145, 250);
// gap between the M and the K
rect (190, 150, 20, 100);
// The K, overall shape
triangle (230, 200, 300, 150, 300, 250);

// The M
stroke (255, 210);
strokeWeight (4);
line (100, 150, 100, 250);
line (100, 150, 145, 250);
line (145, 250, 190, 150);
line (190, 150, 190, 250);
// The K
line (210, 150, 210, 250);
line (230, 200, 300, 150);
line (230, 200, 300, 250);

// stars, outer
stroke (120, 80, 120, 170);
strokeWeight (4);
ellipse (100, 150, 10, 10);
ellipse (100, 250, 10, 10);
ellipse (190, 150, 10, 10);
ellipse (190, 250, 10, 10);
ellipse (210, 150, 10, 10);
ellipse (210, 250, 10, 10);
ellipse (300, 150, 10, 10);
ellipse (300, 250, 10, 10);

// stars, inner
stroke (240);
strokeWeight (7);
point (100, 150);
point (100, 250);
point (190, 150);
point (190, 250);
point (210, 150);
point (210, 250);
point (300, 150);
point (300, 250);

// saveFrame ("hw1.jpg");





