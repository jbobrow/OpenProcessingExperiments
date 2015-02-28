
//import processing.opengl.*;
int tam=600,ex,ey;
float G=9.81,r=30,h=r*2,k=0.03,densR=10,ra=sqrt(r),fMax=ra/2;
particula[] p = new particula[tam];
void setup()
{
  size(900,450,P3D);
  for(int i=0;i<tam;i++)
    p[i] = new particula(i);
    noFill();
}
void draw()
{
  
 if(mousePressed)
 {
    for(int i=0;i<tam;i++)
    {
      PVector d = new PVector(p[i].pos.x,p[i].pos.y);
      d.x-=mouseX;
      d.y-=mouseY;
     if(d.mag()<200)
     {
        float tu=d.mag();
        tu*=map(tu,0,200,0,0.3);
        float angulo = atan2(p[i].pos.y-mouseY,p[i].pos.x-mouseX);
        p[i].fuerza.x-=cos(angulo)*tu;
        p[i].fuerza.y-=sin(angulo)*tu;
     }
    }
 }
  background(0,50);
  for(int i=0;i<tam;i++)
  {
//    p[i].atraccion();
    p[i].colision(0.3);
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
  color col,cal,cel;
  particula[] otros;
  int[] vecinos;
  particula(int id_)
  {
    pos = new PVector(random(width/3,2*width/3),height/2);
    vel = new PVector(0,0);
    fuerza = new PVector(0,G);
    masa=1;
    col=0;
    id=id_;
    otros=p;
    cont=0;
  }
  void pintar()
  {
    fill(100,10,180,30);
    noStroke();
    ellipse(pos.x,pos.y,r,r);
    fill(int(map(vecinos.length,0,6,0,255)),cal,0);
    ellipse(pos.x,pos.y,r/4,r/4);
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
    if(pos.x>width-r)
    {
      pos.x=width-r/2;
      fuerza.x-=r/2;
    }
    if(pos.x<r)
    {
      pos.x=r/2;
      fuerza.x+=r/2;
    }
    if(pos.y<r)
    {
      pos.y=r/2;
      fuerza.y+=r/2;
    }
    if(pos.y>height-r)
    {
      pos.y=height-r/2;
      fuerza.y-=r/2;
    }
  }
  void colision(float m)
  {
    cont=0;
    for(int i=0;i<tam;i++)
    {
      if(i==id)continue;
      PVector d = new PVector(otros[i].pos.x,otros[i].pos.y);
      d.sub(pos);
      if(d.mag()<=r)
        cont++;
    }
    vecinos = new int[cont];
    cont=0;
    for(int i=0;i<tam;i++)
    {
      if(i==id)continue;
      PVector d = new PVector(otros[i].pos.x,otros[i].pos.y);
      d.sub(pos);
      float tu=r-d.mag();
      tu*=m;
      if(d.mag()<=r)
      {
         float angulo = atan2(otros[i].pos.y-pos.y,otros[i].pos.x-pos.x);
         fuerza.x-=cos(angulo)*tu;
         fuerza.y-=sin(angulo)*tu;
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
    for(int i=0;i<tam;i++)
    {
      if(i==id)continue;
      PVector d = new PVector(otros[i].pos.x,otros[i].pos.y);
      d.sub(pos);
      if((d.mag()<=h)&&d.mag()>r)
      {
        float tu=d.mag()-r;
        tu*=map(cont,0,10,0.2,0.01);
        float angulo = atan2(otros[i].pos.y-pos.y,otros[i].pos.x-pos.x);
        otros[i].fuerza.x-=cos(angulo)*tu;
     //     if(pos.y<=otros[vecinos[i]].pos.y)
            otros[i].fuerza.y-=sin(angulo)*tu;
      }
    }
    cal=int(map(cont,0,10,0,255));
  }
}

