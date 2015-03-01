
int blue = 0;
int red = 0;
int green= 0;
int yellow = 255;
int magenta = 0;
int X1 = 10;
int Y1 = 10;
int X2 = 10;
int Y2 = 10;
int X3 = 10;
int Y3 = 10;
int height = 10;
int width = 10;
void setup() 
{
size(1000, 1000);
background(255); //set background white
}
void draw() 
{
stroke(0, 0, 0);
fill(0, 0, blue);
ellipse(X1, Y2, height, width);
stroke(0, 0, 0);
fill(red, 0, 0);
rect(X1, Y2, height, width);
fill(0, green, 0);
triangle(X1, Y1, X2, Y2, X3, Y3);
fill(255, yellow, magenta);
rect(X1, Y2, height, width);
red++;
blue++;
green++;
yellow--;
magenta++;
X1++;
Y1++;
X2++;
Y2++;
X3++;
Y3++;
height++;
width++;
}
