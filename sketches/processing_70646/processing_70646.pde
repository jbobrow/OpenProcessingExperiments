
void setup() {
size(512, 512);          // size of the background
}
void draw() {
background (128);
rectMode (CENTER);       // center mode...
ellipseMode (CENTER);    // ...for both

//draw head
stroke (0);
fill (230, 15, 0);
rect (45, 35, 50, 50);
fill (100,50,150);
ellipse (35, 25, 10, 10);
ellipse (55, 25, 10, 10);
fill (255);
rect (45, 45, 30, 10);
line (30, 40, 40, 50);
line (40, 40, 40, 50);
line (50, 40, 50, 50);
line (60, 40, 50, 50);

//draw body
ellipse (45, 90, 50, 40);
fill (80, 80, 200);
ellipse (45, 90, 30, 10);

//draw legs and feet
fill (80, 160, 20);
rect (20, 135, 20, 10);
rect (70, 135, 20, 10);
fill (0);
line (30, 105, 30, 130);
line (60, 105, 60, 130);

//draw hand
fill (170);
ellipse (90, 80, 15, 15);
ellipse (12, 90, 15, 15);
}
