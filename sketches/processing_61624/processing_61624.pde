
//Mitsuko Verdery 
//Project 2 

final int MAX = 1;
float bound = -100;
   
float [] x;
float [] y;
float [] z;
float [] wd;
float [] sx;
float [] sy;
float [] sz;
PImage jordan;


   
void setup()
{
   
   size (248, 350, P3D);
   smooth();
         
   x = new float [MAX];
   initFloatArray(x, 60, width);  
   y = new float [MAX];
   initFloatArray(y, 60, height);
   z = new float [MAX];
   initFloatArray(z, 0, bound);
   wd = new float [MAX];
   initFloatArray(wd, 60, width*.25);  
   sx = new float [MAX];
   initFloatArray(sx, 1, 10);  
   sy = new float [MAX];
   initFloatArray(sy, 1, 10); 
   sz = new float [MAX];
   initFloatArray(sz, 1, 10); 
    
  // translate(width*.5, height*.5, 0);
  jordan = loadImage("jordan.jpeg");

}
   
void draw()
{
  background(0);
  jordan();
  for (int i = 0; i < MAX; i++)
  {
    drawsphere(x[i], y[i], z[i], wd[i]);
  }
  moveball();
  bounceball();
}
 
void jordan()
{
  image(jordan, 0, 0);
}
  
void initFloatArray(float [ ] a, float low, float high)
{
  for (int i=0; i < a.length; i++)
  {
    a[i] = int(random(low,high));
  }
}

  
void drawsphere(float x, float y, float z, float dia)
{
  fill(250, 145, 15);
  pushMatrix();
  translate(x, y, z);
  rotateX(10);
  rotateY(10);
  rotateZ(10);
  sphere(dia);
  popMatrix();
}

void moveball()
{
  for (int i=0; i < MAX; i++)
  {
    x[i] = x[i] + sx[i];
    y[i] = y[i] + sy[i];
    z[i] = z[i] + sz[i];
  }
}
 
void bounceball()
{
  for(int i = 0; i < MAX; i++)
  {
    if(x[i] < 0 || x[i] > width)
    {
      sx[i] = -sx[i];
    }
    else if(y[i] < 0 || y[i]> height)
    {
      sy[i] = -sy[i];
    }
    else if(z[i] > 0 || z[i] < bound)
    {
      sz[i] = -sz[i];
    }
  }
}


