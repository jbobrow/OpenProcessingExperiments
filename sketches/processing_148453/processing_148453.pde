
//variables for location of ball 
int x; //
int y; 
//variables for speed of ball 
int xc = 1;
int yc = 1;

void setup()
{
size (800,600);
x = width /2;
y = height/2;

}

void draw()
{
background (0);
fill (255);
ellipse (x, y, 20, 20);
//move the ball
x = x + xc;
y = y + yc;

//check for bottom of screen 
if (y > height - 10)
{
yc = yc * -1;
}
}
//make the ball bounce off all four sides 
