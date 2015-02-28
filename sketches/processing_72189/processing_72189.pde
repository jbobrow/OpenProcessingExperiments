
//Homework #6
//Copyright 2012 Edmund Chow ezc@andrew.cmu.edu

float bx, by, bd, bxSpeed, bySpeed, x, y, d, xSpeed, ySpeed;
 
void setup ()
{
  size (400, 400);
  smooth ();
  background (0,0,0);
  bx = 100;
  by = 100;
  bd = 50;
  bxSpeed = 8;
  bySpeed = -5;
  x = 200;
  y = 200;
  d = 100;
  xSpeed = 3;
  ySpeed = 2;   
}
 
void draw ()
{
  background (255, 215, 10 );
  prepWindow();
  bounceBrowncolor();
  browncolor ();
  wrapGreencolor();
  greencolor ();
}
 
void prepWindow ()
{
  fill (255, 10);
  rect ( 0, 0, width, height);
}

void bounceBrowncolor() {
    
   bx += bxSpeed;
   by += bySpeed; 
   if (bx < bd/2 || bx > width - bd/2)
   {
      bxSpeed= -bxSpeed;
   } 
   if (by < bd/2 || by > height - bd/2)
   {
      bySpeed= -bySpeed;
   }
}
 
void browncolor()
{
  fill (180, 130, 10);
  strokeWeight (2.5);
  stroke (160, 135, 15);
  ellipse (bx, by, bd-10, bd-10);
}

void wrapGreencolor()
 {
  x= x+xSpeed;
  if (x > width + 100)
  {
    x= 0;
  }
  y= y+ySpeed;
  if (y > height+100)
  {
    y= 0;
  }
}
     
void greencolor()
{
fill (60, 180, 110);
strokeWeight (0);
stroke (75, 195, 105);
ellipse (x, y, d+10, d+10);
}
void keyPressed()// When spacebar is pressed the circles are relocated and resized randomly.
{ 
  if (key==' ')
  bx = random (0, 400);
  by = random (0, 400);
  bd = random (25, 75);
  x = random (100, 300);
  y = random (100, 300);
  d = random (50, 150);
}

//saveFrame(Homework6);

