
// Homework 5
// copyright John Mailley, September 2011, Pittsburgh, PA 15289

int y, x;
color col;

void setup()
{
  size(600, 400);
  background( 0);
  noFill();
  noStroke();
  smooth();
  noCursor();
  frameRate(100);
  rectMode(CENTER);
}

void draw()
{ 
  x = width;  
  
  while( x > 0)
  {
    if (x % 2 == 0)
    {
      col = color( random( 255), random( 255), random( 255));
      fill( col);
    }
    
    else
    {
      fill(255);
    }
    rect( width/2, height/2, x, x);
    x = x - 5;
   
    }
    
      y = height/2;
  while( y > 0 )
  {
    if (y % 2 == 0)
    {
      col = color( random( 256), random( 256), random( 256), 200);
      fill( col);
    }
  
    else
    {
      fill(0);
    }
      ellipse( width/2, height/2, y*1.6, y*1.6);
      y = y - 5;
    }
  
}

void mouseMoved()
 {
    col = color( random( 255), random( 255), random( 255));
    fill( col);
    strokeWeight(1);
    stroke(col);
    triangle( width/2, height/2, mouseX, mouseY, mouseX + 50, mouseY + 50);
    }
    


