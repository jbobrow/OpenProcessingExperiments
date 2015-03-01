
Ball b;
ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();

void setup()
{
  size(700,700);
  b = new Ball(200,200,5,1);
  for(int i = 0; i < 10; i++)
  {
    rectangles.add(new Rectangle());
    println(rectangles.size());
  }
}

void draw()
{
  background(0);
  b.drawBall();
  for (int i = 0; i < rectangles.size(); i++)
  {
    Rectangle r = rectangles.get(i);
    r.DrawRectangle ();
    r.movement ();
  }

}

class Ball
{
  public float xpos;
  public float ypos;
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
  
  float calculateDistance (float x, float y)
  {
    float distance = dist(xpos,ypos,x,y);
    println(distance);
    return distance;
  }
  

}

class Rectangle 
{
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  color c;
  int xvalue;
  int yvalue;
  
  Rectangle()
  {
    xpos = random(0,width-150);
    ypos = random(0,height);
    c = color (int(random(255)),int(random(255)),int(random(255)));
    xvalue = int(random(20,150));
    yvalue = int(random(20,150));
 
  }
  
  void DrawRectangle ()
  {    
    stroke(c);
    if (b.calculateDistance(xpos,ypos) < 40)
    {
      fill (255,0,0);
    }
    else if (b.calculateDistance(xpos,ypos) > 40)
    {
      fill (c);
    }
    rect (xpos,ypos,xvalue,yvalue);
  
  }
  
  void movement()
  {
    if (keyPressed && keyCode == UP)
    {
      ypos = ypos - 2;
    }
    else if (keyPressed && keyCode == DOWN)
    {
      ypos = ypos + 2;
    }
    else if (keyPressed && keyCode == LEFT)
    {
     xpos = xpos - 2;
    }
    else if (keyPressed && keyCode == RIGHT)
    {
      xpos = xpos + 2;
    }

    if (xpos < 0)
    {
      xvel = 2;
    }
    else if (xpos + xvalue > width)
    {
      xvel = -2;
    }
    else if (ypos < 0)
    {
      yvel = 2;
    }
    else if (ypos + yvalue > height)
    {
      yvel = -2;
    }
    else
    {
      xvel = 0;
      yvel = 0;
    }
     xpos += xvel;
     ypos += yvel;
  }
}
