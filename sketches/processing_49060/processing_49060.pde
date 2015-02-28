
Punkt[] bop;
int anzahl = 0;

void setup()
{
  size(500, 500);
  bop = new Punkt[99999];
  bop[anzahl++] = new Punkt(width/2, height/2);
  bop[anzahl-1].neu();
  background(0);
  smooth();
}


void draw()
{
  for(int i = 0; i < anzahl; i++)
  {
    if(bop[i].getX() == bop[i].getXgoal() || bop[i].getY() == bop[i].getYgoal())
    {
      bop[i].neu();
      bop[anzahl++] = new Punkt(bop[i].getX(), bop[i].getY());
      bop[anzahl-1].neu();
    }
    bop[i].bewegen();
    bop[i].zeigen();
  }
  if(anzahl > 10000)
  {
    
    background(0);
    anzahl = 0;
    bop[anzahl++] = new Punkt(width/2, height/2);
    bop[anzahl-1].neu();
  }
}





class Punkt
{
  int x, y, xgoal, ygoal, Xspeed, Yspeed, counter;
  Punkt(int xpos, int ypos)
  {
    x = xpos;
    y = ypos;
    Xspeed = 1;
    Yspeed = 1;
    counter = 0;
  }
  
  void zeigen()
  {
    strokeWeight(0.5);
    stroke(255);
    point(x, y);
  }
  
  void neu()
  {
    xgoal = int(random(width));
    ygoal = int(random(height));
  }
  
  void bewegen()
  {
    if(xgoal > x) x+= Xspeed;
    else if(xgoal < x) x-= Xspeed;
    if(ygoal > y) y+= Yspeed;
    else if(ygoal < y) y-= Yspeed;
  }
  
  int getXgoal()
  {
    return xgoal;
  }
  
  int getYgoal()
  {
    return ygoal;
  }
  
  int getX()
  {
    return x;
  }
  
  int getY()
  {
    return y;
  }
  
  void count()
  {
     counter++;
  }
  
  int getCounter()
  {
    return counter;
  }
  
}
    

