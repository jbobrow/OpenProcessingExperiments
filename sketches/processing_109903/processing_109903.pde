
size(300, 300);
background(#8DDEFA);

int x = 50;
int y = 75;
int diameter = 50;
float vince = 2.57;

// 3 seperate shapes with different sizes
{
fill(0);
rectMode(CENTER);
rect(width / 4, height / 4, 120, 110);

fill(#EDF3F5);
triangle(0, height / 2, width / 2, width, 50, 50);

fill(#FA0026);
quad(height / 2, width, 2, 250, 250, 250, 250, 250);
}

// 3 ellipse with increasing size
{
fill(200,1250,85);
ellipse(x, y, diameter, diameter);

x = x + 100;
y = y + 100;
diameter = diameter + 100;
ellipse(x, y, diameter, diameter);

x = x / 2;
y = y / 2;
diameter = diameter / 2;
ellipse(x, y, diameter, diameter);
}

//5 lines with increasing distance
{
x= x * 20;
y= y * 20;
line(x,y,100,100);

x= x * 40;
y= y * 40;
line (x,y, 125, 125);

x = x * 60;
y = y * 60;
line(x,y, 115, 135);

x = x * 80;
y = y * 80;
line(x, y, 95, 145);

x = x * 85;
y = y * 85;
line(x,y, 125, 150);
}









