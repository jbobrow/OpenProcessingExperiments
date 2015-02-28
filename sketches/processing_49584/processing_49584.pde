
// Amanda Fung
// January 19, 2012

size(640, 360);
background(220, 220, 200);
smooth();

// Red Quad Behind Black Circle
noStroke();
fill(218, 21, 18);
quad(-42, 1, 170, -60, 205, 60, -10, 120);

// Blue Square
fill(105, 160, 200);
rect(475, -10, 175, 125);

// Black Circle
fill(30);
ellipse(347, 284, 700, 700);

// Gray Quad Next To Yellow Quad
fill(150);
quad(520, 304, 535, 365, 378, 402, 363, 343);

// Red Quad
int x = 159;
int y = 102;
int x2 = 209;
int y2 = 126;
int x3 = 110;
int y3 = 350;
fill(218, 21, 18);
quad(x, y, x2, y2, x3, y3, 62, 326);

// Red Quad In Right Corner
quad(358, 62, 367, 70, 653, 2, 647, -7);

// Gray Quad In Right Corner
fill(200);
quad(349, 25, 357, 60, 630, -5, 620, -40);

// Gray Quad Attached to Red Quad Behind Yellow Quad
int x4 = 314;
int y4 = 88;
fill(210, 210, 190);
quad(x, y, x2, y2, x4, y4, 267, 64);

// 2nd Gray Quad Attached to Red Quad Behind Yellow Quad
stroke(0);
strokeWeight(.1);
fill(220, 220, 200);
quad(x2, y2, x4, y4, 200, 347, x3, y3);

// Yellow Quad
noStroke();
fill(240, 200, 100);
quad(356, 249, 385, 377, 1, 467, -30, 338);

