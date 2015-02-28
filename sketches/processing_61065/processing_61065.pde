
int x1 = 25;
int y1 = 275;
  
int x2 = 150;
int y2 = 25;
  
int x3 = 275;
int y3 = 275;

int delta = 10;
int selector = 0;

void setup()
{
  size(300, 300);
}

void draw()
{
  background(0,180,0);
  triangle(x1,y1, x2, y2, x3, y3);
  ellipse(x1,y1,delta,delta);
  ellipse(x2,y2,delta,delta);
  ellipse(x3,y3,delta,delta);
}

void mousePressed()
{
  if ( sqrt(sq(x1 - mouseX) + sq(y1 - mouseY)) < delta )
  {
    selector = 1; 
  }
  else if ( sqrt(sq(x2 - mouseX) + sq(y2 - mouseY)) < delta )
  {
    selector = 2; 
  }
  else if ( sqrt(sq(x3 - mouseX) + sq(y3 - mouseY)) < delta )
  {
    selector = 3;
  }
  else
  {
    selector = 0;
  }
}

void mouseReleased()
{
  selector = 0;
}

void mouseDragged()
{
  if (selector == 1)
  {
    x1 = mouseX;
    y1 = mouseY;
  }
  else if (selector == 2)
  {
    x2 = mouseX;
    y2 = mouseY;
  }
  else if (selector == 3)
  {
    x3 = mouseX;
    y3 = mouseY;
  }
}
