
//Carl Haas
size(300, 300);
background(100, 150, 250);
float x = 50;
float y = 50;
float diameter = 100;

ellipse(x, y, diameter, diameter);



x = x+100;
y = y+100;
diameter = diameter+100;


ellipse(x, y, diameter, diameter);

x = x/2;
y = y/2;
diameter = diameter/2;


ellipse(x, y, diameter, diameter);

// three different shapes
fill(250, 0, 0);
rect(30, 75, width/2, height/2);
noFill();

fill(0, 250, 0);
ellipse(200, 75, width/4, height/4);
noFill();

fill(0, 0, 250);
triangle(0, height/4, width/2, 0, width/3, height/4);
noFill(); 

// five lines
float a = 10;
float b = 50;
float c = 10;
float d = 200;
line(a, b, c, d);
line(a*2, b, c*2, d);
line(a*4, b, c*4, d);
line(a*8, b, c*8, d);
line(a*16, b, c*16, d);



