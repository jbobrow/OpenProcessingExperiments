
// Fish class

class Fish
{
  float x, y;
  float xPosition = random(300, 500), yPosition = random(300, 500);
  float v;
  int dir = 1; // left direction
  float c1 = random(255);
  float c2 = random(255);
  float c3 = random(255);

  boolean white = true;

  void show()
  {
    fill(c1, c2, c3, 230);
    stroke(240);
    triangle (x+5*dir, y, x+15*dir, y-8, x+15*dir, y+8);
    ellipse (x, y, 20, 15);
  }

  void swim()
  {
    x = x + -dir * width/2 * 0.005 * v;

    ////////////////////////////wrap around/////////////////////////////////////
    if (x > width+15 || y > height+15) 
    {
      if (dir == 1) x = width;
      else x = 0;
      y = random(height/8, height-height/8);
    }
    if (x < 0-15 || y < 0-15) 
    {
      if (dir == 1) x = width;
      else x = 0;
      y = random(height/4, height-height/4);
    }

    ////////////////////////emerge////////////////////////////////////////////
    if (xPosition >= x)
    {
      dir = -1;
      x = x + v;
    }
    if (xPosition <= x)
    {
      dir = 1;
      x = x - v;
    }
    if (yPosition >= y)
    {
      y = y + v;
    }
    if (yPosition <= y)
    {
      y = y - v;
    }
  }

  void mouseMoved()
  {
    if (mouseX < width/2)
    {
      dir = 1; // left
      xPosition = width - xPosition;
    }
    if (mouseX > width/2) 
    {
      dir = -1; // right
      xPosition = width - xPosition;
    }
  }
}


