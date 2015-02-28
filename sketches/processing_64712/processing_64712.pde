
/*
CirclelessCircle
By Ryan Tabler
Created 23 June 2012
Version 1.0
This program graphs a circle on screen without ever using the circle() command.
*/

int xcoord = 0; //Actual x-position on screen
int ycoord = 0; //Actual y-position on screen
int xcoordc, ycoordc; //x-position and y-position variables adjusted to do calculations needed to graph a circle.

void setup()
{
  size(400,400);
  background(0); //Black background
  stroke(0,255,0); //Green brush
  //strokeWeight(5);
  frameRate(4000); //Fast frame rate
  fill(0,255,0);
}

void draw()
{
  xcoordc = xcoord - 200; //setting adjusted x- and y-positions
  ycoordc = ycoord - 200;
  if ((xcoordc * xcoordc + ycoordc * ycoordc > 21000) && (xcoordc * xcoordc + ycoordc * ycoordc < 24000))
  //If the x- and y-points are within a circle, then graph that point
  {
    rect(xcoord-1.5,ycoord-1.5,3,3);
  }
  
  xcoord += 5;//Increment the x-point by 5 when done, moving left to right across the screen
  
  if (xcoord > width) //When the x-coord goes over the width, then reset x-position, and increment y-position
  {
    xcoord = 0;
    ycoord += 5;
  }
  
  if (ycoord > height) //When y-position goes over the height, then stop the program
  {
    noLoop();
  }
}


