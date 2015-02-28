
//import processing.opengl.*;
int tam=200,ei=0;
float G=0,r=30,h=r*2;
particula[] p = new particula[tam+1];
void setup()
{
  size(800,450);
  for(int i=0;i<tam;i++)
    p[i]=new particula(i);
    noFill();
}
void draw()
{
  if(key=='a')
    G=9.81;
  if(key=='g')
    G=0;
  background(0);
  if(ei!=tam-1)
  if(mousePressed)
  {
    if(ei<tam-1)
      ei++;
    p[ei].pos.x=mouseX+random(-20,20);
    p[ei].pos.y=mouseY+random(-20,20);
  }
  if(ei==tam)
  {
    if(mousePressed)
    {
      for(int i=0;i<tam;i++)
      {
        PVector d = new PVector(p[i].pos.x,p[i].pos.y);
        d.x-=mouseX+random(-10,10);
        d.y-=mouseY+random(-50,50);
       if(d.mag()<200)
       {
          float tu=d.mag();
          tu*=map(tu,0,200,0,0.2);
          float angulo = atan2(p[i].pos.y-mouseY,p[i].pos.x-mouseX);
          p[i].fuerza.x-=cos(angulo)*tu;
          p[i].fuerza.y-=sin(angulo)*tu;
       }
      }
    }
  }
  for(int i=0;i<ei;i++)
  {
    p[i].atraccion();
    p[i].pared();
    p[i].colision();
    p[i].pared();
    p[i].mover();
    p[i].pintar();
  }
}
class particula
{
  PVector pos,vel,fuerza;
  float masa;
  int id,vecinas[],cont;
  color col,cal;
  particula[] otros;
  int[] vecinos;
  particula(int id_)
  {
    pos = new PVector(mouseX,mouseY);
    vel = new PVector(0,0);
    fuerza = new PVector(0,G);
    masa=1;
    col=0;
    id=id_;
    otros=p;
    cont=0;
    col=color(random(255),random(255),random(255));
    cal=color(random(255),random(255),random(255));
  }
  void pintar()
  {
    fill(col,100);
    noStroke();
    ellipse(pos.x,pos.y,r,r);
    stroke(int(map(pos.x,0,width,0,255)),cal,int(map(pos.y,0,height,255,0)));
   strokeWeight(r/6);
    point(pos.x,pos.y);
    
  }
  void mover()
  {
    fuerza.mult(masa);
    vel=new PVector(fuerza.x,fuerza.y);
    pos.add(vel);
    fuerza = new PVector(0,G);
  }
  void pared()
  {
    if(pos.x>width-r/2)
    {
      pos.x=width-r/2;
     // fuerza.x-=r/2;
    }
    if(pos.x<r/2)
    {
      pos.x=r/2;
     // fuerza.x+=r/2;
    }
    if(pos.y<r/2)
    {
      pos.y=r/2;
     // fuerza.y+=r/2;
    }
    if(pos.y>height-r/2)
    {
      pos.y=height-r/2;
     // fuerza.y-=r/2;
    }
  }
  void colision()
  {
    cont=0;
    for(int i=0;i<ei;i++)
    {
      if(i==id)continue;
      PVector d = new PVector(otros[i].pos.x,otros[i].pos.y);
      d.sub(pos);
      if(d.mag()<=r)
        cont++;
    }
    vecinos = new int[cont];
    cont=0;
    for(int i=0;i<ei;i++)
    {
      if(i==id)continue;
      PVector d = new PVector(otros[i].pos.x,otros[i].pos.y);
      d.sub(pos);
      if(d.mag()<=r)
      {
        float tu=r-d.mag();
        if(G==9.81)
          tu*=0.3;
        else
          tu*=0.7;
        float angulo = atan2(otros[i].pos.y-pos.y,otros[i].pos.x-pos.x);
        fuerza.x-=cos(angulo)*tu;
        if(key=='v'&&G==9.81)
        {
          tu*=2;
        if(pos.y<=otros[i].pos.y)
          fuerza.y-=sin(angulo)*tu;
        else
          otros[i].fuerza.y+=sin(angulo)*tu;
        }
        else
        {
          fuerza.y-=sin(angulo)*tu;
          //  otros[vecinos[i]].fuerza.y+=sin(angulo)*tu;
          //  otros[vecinos[i]].fuerza.x+=cos(angulo)*tu;
        }
      }
    }

  }
  void atraccion()
  {
    cont=0;
    for(int i=0;i<tam;i++)
    {
      if(i==id)continue;
      PVector d = new PVector(otros[i].pos.x,otros[i].pos.y);
      d.sub(pos);
      if((d.mag()<=h))
        cont++;
    }
    
    vecinos = new int[cont];
    cont=0;
    for(int i=0;i<tam;i++)
    {
      if(i==id)continue;
      PVector d = new PVector(otros[i].pos.x,otros[i].pos.y);
      d.sub(pos);
      if(d.mag()>r&&d.mag()<=h)
      {
     //   vecinos[cont] = otros[i].id;
     //   cont++;
        float tu=d.mag()-r;
        if(G==0)
          tu*=0.015;
        else
          tu*=0.009;
        float angulo = atan2(otros[i].pos.y-pos.y,otros[i].pos.x-pos.x);
        otros[i].fuerza.x-=cos(angulo)*tu;
        otros[i].fuerza.y-=sin(angulo)*tu;
        fuerza.x+=cos(angulo)*tu;
        fuerza.y+=sin(angulo)*tu;
      }
    }
  }
}
void mousePressed()
{
  ei++;
  if(ei>=tam)
    ei=tam;
  p[ei] = new particula(ei);
}

