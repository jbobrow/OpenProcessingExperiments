
//Lauren Hartman
//lmhartma@andrew.cmu.edu
//Ã�Â© Lauren Hartman, September 2013

float x, y, wd, ht;

void setup ()
{
  size (400, 400);
  smooth ();
  background (255,255,255);
  x = width* .5;
  y = height* .5;
  wd = width* .30;
  ht = height* .30;
  frameRate (8);
}

void draw ()
{
  smooth ();
  noStroke();
  fill ( 255, 255, 255, 100);
  rect (0, 0, width, height);
  
  stroke ( 90, 180, 180);
  strokeWeight(3);
  noFill();
  ellipse (x, y, wd, ht);
  
  stroke (90, 180, 180);
  strokeWeight(3);
  noFill();
  ellipse (x+.5, y+.5, wd*.50, ht*.50);
  
  stroke (90, 180, 180);
  strokeWeight(3);
  noFill();
  ellipse (x+.5, y+.5, wd*.1, ht*.10);
}

void mousePressed()
{
  stroke (90, 180, 180);
  strokeWeight(16);
  noFill();
  ellipse (x, y, wd, ht);
}
void keyPressed()
{

  if ( key == CODED )
  {
    if ( keyCode == UP )
    {
      y = y - 8;
    }
    else if (keyCode == DOWN )
    {
      y = y + 8;
    }
    else if (keyCode == RIGHT )
    {
      x = x + 8;
    }
    else if (keyCode == LEFT)
    {
      x = x - 8;
    }
  }
}
void mouseReleased ()
{
  wd=random (5, 200);
  ht=wd;
}
