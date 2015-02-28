
size (300, 300);
background (#C9ECFF);

float x;
x = 129;
float y;
y = 80.5;
float diameter;
diameter = 50;
ellipse (x, y, diameter, diameter);

x = x + 100;
y = y + 100;
diameter = diameter + 100;
ellipse (x, y, diameter, diameter);

x = x /2;
y = y / 2;
diameter = diameter / 2;
ellipse (x, y, diameter, diameter);

fill (0, 255, 0);
stroke ( 60);
ellipse (55, 210, width / 2, width / 2);

fill (#D202EA);
stroke(#0F8614);
strokeWeight (5);
rect (40,200, width / 8, height / 8);

fill (#291EC9);
stroke(255, 0, 0);
strokeWeight(1);
triangle(40, 200, 40, 238 , 78, 200);

stroke (0);
line (1, 1, 1, 299);
line (1*8, 1, 1*8, 299);
line (2*16, 1, 2*16, 299);
line (3*32, 1, 3*32, 299);
line (4*64, 1, 4*64, 299);










