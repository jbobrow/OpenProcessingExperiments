
Floco[] neve=new Floco[2000];
int i;
int t=4;
float velmax=0.5;

void setup()
{
  size(500, 500);
  background(0);
  for(i=0; i<neve.length; i=i+1)
  {
    neve[i]=new Floco(random(width), random(height), random(-velmax, velmax), random(1, 2), random(100, 255));
  }
}

void draw()
{
  background(0);
  for(i=0; i<neve.length; i=i+1)
  {
    neve[i].andar()
  }
}

class Floco
{
  float posx;
  float posy;
  float velx;
  float vely;
  color c;
  
  Floco(float tposx, float tposy, float tvelx, float tvely, color tc)
  {
    posx=tposx;
    posy=tposy;
    velx=tvelx;
    vely=tvely;
    c=tc;
  }
  
  void andar()
  {
    if(posx>=0 && posx<=width)
    {
      posx=posx+velx;
    }
    else
    {
      if(posx>0)
      {
        posx=0;
      }
      else
      {
        posx=width;
      }
    }
    if(posy<height)
    {
      posy=posy+vely;
    }
    else
    {
      posy=0;
    }
    noStroke();
    fill(c);
    ellipse(posx, posy, t, t);
  }
}
