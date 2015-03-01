
//SPACE to draw dots up and down to change gravity... The balls get more red every time they collide wth a different ball.  Be careful not to add too many dots. 
boolean keyspace, keyUp, keyDown, keyLeft;
ArrayList<Dot> dots = new ArrayList<Dot>();
int count;
int maxDots = 1;
int numberofDots;


void setup()
{
  size(1000,1000);
  background(0);
  count = 0;
  //frameRate(10);
 }
void draw()
{
  background(0);
  if (keyspace)
  {
    dots.add(new Dot((mouseX + int(random(-10,10))), (mouseY + int(random(-10,10))), 25, 25));
  }
  
  
  for (Dot myDot: dots)
  {
    myDot.update();
    myDot.drawDot();
  }
  
    
}

void keyPressed()
{   
  if (keyCode == ' ')      keyspace= true;
  if (keyCode == UP)       keyUp = true;
  if (keyCode == DOWN)     keyDown = true;
  if (keyCode == LEFT)     keyLeft = true;
}

void keyReleased()
{
  if (keyCode == ' ')      keyspace= false;
  if (keyCode == UP)       keyUp = false;
  if (keyCode == DOWN)     keyDown = false;
  if (keyCode == LEFT)     keyLeft = false;
} 

class Dot
{
  float posx;
  float posy;
  float velx;
  float vely;
  int prevmx;
  int size;
  float gravity;
  float c;
  int x;
  Dot (int x, int y, int s , int p)
  {
    posx = x;
    posy = y;
    vely = random(-20,20);
    gravity = 0;
    size = s;
    velx = random(-20,20);
    c = 255;
    
  }
  void drawDot()
  {
    ellipse(posx, posy,size,size);
  }
  float getx()
  {
    return this.posx;
  }
  float gety()
  {
    return this.posy;
  }
  void update()
  {
    fill(255,c,c);
    //c = c + .5;
    vely = vely + gravity;
    posx = posx + velx;
    posy = posy + vely;
    if (posy >= height)
    {
      posy = height;
      vely = vely * -1;
    }
    if (posx < 0)
    {
      posx = 0;
      velx = velx * -1;
      if (velx > 0)
      {
        velx = velx - .5;
      }
      if (velx < 0)
      {
        velx = velx + .5;
      }
      
    }
    if (posx >= width)
    {
      posx = width;
      velx = velx * -1;
      if (velx > 0)
      {
        velx = velx - .5;
      }
      if (velx < 0)
      {
        velx = velx + .5;
      }
    }
      
     if (posy <= 0)
    {
      posy = 0;
      vely = vely * -1;
    }
    if (keyUp)
    {
      gravity = gravity - .05;
    }
    if (keyDown)
    {
      gravity = gravity + .05;
    }
    if (keyLeft)
    {
      gravity = 1;
    }
    
    for(int j = 0; j<10;j++)
    {
      for(Dot daDot: dots)
      {
        if( daDot.equals(this))
        {
          continue;
        }
        boolean col = false;
        while(dist(this.posx, this.posy, daDot.getx(), daDot.gety())<25)
        {
          if (posy < daDot.gety())
          {
            posy -= 1;         
            posx += random(-1, 1);
            col = true;
            c = c - .5;
            daDot.changecol();
            
          }
          if (posy > daDot.gety())
          {
            posy += 1 ;         
            posx += random(-1, 1);
            col = true;
            c = c - .5;
            daDot.changecol();
          }
            
        }
        if(col)
        {
          vely = -1 * vely;
          velx = velx * -1;
        }
      }
    }
    
    
  }
  
  void changecol()
  {
    c = c - .5;
  }
  
}

    

  
