
// homeWork (12); 
// copyright Carl Bajandas 2011 Pittsburgh, PA

///////////////////////////////////////////
////////////// WORKS IN PROCESSING NaN ERROR
///////////////////////////////////////////////////////


int BUBBLES = 100;

float [] x = new float [BUBBLES];
float [] y = new float [BUBBLES];
float [] z = new float [BUBBLES]; 
float [] vx= new float [BUBBLES];
float [] vy= new float [BUBBLES];
float [] vz= new float [BUBBLES];


void setup ()
{
  size (500, 500, P3D);  
  initArray (x, 0, width);
  initArray (y, 0, height);
  initArray (z, 0, width );
  initArray (vx, .5, 7);
  initArray (vy, .5, 7); 
  initArray (vz, .5, 7);
}
void draw ()
{
  directionalLight(255, 255, 255, 0, 0, -1);
  background (0, 0, 130);
  bubbles();
  drowningMan();
}
void initArray (float []f, float low, float high)
{
  for (int i=0; i < f.length; i++)
    f[i]= random (low, high);
}
void bubbles ()
{
  for (int i=0 ; i < x.length; i++) 
  {
    pushMatrix ();
    translate (x[i], y[i], z[i]);
    fill (255);
    noStroke ();
    sphere (10);
    popMatrix ();
  }
}
void drowningMan ()
{
  for (int i=0 ; i < x.length; i++) 
  {

    x[i] -= vx[i];
    y[i] -= vy[i];
    z[i] -= vz[i];

    if ( x[i] < -90)
    {
      x[i] = width + 90 ;
    }

    if (y[i] < - 20) 
    {
      y[i] = height + 20 ;
    }
    if (y[i] > height*10)
    {
      y[i] = -20;
    }
    if ( z[i] < -height*10)
    {
      z[i] = width ;
    }
  }
}

