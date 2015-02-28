
int x = 50;
int y = 50;
int w = 25;
int h = 25;
int x2 = 10;
int y2 = 50;
int w2 = 30;
int h2 = 30;
int x3 = 30;
int y3 = 30;
int w3 = 35;
int h3 = 35;

int state = 1;
int speed = 1;
boolean insidepress = false;
boolean insidecolor = false;
boolean insideshape = false;

void setup()
{
  size (200,200);
}

void draw()
{
  background (84, 10, 93);
  rect (x, y, w, h);
  if (x < 0 || x >= width || y < 0 || y >= height)
  {
    speed = speed * -1;
  }
  
  if (insidepress)
    {
      x = x;
      y = y;
    }
    else
    {
      x = x + speed;
      y = y + speed;
    }

  if (insidepress)
    {
      x = x;
      y = y;
    }
    rect (x2, y2, w2, h2);
    if (x2 < 0 || x2 >= width)
    {
      speed = speed * -1;
    }
    
    x2 = x2 + speed;
    if (insidecolor)
    {
      rect (x, y, w, h);
      fill (255,287,67);
      rect (x2, y2, w2, h2);
      fill (255);
    }
    if (insideshape)
    {
      rect (x3,y3,80,40);  
    }
    else 
    {
    rect (x3, y3, w3, h3);
    }
    if (y3 < 0 || y3 >= height)
    {
      speed = speed * -1;
    }
    y3 = y3 + speed;
 
}

void mousePressed()
{
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)
  {
    insidepress = !insidepress;
   
  }
  
  if (mouseX > x2 && mouseX < x2+w2 && mouseY > y2 && mouseY < y2+h2)
  {
    insidecolor = !insidecolor;
  }
  if (mouseX > x3 && mouseX < x3+w3 && mouseY > y3 && mouseY < y3+h3)
  {
    insideshape = !insideshape;
  }
}


