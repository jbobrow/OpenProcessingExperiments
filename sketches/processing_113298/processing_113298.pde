
ArrayList<Planeta> Planetas;
int i, j;
int mmax=5;
float fmax=0.00001;
float dist, f;
float velmax=0.01;

void setup()
{
  size(700, 700);
  background(0, 0, 30);
  Planetas=new ArrayList<Planeta>();
  while(Planetas.size()<50)
  {
    Planetas.add(new Planeta());
  }
}

void draw()
{
  fill(0, 0, 30, 30);
  noStroke();
  rect(0, 0, width, height);
  stroke(80, 40, 40);
  for(i=0; i<Planetas.size(); i=i+1)
  {
    Planetas.get(i).mover();
  }
}

class Planeta
{
  PVector pos;
  PVector vel;
  PVector acel;
  int m;
  
  Planeta()
  {
    pos=new PVector(random(width), random(height));
    vel=new PVector(random(-velmax, velmax), random(-velmax, velmax));
    acel=new PVector(0, 0);
    m=ceil(random(mmax));
  }
  
  void mover()
  {
    for(j=0; j<Planetas.size(); j=j+1)
    {
      if(j!=i)
      {
        acel.set(Planetas.get(j).pos);
        dist=acel.dist(pos);
        f=(m*Planetas.get(j).m)/(sq(dist));
        if(f>fmax)
        {
          f=fmax;
        }
        acel.sub(pos);
        acel.normalize();
        acel.mult(f/m);
        vel.add(acel);
        pos.add(vel);
      }
    }
    if(pos.x<0)
    {
      pos.x=0;
      vel.x=-0.5*vel.x;
    }
    if(pos.x>width)
    {
      pos.x=width;
      vel.x=-0.5*vel.x;
    }
    if(pos.y<0)
    {
      pos.y=0;
      vel.y=-0.5*vel.y;
    }
    if(pos.y>height)
    {
      pos.y=height;
      vel.y=-0.5*vel.y;
    }
    fill(40, 20, 20, 200);
    ellipse(pos.x, pos.y, 5*m, 5*m);
  }
}
