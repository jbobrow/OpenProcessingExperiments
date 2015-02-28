
import processing.opengl.*;
int tam=400,ei=0;
float G=0,r=20,h=2*r,k=0.004;
particula[] p = new particula[tam+1];
void setup()
{
  size(900,450,P2D);
  for(int i=0;i<tam;i++)
    p[i]=new particula(i);
  noFill();
  //  stroke(0,0,255);
  strokeWeight(r);
}
void draw()
{
  if(mousePressed)
  {
    if(ei<tam-1)
      ei++;
    p[ei].pos.x=mouseX+random(-20,20);
    p[ei].pos.y=mouseY+random(-20,20);
  }
  if(ei==tam-1)
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
          tu*=map(tu,0,200,0,0.08);
          float angulo = atan2(p[i].pos.y-mouseY,p[i].pos.x-mouseX);
          p[i].fuerza.x-=cos(angulo)*tu;
          p[i].fuerza.y-=sin(angulo)*tu;
        }
      }
    }
  }
  background(0);
  for(int i=0;i<ei;i++)
  {
    p[i].pared();
    p[i].densidad();
    p[i].presion();
    p[i].colision();
    p[i].mover();
    p[i].pintar();
  }
}
class particula
{
  PVector pos,vel,fuerza,fPres;
  float masa,den;
  int id,vecinas[],cont;
  color col,cal;
  particula[] otros;
  int[] vecinos;
  particula(int id_)
  {
    pos = new PVector(random(400,width-400),random(100,height-100));
    vel = new PVector(0,0);
    fuerza = new PVector(0,G);
    fPres = new PVector(0,0);
    den=1;
    masa=1;
    col=0;
    id=id_;
    otros=p;
    cont=0;
    //col=color(random(255),random(255),random(255));
    //cal=color(random(255),random(255),random(255));
    col=255;
    cal=255;
  }
  void pintar()
  {

    ellipse(pos.x,pos.y,r,r);
    stroke(int(map(den,0,25,0,255)),cal,int(map(den,25,0,100,0)));
    point(pos.x,pos.y);
  }
  void mover()
  {
    fuerza.mult(masa);
    // fPres.mult(1/den*0.5);
    fuerza.add(fPres);
    vel=new PVector(fuerza.x,fuerza.y);
    pos.add(fuerza);
    fuerza = new PVector(0,G);
  }
  void pared()
  {
    if(pos.x>width-r/2)
    {
       pos.x=width-r/2;
      //pos.x=width-pos.x;
      // fuerza.x*=-1;
    }
    if(pos.x<r/2)
    {
       pos.x=r/2;
      //pos.x-=pos.x;
      //fuerza.x*=-1;
    }
    if(pos.y<r/2)
    {
       pos.y=r/2;
      //fuerza.y-=pos.y;
      //fuerza.y*=-1;
    }
    if(pos.y>=height-r/2)
    {
       pos.y=height-r/2;
      //fuerza.y+=height-pos.y-r/2;
      //fuerza.y*=-1;
    }
  }
  void colision()
  {
    for(int i=0;i<ei;i++)
    {
      if(i==id)continue;
      PVector d = new PVector(otros[i].pos.x,otros[i].pos.y);
      d.sub(pos);
      if(d.mag()<=r)
      {
        float tu=r-d.mag();
        //tu*=0.2;
        float angulo = atan2(otros[i].pos.y-pos.y,otros[i].pos.x-pos.x);
        fuerza.x-=cos(angulo)*tu;
        fuerza.y-=sin(angulo)*tu;
        /*
        PVector u = otros[i].fuerza;
         u.sub(fuerza);
         fuerza = u;*/

        //  otros[vecinos[i]].fuerza.y+=sin(angulo)*tu;
        //  otros[vecinos[i]].fuerza.x+=cos(angulo)*tu;
      }
    }
  }
  void densidad()
  {
    den=0;
    for(int i=0;i<ei;i++)
    {
      if(i==id)continue;
      PVector d = new PVector(otros[i].pos.x,otros[i].pos.y);
      d.sub(pos);
      if(d.mag()<=2*h)
        if(den>otros[i].den)
          otros[i].den+=map(d.mag(),r/2,2*h,1,0);
        else
          den+=map(d.mag(),r/2,2*h,1,0);
    }
  }
  void presion()
  {
    fPres.x=0;
    fPres.y=0;
    for(int i=0;i<ei;i++)
    {
      if(i==id)continue;
      PVector d = new PVector(otros[i].pos.x,otros[i].pos.y);
      d.sub(pos);
      float m=d.mag();
      if(m<=2*h)
      {
        fPres.x+=den*(d.x/m)*k*map(m,r/2,2*h*15/den,1,0);
        fPres.y+=den*(d.y/m)*k*map(m,r/2,2*h*15/den,1,0);
      }
    }
  }
}
PVector WDelta(PVector n,float h, float ri)
{
  n.mult(-945/(32*PI*pow(h,9))*pow(pow(h,2)-pow(ri,2),2));
  return n;
}
void keyPressed()
{
  switch(keyCode)
  {
    case 40:
      k+=0.01;
    break;
    case 38:
      k-=0.01;
    break;
    case 37:
      h+=r;
    break;
    case 39:
      h-=r;
    break;
    
  }
}

