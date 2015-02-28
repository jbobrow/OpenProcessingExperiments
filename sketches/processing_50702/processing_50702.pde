
Punkt[] neu;
int anzahl = 0;

int boax, boay;

void setup()
{
  size(500, 500);
  boax = width/2;
  boay = height/2;
  neu = new Punkt[100000];
  for(int x = 0; x < width+1; x++)
  {
    for(int y = 0; y < height+1; y++)
    {
      if(random(10) < 1) neu[anzahl++] = new Punkt(x, y);
    }
  }
  
  for(int i = 0; i < anzahl; i++)
  {
    neu[i].adresse(boax, boay);
  }
}


void draw()
{
  background(0);
  for(int i = 0; i < anzahl; i++)
  {
    neu[i].bewegen();
    neu[i].back();
    neu[i].zeigen();
  }
  if(random(100) < 1)
  {
    for(int i = 0; i < anzahl; i++)
    {
     
    }
  }
    
}


class Punkt
{
  float x, y;
  float xstart, ystart;
  float xziel, yziel;
  float xspeed, yspeed;
  Punkt(float xpos, float ypos)
  {
    x = xpos;
    y = ypos;
    xstart = x;
    ystart = y;
  }
  
  void zeigen()
  {
    stroke(255);
    point(x, y);
  }
  
  void adresse(float xgoal, float ygoal)
  {
    xziel = xgoal;
    yziel = ygoal;
    xspeed = (xziel- x)/100;
    yspeed = (yziel- y)/100;
  }
  
  void bewegen()
  {
    x += xspeed;
    y += yspeed;
  }
  
  void back()
  {
    if(dist(x, y, xziel, yziel) > 400)
    {
      xspeed = -xspeed;
      yspeed = -yspeed;
    }
  }
    
  
  
}

