
size(300, 300);
background(#70A2DE);

float x = 50;
float y = 100;
float diameter = 150;

fill(255, 255, 255, 200);

ellipse(x, y, diameter, diameter);

x = x + 100;
y = y + 100;
diameter = diameter + 100;

ellipse(x, y, diameter, diameter);

x = x / 2;
y = y / 2;
diameter = diameter / 2;

ellipse(x, y, diameter, diameter);

fill(156, 201, 132, 200);
rect(width*.4, height*.6, width*.2, height*.4);

fill(206, 182, 94, 200);
ellipse(width, height, width*.8, height*.8);

fill(206, 131, 94, 200);
triangle(0, height*.5, 0, height, width*.5, height);

strokeWeight(3);
line(0, 0, width, height);

line(width*.05, 0, width, height*.95);

line(width*.15, 0, width, height*.85);

line(width*.3, 0, width, height*.7);

line(width*.5, 0, width, height*.5);



