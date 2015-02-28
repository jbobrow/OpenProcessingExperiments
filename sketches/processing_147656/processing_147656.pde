
//Pong WIP
//Jordyn Marshall McKenzie-Gray
//Created using Processing in Ubuntu 12.04

//variables for location of ball
int x; //
int y;
//variables for speed of ball
int xc = 7;
int yc = 7;
//variables for left paddle
int leftPaddle;
//variables for right paddle
int rightPaddle;

void setup()
{
rectMode(CENTER);
size (800,600);
x = width /2;
y = height/2;
leftPaddle = height/2;
rightPaddle = height/2;
}

void draw()
{
background (0);
fill (255);
//draw the ball
ellipse (x, y, 20, 20);
//move the ball
x = x + xc;
y = y + yc;

//draw left paddle
rect(20, mouseY, 10, 50);

//draw right paddle
rect(780, mouseY,10,50);

//check for bottom of screen
if (y > height - 10)
{
yc = yc * -1;
}

//check for the right of the screen
if (x > width - 10)
{
xc = xc * -1;
}

//check top of screen
if (y < 10)
{
yc = yc * -1;
}

//check left of screen
//modified for paddle
if (x < 35 && y > (mouseY - 25) && y < (mouseY + 25))
{
xc = xc * -1;
}

//code if ball exits playing area
//put ball back in random location
if (x < 0)
{
x = width /2;
y = int(random(0, height));
}

//code to keep paddle on screen
if (leftPaddle < 25)
{
leftPaddle = 25;
}

if (leftPaddle > height - 25)
{
leftPaddle = height -25;
}

}
