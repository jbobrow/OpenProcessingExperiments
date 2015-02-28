
class Ball
{

int wWidth;
int wHeight;
int bSize;
int x, y;
int xDirection, yDirection;

Ball(int windowWidth, int windowHeight, int ballSize)
{
wWidth = windowWidth;
wHeight = windowHeight;
bSize = ballSize;
x = 1;
y = 1;
xDirection = 1;
yDirection = 1;
}

Ball(int windowWidth, int windowHeight, int ballSize, int xPosition, int
yPosition)
{
this(windowWidth, windowHeight, ballSize);
x = xPosition;
y = yPosition;
}

void compute()
{
if (x < wWidth && x > 0)
{

x += xDirection;
}
else
{

xDirection = xDirection * -1;
x += xDirection;
}
if (y < wHeight && y > 0)
{
y += yDirection;
}
else
{
yDirection = yDirection * -1;
y += yDirection;
}
}
void display()
{
compute();
ellipseMode(CENTER);
fill(223, 216, 196);
ellipse(x,y,bSize,bSize);
}
}
Ball aBall, anotherBall;
void setup()
{
size(300,213);
aBall = new Ball(width,height,80);
anotherBall = new Ball(width,height,90,200,45); 
}
void draw()
{
background(255);
aBall.display();
anotherBall.display();
}

