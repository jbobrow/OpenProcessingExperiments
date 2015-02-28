
import processing.video.*;
MovieMaker mm; // Declare MovieMaker object
boolean recording = false;

ArrayList al;
int ballSizeRandomMax = 40;
int numberOfBounces = 5;
void setup()
{
size(1500, 500);
//smooth();
al = new ArrayList();
fill(50);
}
void draw()
{
background(0);
noStroke();
if(mousePressed)
{
al.add(new movingBall(mouseX, mouseY));
}
for(int i=al.size()-1; i >= 0; i--)
{
movingBall mb = (movingBall) al.get(i);
mb.disp();
}if(recording)
mm.addFrame(); // Add window's pixels to movie
}
class movingBall
{
int s;
float xMovement;
float startingX;
int startingY;
int bounceCount =20;
int direction = 1;
float rand = random(30);
int speed = 10;
movingBall(int xpos, int ypos)
{
s = ypos-1;
xMovement = xpos;
startingX = xpos;
startingY = ypos;
}
void disp()
{
float ballSize = random (0,ballSizeRandomMax);
for (int i = 0; i<ballSize ; i++)
{
fill (random(90),random(90),random(90));
ellipse(xMovement,s, ballSize-i, ballSize-i);
}
xMovement= xMovement+ rand;
if(s>height )
speed = -speed;
if(s<0 )
speed = -speed;
if(xMovement>width)
rand = -rand;
if(xMovement<0)
rand = -rand;
}
}



                
                
