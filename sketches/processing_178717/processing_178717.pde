
Ball b;
ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();
float count;
boolean keyleft,keyright, keyUp, keyDown, keySpace;
void setup()
{
  count = 0;
  size(700,700);
  b = new Ball(200,200,5,1);
  while (count<50)
  {
    rectangles.add( new Rectangle() );
    count = count + 1;
  }
}

void draw()
{
  background(0);
  b.drawBall();
  for (int i = 0; i < rectangles.size(); i++)
  {
    Rectangle r1 = rectangles.get(i);
    if (keyright)
    {
      r1.moveRight();
    }
    if (keyleft)
    {
      r1.moveLeft();
    }
    if (keyUp)
    {
      r1.moveUp();
    }
    if (keyDown)
    {
      r1.moveDown();
    }
    if (keySpace)
    {
      r1.xpos = random(width);
      r1.ypos = random(height);
    }
    r1.updateRectangle();
    r1.drawRectangle();
  }
}
  
    void  keyPressed()
  {
      if (keyCode == LEFT)     keyleft= true;
      if (keyCode == RIGHT)    keyright= true;
      if (keyCode == UP)       keyUp = true;
      if (keyCode == DOWN)     keyDown = true;
      if (keyCode == ' ')      keySpace = true;
  }
  void keyReleased()
  {
    if (keyCode == LEFT)     keyleft= false;
    if (keyCode == RIGHT)    keyright= false;
    if (keyCode == UP)       keyUp = false;
    if (keyCode == DOWN)     keyDown = false;
    if (keyCode == ' ')      keySpace = false;
  }
  


class Ball
{
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float s;
  
  Ball(float x, float y, float xv, float yv)
  {
    xpos = x;
    ypos = y;
    xvel = xv;
    yvel = yv;
    s = 30;
  }
  
  void drawBall()
  {
    xpos += xvel;
    ypos += yvel;
    
    if ((xpos < 0) || (xpos > width))  xvel *= -1;
    if ((ypos < 0) || (ypos > height))  yvel *= -1;
    
    fill(#8CAEB2);
    noStroke();
    ellipse(xpos,ypos,s,s);
  }
  float getx()
  {
    return xpos;
  }
  float gety()
  {
    return ypos;
  }
 
}

class Rectangle
{
  float xpos;
  float ypos;
  float Width;
  float Height;
  color c;
  boolean col = false;
  color originalColor;
  
  Rectangle()
  {
    xpos = random(width);
    ypos = random(height);
    Width = random(50);
    Height = random(50);
    originalColor = color(int(random(255)),int(random(255)),int(random(255)));
    c = originalColor;
  }
  
  void drawRectangle()
  {
    fill(c);
    rect(xpos,ypos,Width,Height);  
  }

void moveRight()
{   
    xpos = xpos + 5;
    if (xpos >= width - Width)
    {
      xpos = width - Width;
    }
}
 
void moveLeft()
{
    xpos = xpos - 5;
    if (xpos < 0)
    {
      xpos = 0;
    }
}
void moveUp()
{
  ypos = ypos - 5;
  if(ypos < 0 )
  {
    ypos = 0 ;
  }
}
void moveDown()
{
  ypos = ypos + 5;
  if (ypos > height - Height)
  {
    ypos =height - Height;
  }
}
void updateRectangle()
{
  
  if((b.gety() > (ypos - 30) ) && ((b.getx() > xpos - 30) && (b.getx() < xpos + Width)) && (b.gety() < ypos + Height + 30))
  {
    col = true;
  }else
    col = false;
  if (col == true)
  {
    c = color(255,0,0);
  }
  else 
  {
    c = originalColor;
  }
}
    
    
  
}

