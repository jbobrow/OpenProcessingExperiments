
size(300, 300);
background(#2CE1F0);
float x = 50;
float y = 50;
float diameter = 100;

ellipse(x, y, diameter, diameter);

x = x + 100;
y = y + 100;
diameter = diameter + 100;
ellipse(x, y, diameter, diameter);

x = x / 2;
y = y /2;
diameter = diameter / 2;
ellipse(x, y, diameter, diameter);

rectMode(CENTER);
fill(#F08B2C);
triangle(0 , 20, width / 2, 0 , width, 20);
fill(25, 0, 70);
ellipse(150, 150, width * 0.5, height * 0.5);
fill(0, 255, 180);
rect(width / 2, height / 2, 50, 50);


int x1, x2, y1, y2;
x1 = 12;
x2 = 12;
y1 = 2;
y2 = 300;

line(x1 , y1, x2, y2);

x1 = x1 * 2;
x2 = x2 * 2;

line(x1 , y1, x2, y2);

x1 = x1 * 2;
x2 = x2 * 2;

line(x1 , y1, x2, y2);

x1 = x1 * 2;
x2 = x2 * 2;

line(x1 , y1, x2, y2);
x1 = x1 * 2;
x2 = x2 * 2;

line(x1 , y1, x2, y2);




