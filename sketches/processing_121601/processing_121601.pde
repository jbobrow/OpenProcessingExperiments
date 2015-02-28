
int numBolas=200;
float x[], y[];
float vx[], vy[];
float radi=5;
 
void setup()
{
  size(600,600);
  x=new float[numBolas];
  y=new float[numBolas];
  vx=new float[numBolas];
  vy=new float[numBolas];
  //inicialitzo totes les variables
  for (int i=0; i<numBolas; i=i+1)
  {
      x[i]=random(width);
      y[i]=random(height);
      vx[i]=5;
      vy[i]=5;
  }
  background(255);
}
 
 
void draw()
{
  background(255);
  for (int i=0; i<numBolas; i=i+1)
  {
    pushMatrix();
    translate(x[i],y[i]);
    ellipse(0,0, 2*radi, 2*radi);
    popMatrix();
    x[i]=x[i]+vx[i];   
    y[i]=y[i]+vy[i];  
    ControlVariables();
  }
}

void ControlVariables()
{
  float aux;
  for (int i=0; i<numBolas; i=i+1)
  {
    if (x[i]>width)
      vx[i]=-5;
    if (x[i]<0)
      vx[i]=5;
    if (y[i]>height)
      vy[i]=-5;
    if (y[i]<0)
      vy[i]=5;
  }
  
  
}

