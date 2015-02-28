
//sahana kumar
//homework 6
//copyright 2013 sahana kumar

float kx, ky, kd, kxSpeed, kySpeed;
float fx, fy, fd, fxSpeed, fySpeed;

PImage fish;
PImage kat;

void setup()
{
  size (400,400);
  kx = 100;
  ky = 100;
  kd = 130;
  kxSpeed=1;
  kySpeed=4;
  
  fx=random(width);
  fy = random(height);
  fd = 100;
  fxSpeed=4;
  fySpeed=2;
  
  fish= loadImage("fish.png");
  kat=loadImage("kitty.png");
  
 
}


void prepWindow()

{
  background(97,98,91);
  smooth();
}
void draw ()
{

  prepWindow ();
moveKat ();
  moveFish ();
  
  drawKat(kx, ky, kd);
 drawFish(fx, fy, fd);
  
}

void moveKat()
{
  kx=kx+kxSpeed; 

  if ((kx > width*.70) || (kx < 0)) 
  {kxSpeed = -kxSpeed;}
  
   ky = ky + kySpeed;

  if ((ky > height*.70) || (ky < 0)) 
  {kySpeed = -kySpeed;}
}

void drawKat (float kx, float ky, float kd)
{  
 image (kat, kx, ky, kd, kd); 
}

void moveFish()
{
 fx=fx+fxSpeed;
if (fx> width)
{fx=-width+fd*2;}
 
fy=fy+fySpeed;
if (fy>height)
{fy=-height+fd*2;}
  
}


void drawFish(float fx, float fy, float fd)
{
image (fish, fx,fy,fd,fd);
}


void keyPressed()
{
  if (key == '1')
  {kxSpeed ++;}

if (key == '2')
  {kxSpeed --;}

}


