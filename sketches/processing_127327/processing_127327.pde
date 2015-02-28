
ArrayList<Bola> bolas=new ArrayList<Bola>();
ArrayList<Fogo> fogos=new ArrayList<Fogo>();
ArrayList<Fragmento> frag=new ArrayList<Fragmento>();
PVector g;
float chance;
int i, j, a;

void setup()
{
  size(800, 800);
  strokeWeight(5);
  colorMode(HSB, 100);
  g=new PVector(0, 0.07);
}

void draw()
{
  fill(0, 0, 0, 40);
  stroke(0);
  rect(0, 0, width, height);
  chance=5+abs(mouseX-pmouseX);
  if(random(100)<chance)
  {
    bolas.add(new Bola());
  }
  for(i=0; i<bolas.size(); i=i+1)
  {
    bolas.get(i).desenhar();
  }
  for(i=0; i<fogos.size(); i=i+1)
  {
    fogos.get(i).mover();
  }
  for(i=0; i<frag.size(); i=i+1)
  {
    frag.get(i).mover();
  }
}

void keyPressed()
{
  if(key=='f' || key=='F')
  {
    fogos.add(new Fogo());
  }
}

class Bola
{
  PVector pos;
  int h;
  float t;
  
  Bola()
  {
    pos=new PVector(random(width), random(height));
    h=int(random(100));
    t=random(100, 300);
  }
  
  void desenhar()
  {
    if(t>0)
    {
      stroke(h, 100, 100);
      fill(h, 100, 50);
      ellipse(pos.x, pos.y, t, t);
      t=t-5;
    }
    else
    {
      bolas.remove(i);
    }
  }
}

class Fogo
{
  ArrayList<PVector> rastro;
  PVector pos, vel;
  int h;
  
  Fogo()
  {
    if(random(100)<50)
    {
      pos=new PVector(random(width/2), height);
      vel=new PVector(random(2, 4), random(-10, -6));
    }
    else
    {
      pos=new PVector(random(width/2, width), height);
      vel=new PVector(random(-4, -2), random(-10, -6));
    }
    h=int(random(100));
    rastro=new ArrayList<PVector>();
  }
  
  void mover()
  {
    if(vel.y<0)
    {
      if(rastro.size()==20)
      {
        rastro.remove(0);
      }
      rastro.add(new PVector(pos.x, pos.y));
      vel.add(g);
      pos.add(vel);
      stroke(h, 100, 100);
      fill(h, 100, 50);
      rect(pos.x, pos.y, 10, 10);
      for(j=0; j<rastro.size(); j=j+1)
      {
        rect(rastro.get(j).x, rastro.get(j).y, j/2, j/2);
      }
    }
    else
    {
      a=0;
      while(a<50)
      {
        frag.add(new Fragmento());
        a=a+1;
      }
      fogos.remove(i);
    }
  }
}

class Fragmento
{
  ArrayList<PVector> rastro;
  PVector pos, vel;
  int h;
  
  Fragmento()
  {
    pos=new PVector(fogos.get(i).pos.x, fogos.get(i).pos.y);
    vel=new PVector(random(-5, 5), random(-5, 5));
    h=fogos.get(i).h;
    rastro=new ArrayList<PVector>();
  }
  
  void mover()
  {
    if(mag(vel.x, vel.y)>0.5)
    {
      if(rastro.size()==10)
      {
        rastro.remove(0);
      }
      rastro.add(new PVector(pos.x, pos.y));
      pos.add(vel);
      vel.mult(0.98);
      stroke(h, 100, 100);
      fill(h, 100, 50);
      rect(pos.x, pos.y, 5, 5);
      for(j=0; j<rastro.size(); j=j+1)
      {
        rect(rastro.get(j).x, rastro.get(j).y, j/2, j/2);
      }
    }
    else
    {
      frag.remove(i);
    }
  }
}
