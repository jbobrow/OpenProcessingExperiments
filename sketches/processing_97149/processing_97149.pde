
size(400, 50);
background(255, 20, 147);
int x;
int y;
x=40;
y=10;
line(0, y*2.5, x*10, y*2.5);
ellipseMode(RADIUS);
fill(0, 255, 0);
ellipse(0, y*5, x, x);
ellipse(y*8, 0, x, x);
ellipse(y*16, y*5, x, x);
ellipse(y*24, 0, x, x);
ellipse(y*32, y*5, x, x);
ellipse(y*40, 0, x, x);
