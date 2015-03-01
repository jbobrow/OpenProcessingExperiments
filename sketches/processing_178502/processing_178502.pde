
Ball b;
ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();

void setup()
{
  
  size(700,700);
  b = new Ball(200,200,5,1);
  for (int i = 0; i < 10; i++)
  {
    //                                   x1         y1            w2         h2                     
    rectangles.add( new Rectangle(random(500),random(500),random(200),random(200) ));
 }
}

void draw()
{
  background(0);
  b.drawBall();
  
  for (int i = 0; i < rectangles.size(); i++)
  {
    Rectangle r = rectangles.get(i);
    r.drawRectangle();
  }
}



class Rectangle
{
  float xpos1;
  float ypos1;
  float width1;
  float height1;
  color c;
  
  
  Rectangle(float x1, float y1, float w2, float h2)
  {
    xpos1 = x1;
    ypos1 = y1;
    width1 = w2;
    height1 = h2;
    c = color(random(255),random(255),random(255));
  }
  
  void drawRectangle() 
  {
    
    stroke(255);
    
    if (b.calculateDistance <= 30)
    {
      fill(255,0,0);
    }
    if (b.calculateDistance(xpos1,ypos1) > 30)
    {
      fill(c);
      
    }
     rect(xpos1,ypos1,width1,height1);
  
  
       

//moves
    if (keyPressed) 
  {
      if (keyCode == LEFT)
  {
       xpos1 = xpos1 - 5;
  }
  if (keyCode == RIGHT)
  {
    xpos1 = xpos1 + 5;
    
  }
   if (keyCode == UP)
  {
       ypos1 = ypos1 - 5;
  }
  if (keyCode == DOWN)
  {
    ypos1 = ypos1 + 5;
  
}
  }
  
 //keeps on screen
 
  if (xpos1 <= 0)
  {
    xpos1 = 0;
  }
  
  if (xpos1 >= 700 - width1)
  {
    xpos1 = 700 - width1 ;
  }
  
   if (ypos1 <= 0)
  {
    ypos1 = 0;
  }
  
  if (ypos1 >= 700 - height1)
  {
    ypos1 = 700 - height1;
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
  float calculateDistance;
  

  
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
  float  calculateDistance(float xpos1, float ypos1)
  {
    return dist(xpos1,ypos1,xpos,ypos);
    
}
}
  

