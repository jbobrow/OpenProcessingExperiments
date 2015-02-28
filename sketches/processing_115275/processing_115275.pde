
Gota[] gotas=new Gota[300];
PVector desacel=new PVector(0.99999, 0.99999);
int i, j;
float rep=2;
float g=0;
float fmax=0.01;
float dist, f;

void setup()
{
  size(700, 700);
  background(0);
  for(i=0; i<gotas.length; i=i+1)
  {
    gotas[i]=new Gota();
  }
}

void draw()
{
  background(0);
  for(i=0; i<gotas.length; i=i+1)
  {
    gotas[i].mover();
  }
}

class Gota
{
  PVector pos;
  PVector vel;
  PVector acel;
  
  Gota()
  {
    pos=new PVector(random(width), random(height));
    vel=new PVector(0, 0);
    acel=new PVector(0, 0);
  }
  
  void mover()
  {
    PVector esq=new PVector(0, pos.y);
    acel.set(esq);
    dist=acel.dist(pos);
    f=2*rep/sq(dist);
    if(f>fmax)
    {
      f=fmax;
    }
    acel.sub(pos);
    acel.normalize();
    acel.mult(-f);
    vel.add(acel);
    pos.add(vel);
    
    PVector cima=new PVector(pos.x, 0);
    acel.set(cima);
    dist=acel.dist(pos);
    f=2*rep/sq(dist);
    if(f>fmax)
    {
      f=fmax;
    }
    acel.sub(pos);
    acel.normalize();
    acel.mult(-f);
    vel.add(acel);
    pos.add(vel);
    
    PVector dir=new PVector(width, pos.y);
    acel.set(dir);
    dist=acel.dist(pos);
    f=2*rep/sq(dist);
    if(f>fmax)
    {
      f=fmax;
    }
    acel.sub(pos);
    acel.normalize();
    acel.mult(-f);
    vel.add(acel);
    pos.add(vel);
    
    PVector baixo=new PVector(pos.x, height);
    acel.set(baixo);
    dist=acel.dist(pos);
    f=2*rep/sq(dist);
    if(f>fmax)
    {
      f=fmax;
    }
    acel.sub(pos);
    acel.normalize();
    acel.mult(-f);
    vel.add(acel);
    pos.add(vel);
    for(j=0; j<gotas.length; j=j+1)
    {
      if(j!=i)
      {
        acel.set(gotas[j].pos);
        dist=acel.dist(pos);
        f=rep/sq(dist);
        if(f>fmax)
        {
          f=fmax;
        }
        acel.sub(pos);
        acel.normalize();
        acel.mult(-f);
        vel.add(acel);
        pos.add(vel);
      }
    }
    if(mousePressed)
    {
      PVector mouse=new PVector(mouseX, mouseY);
      acel.set(mouse);
      dist=acel.dist(pos);
      f=4*rep/sq(dist);
      if(f>1)
      {
        f=1;
      }
      acel.sub(pos);
      acel.normalize();
      acel.mult(-f);
      vel.add(acel);
      pos.add(vel);
      vel.mult(desacel);
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
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, 5, 5);
  }
}
