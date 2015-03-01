
Ball b;
Rectangle r;
ArrayList rectangles = new ArrayList();
void setup()
{
  size(700,700);
  b = new Ball(200,200,5,1);
  for(int i=0; i<10; i++)
  {
    rectangles.add(new Rectangle());
  }
}

void draw()
{
  background(0);
  b.drawBall();
  for (int i = 0; i < rectangles.size(); i++)
  {
    Rectangle r = (Rectangle) rectangles.get(i);    
    r.drawRectangle(); 
  }
  
}
void keyPressed()
{
  for (int i = 0; i < rectangles.size(); i++)
  {
    Rectangle r = (Rectangle) rectangles.get(i);    
    if (keyCode == LEFT)
    {  
      r.xmove(-10);
    }
    if (keyCode == RIGHT)
    {
      r.xmove(10);
    }
    if (keyCode == UP)
    {
      r.ymove(-10);
    }
    if (keyCode == DOWN)
    {
      r.ymove(10);
    }
  }
} 
  
class Rectangle
{
  float xpos;
  float ypos;
  float wid;
  float len;
  color c;
  
  Rectangle()
  {
   wid = random(25,100);
   len = random(25,100);
   xpos = random(700-wid);
   ypos = random(700-len);
   c = color(random(255),random(255),random(255));  
  }
  void xmove(float amt)
  {
    xpos += amt;
    if (xpos < 5)
    {
      xpos = 0;
      amt = 0;
    }
    if ((xpos+wid) > 695) 
    {
      xpos = 700-wid;
      amt = 0;
    } 
  }
  void ymove(float amt)
  {
    ypos += amt;
    if (ypos < 5)
    {
      ypos = 0;
      amt = 0;
    }
    if ((ypos+len) > 695) 
    {
      ypos = 700-len;
      amt = 0;
    }
  }
  void drawRectangle()
  {

    if(b.calculateDistance(xpos,ypos) < 30)
    {
      fill(255,0,0);
    }
    else
    {
      fill(c);
    }
    rect(xpos,ypos,wid,len);
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
  float calculateDistance(float x, float y)
  {
    return dist(xpos,ypos,x,y);    
  }
}

