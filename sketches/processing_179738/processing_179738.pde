
Ball b;
Rectangle r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12;


void setup()
{
  size(800,600);
  b = new Ball(0,0,5,1);
  r1 = new Rectangle();
  r2 = new Rectangle();
  r3 = new Rectangle();
  r4 = new Rectangle();
  r5 = new Rectangle();
  r6 = new Rectangle();
  r7 = new Rectangle();
  r8 = new Rectangle();
  r9 = new Rectangle();
  r10 = new Rectangle();
  r11= new Rectangle();
  r12= new Rectangle();
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
  r11.drawRectangle();
  r12.drawRectangle();
  
}

void keyPressed()
{
  if (keyCode == DOWN)
  {
    r1.movedown();
    r2.movedown();
    r3.movedown();
    r4.movedown();
    r5.movedown();
    r6.movedown();
    r7.movedown();
    r8.movedown();
    r9.movedown();
    r10.movedown();
    r11.movedown();
    r12.movedown();
  }
   if (keyCode == UP)
  {
    r1.moveup();
    r2.moveup();
    r3.moveup();
    r4.moveup();
    r5.moveup();
    r6.moveup();
    r7.moveup();
    r8.moveup();
    r9.moveup();
    r10.moveup();
    r11.moveup();
    r12.moveup();
  }
    if (keyCode == RIGHT)
  {
    r1.moveright();
    r2.moveright();
    r3.moveright();
    r4.moveright();
    r5.moveright();
    r6.moveright();
    r7.moveright();
    r8.moveright();
    r9.moveright();
    r10.moveright();
    r11.moveright();
    r12.moveright();
  }
   if (keyCode == LEFT)
  {
    r1.moveleft();
    r2.moveleft();
    r3.moveleft();
    r4.moveleft();
    r5.moveleft();
    r6.moveleft();
    r7.moveleft();
    r8.moveleft();
    r9.moveleft();
    r10.moveleft();
    r11.moveleft();
    r12.moveleft();
  }
}




  
class Rectangle
{
  float xpos;
  float ypos;
  float posx;
  float posy;
  float h;
  float w;
  color c;
  float d;
  
  Rectangle()
  {
    posx = random(width);
    posy = random(height);
    h = random(50,100);
    w = random(50)+50;   
    c = color(random(255),random(255),random(255));
    d = dist(xpos,ypos,posx,posy);
    if(d < 20)
    {
     c = color(255,0,0);
     }
    
 }
  void movedown()
  {
    posy = posy + 10;
    }
    void moveup()
  {
    posy = posy - 10;
    }
    void moveleft()
  {
    posx = posx - 10;
    }
    void moveright()
  {
    posx = posx + 10;
    }
    void drawRectangle()
  {
    rectMode(CENTER);
    fill(c);
    rect(posx,posy,w,h);
     if (posx > width)
    { 
      posx = width;
    }
    else if (posx < 0)
    {
      posx = 0;
    }
    if (posy > height)
    {
      posy = height;
    }
    else if (posy < 0)
    {
      posy = 0;
    }

    }
}
 
class Ball
{
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float s;
  float d;
  
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
}


