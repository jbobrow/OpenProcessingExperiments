
Ball b;
ArrayList<Rect> rects = new ArrayList<Rect>();

void setup()
{
  size(700,700);
  b = new Ball(200,200,5,1);
  for (int i = 0; i < 10; i++)
  {
    rects.add(new Rect());
  }
}

void draw()
{
  background(0);
  b.drawBall();
  for (int i = 0; i < rects.size(); i++)
  {
    Rect r = rects.get(i);
    r.drawRect();
    if (keyPressed)
  {
    if (keyCode == UP)
    {
      r.moveForward();
    }
    if (keyCode == LEFT)
    {
      r.moveLeft();
    }
    if (keyCode == RIGHT)
    {
      r.moveRight();
    }
    if (keyCode == DOWN)
    {
      r.moveBackward();
    }
  } 
  }
}

class Ball
{
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float size;
  
  Ball(float x, float y, float xv, float yv)
  {
    xpos = x;
    ypos = y;
    xvel = xv;
    yvel = yv;
    size = 30;
  }
  
  float calculateDistance(float positionx, float positiony)
  {
    return dist(positionx, positiony, xpos, ypos);
  }
      
  void drawBall()
  {
    xpos += xvel;
    ypos += yvel;
    
    if ((xpos < 0) || (xpos > width))  xvel *= -1;
    if ((ypos < 0) || (ypos > height))  yvel *= -1;
    
    fill(#8CAEB2);
    noStroke();
    ellipse(xpos,ypos,size,size);
  }
}

class Rect
{
  float xpos;
  float ypos;
  int size;
  int size2;
  int c;
  
  Rect()
  {
    xpos = random(width);
    ypos = random(height);
    size2 = int(random(50)+25);
    size = int(random(50)+25);
    c = color(random(255),random(255),random(255));
  }
  
  void moveForward ()
  {
    ypos = ypos - 1;
  }
  
  void moveBackward()
  {
    ypos = ypos + 1;
  }
  
  void moveLeft()
  {
    xpos = xpos - 1;
  }
  
  void moveRight()
  {
    xpos = xpos + 1;
  }
  
  void drawRect()
 {
   if ((xpos + size) > width)
    { 
      xpos = (width-size);
    }
    else if (xpos < 0)
    {
      xpos = 0;
    }
    if ((ypos + size2) > height)
    {
      ypos = (height-size2);
    }
    else if (ypos < 0)
    {
      ypos = 0;
    }
  if (b.calculateDistance(xpos,ypos)>30)
   {
     fill(c);
     noStroke();
     rect(xpos, ypos, size, size2);
   }
    
  else if (b.calculateDistance(xpos,ypos)<30)
   {
     fill(255,0,0);
     noStroke();
     rect(xpos, ypos, size, size2);
   }
 }
}
