
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
      vx[i]=random(10);
      vy[i]=random(10);
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
      y[i]=y[i]+vy[i];    
    popMatrix();
  }
}
