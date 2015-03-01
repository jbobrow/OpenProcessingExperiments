
Ball b;

Rectangle r1;
Rectangle r2;

Rectangle r3;
Rectangle r4;

Rectangle r5;
Rectangle r6;

Rectangle r7;
Rectangle r8;

Rectangle r9;
Rectangle r10;
color c;



void setup()
{
  size(700,700);
  b = new Ball(200,200,5,1);

 
  c=color(random(255),random(255),random(255));
  
  r1=new Rectangle(200,200,6,6);
  r2=new Rectangle(random(700),random(700),random(100),random(100));
 
  r3=new Rectangle(random(700),random(700),10,6);
  r4=new Rectangle(random(700),random(700),6,6);

  r5=new Rectangle(random(700),random(700),6,6);
  r6=new Rectangle(random(700),random(700),6,6);
  
  r7=new Rectangle(random(700),random(700),6,6);
  r8=new Rectangle(random(700),random(700),6,6);
  
  r9=new Rectangle(random(700),random(700),6,6);
  r10=new Rectangle(random(700),random(700),6,6);
}

void draw()
{
  background(0);
  b.drawBall();




  r1.drawRectangle();
  r2.drawRectangle();
  
  r3.drawRectangle();
  r4.drawRectangle();
  
  r5.drawRectangle();
  r6.drawRectangle();
  
  r7.drawRectangle();
  r8.drawRectangle();
  
  r9.drawRectangle();
  r10.drawRectangle();
  
}

void keyPressed()
{
 
  if (keyCode==UP)
  {
    
    r1.moveRectangleup();
    r2.moveRectangleup();
   
    r3.moveRectangleup();
    r4.moveRectangleup();
    
    r5.moveRectangleup();
    r6.moveRectangleup();
    
    r7.moveRectangleup();
    r8.moveRectangleup();
    
    r9.moveRectangleup();
    r10.moveRectangleup();
  }
  if (keyCode==DOWN)
  {
    r1.moveRectangledown();
    r2.moveRectangledown();
    
    r3.moveRectangledown();
    r4.moveRectangledown();
    
    r5.moveRectangledown();
    r6.moveRectangledown();
    
    r7.moveRectangledown();
    r8.moveRectangledown();

    r9.moveRectangledown();
    r10.moveRectangledown();
  }
  if (keyCode==LEFT)
  {
    r1.moveRectangleleft();
    r2.moveRectangleleft();
    
    r3.moveRectangleleft();
    r4.moveRectangleleft();
    
    r5.moveRectangleleft();
    r6.moveRectangleleft();
    
    r7.moveRectangleleft();
    r8.moveRectangleleft();
    
    r9.moveRectangleleft();
    r10.moveRectangleleft();
    }
    if (keyCode==RIGHT)
  {
    r1.moveRectangleright();
    r2.moveRectangleright();
    
    r3.moveRectangleright();
    r4.moveRectangleright();
    
    r5.moveRectangleright();
    r6.moveRectangleright();
    
    r7.moveRectangleright();
    r8.moveRectangleright();
    
    r9.moveRectangleright();
    r10.moveRectangleright();
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

  
  Ball(float x, float y, float xv, float yv,float cD)
  {
    xpos = x;
    ypos = y;
    xvel = xv;
    yvel = yv;
    size = 30;
    calculateDistance=cD;
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


class Rectangle
{
  float posx;
  float posy;
  float xvel;
  float yvel;
  float size;
  float theta;
  
  color c;

  
  Rectangle(float x, float y, float xv, float yv)
  {
    posx = x;
    posy = y;
    xvel = xv;
    yvel = yv;
    size = (int(random(125)));
    theta=0;
    c=color(random(255),random(255),random(255));
  }
  
  void drawRectangle()
  {
    
    
    fill(c);
    noStroke();
    rect(posx,posy,size,size);
  }
  
  void moveRectangleup()
  {
    
    posy=posy-10;
    if(posy<0)
    {
      posy=0;
    }
  }
  
  void moveRectangledown()
  {
  posy=posy +10;
  if(posy>600)
  {
    posy=600;
  }
  }
  
    void moveRectangleleft()
  {
  posx=posx -10;
  {
    if(posx<0)
    {
      posx=0;
    }
  }
  }
  
  
    void moveRectangleright()
  {
  posx=posx +10;
  if(posx>625)
  {
   posx=625;
  }
  

  
}
}
