
size(300, 300);
background(#1C80BC);

float diameter = 100;
float x = diameter;
float y = 50;



ellipse (x, y, diameter, diameter);
x = x + 100;
y = y + 100;

diameter = diameter + 100;
fill(169,0,0);
ellipse (x / 2, y / 2, diameter, diameter);

x = x / 2;
y = y / 2;

diameter = diameter / 2;
fill(255,0,0);
rectMode(CORNER);
rect (width / 2, height / 2, diameter, diameter);

fill(238, 34);
rect (width * 0.5, height * 0.5, width / 2, height / 2);

strokeWeight(10);
line(50,50,125,200);










