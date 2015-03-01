
Ball b;
ArrayList<Rec> rectangles = new ArrayList<Rec>();


void setup()
{
  size(700,700);
  b = new Ball(200,200,5,1);
  for (int i = 0; i < 10; i++)
  {
    rectangles.add(new Rec()); 
  }
  for (int i = 0; i < rectangles.size(); i++)
  {
    Rec r = rectangles.get(i);
    r.rectangles();
  }
  
}

void draw()
{
  
  background(0);
  b.drawBall();
  for (int i = 0; i < rectangles.size(); i++)
  {
    Rec r = rectangles.get(i);
    r.drawRec();
    r.update();
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
    float distance=dist(xpos,ypos,x,y);
    return distance;
  }
}
class Rec
{
  int sizex;
  int sizey;
  int posx;
  int posy;
  int xvel;
  int yvel;
  color c;
  
  void rectangles ()
  {
    sizex = int(random(50,150));
    sizey = int(random(50,150));
    posx = int(random(width));
    posy = int(random(height));
    c = color(0,random(255),random(255));
    xvel=0;
    yvel=0;
  }
  
  void drawRec()
  {  
   if(b.calculateDistance(posx,posy)<30)
   {
     fill(255,0,0);
   }
   else if(b.calculateDistance(posx,posy)>30)
   {
    fill(c); 
   }
   rect(posx,posy,sizex,sizey); 
   
  }
  
  void update()
  {
      if (keyPressed)
    {
      if (keyCode==UP)
      {
        yvel=-5;
      }
      if (keyCode==LEFT)
      {
        xvel=-5;      
        }
      if (keyCode==RIGHT)
      {
        xvel=5;
      }
      if (keyCode==DOWN)
      {
        yvel=5;
      } 
    }   
    else
    {
      xvel=0;
      yvel=0;
    }
    if (posx > width)
    { 
      xvel = -1;
    }
    else if (posx < 0)
    {
      xvel = 1;
    }
    if (posy > height)
    {
      yvel = -1;
    }
    else if (posy < 0)
    {
      yvel = 1;
    }
    posx = int(posx + xvel);
    posy = int(posy + yvel);  
  }
}
