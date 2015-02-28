
int nrc=150;
cel[] c=new cel[nrc];
void setup()
{
  background(0);
  stroke(255);
  smooth();
  size(400,400);
  cellInit();

}

void cellInit()
{
  for(int i=0;i<nrc;i++)
  {
    c[i]=new cel(random(400),random(400),(int)(sin((float)i/nrc*3.14)*127+100),abs((int)(cos((float)i/nrc*3.14)*127+100)),(int)sqrt(abs((int)(cos((float)i/nrc*3.14)*127+100)*(int)(sin((float)i/nrc*3.14)*127+100))));
  }
  for(int i=0;i<nrc;i++)
  {
    c[i].urm=c[(i+1)%nrc];
    c[i].ant=c[(i+2)%nrc];
  }
}


void draw()
{
  background(0);
  for(int i=0;i<nrc;i++)
  {
    if(c[i]!=null)
      c[i].draw();
  }

}

void mousePressed()
{
  if(mouseButton==LEFT)
    for(int i=0;i<10;i++)
    {
      int randCell=(int)random(nrc);
      c[randCell].v.x=mouseX;
      c[randCell].v.y=mouseY;
    }
  else if(mouseButton==RIGHT)
    cellInit();
}

class cel
{
  float x,y;
  PVector v;
  cel urm;
  cel ant;
  float facturm=0.4;
  int r,g,b;
  float ls=10,li=11;

  cel(float x,float y,int ri,int gi,int bi)
  {
    r=ri;
    b=bi;
    g=gi;
    this.x=x;
    this.y=y;
    v=new PVector(x,y);
    println("i " + ri + " " + gi + " " + bi);
  }

  void draw()
  {
    float d1,d2;
    if(urm!=null)
      d1=dist(x,y,urm.x,urm.y);
    else
      d1=li;
    if(ant!=null)
      d2=dist(x,y,ant.x,ant.y);
    else
      d2=li;

    if(d1>ls)
    {
      PVector gainurm=PVector.sub(urm.v,v);
      gainurm.normalize();
      gainurm.mult(facturm*(d1-ls));
      v.add(gainurm);
    }
    if(d2>ls && ant!=null)
    {
      PVector gainant=PVector.sub(ant.v,v);
      gainant.normalize();
      gainant.mult(facturm*(d2-ls));
      v.add(gainant);
    }
    if(d1<li)
    {
      PVector gainurm=PVector.sub(v,urm.v);
      gainurm.normalize();
      gainurm.mult(facturm*(li-d1));
      v.add(gainurm);
    }
    if(d2<li)
    {
      PVector gainant=PVector.sub(v,ant.v);
      gainant.normalize();
      gainant.mult(facturm*(li-d2));
      v.add(gainant);
    }

    //PVector gainrand= new PVector((random(10)-5)/2,(random(10)-5)/2);
    //v.add(gainrand);
    strokeWeight(2);
    point(v.x,v.y);

    if(v.y<10)
      v.y=10;
    if(v.y>390)
      v.y=390;

    if(v.x<10)
      v.x=10;
    if(v.x>390)
      v.x=390; 

    x=v.x;
    y=v.y;
    stroke(r,g,b);
    strokeWeight(1);
    line(x,y,urm.x,urm.y);
    line(x,y,ant.x,ant.y);
  }

}










