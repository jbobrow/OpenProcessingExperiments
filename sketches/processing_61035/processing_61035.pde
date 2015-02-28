
//project#2 - 48257 S'12
//melissa (macy) goh copyright 2012
//adapted from HW#11
 
final int MAX = 10;
float bound = -200;
  
float [] x;
float [] y;
float [] z;
float [] wd;
float [] sx;
float [] sy;
float [] sz;
color [] colour;

color pink = color(245, 49, 203);
  
void setup()
{
   size (400, 400, P3D);
   smooth();
        
   x = new float [MAX];
   initFloatArray(x, 50, width);   
   y = new float [MAX];
   initFloatArray(y, 50, height); 
   z = new float [MAX];
   initFloatArray(z, 0, bound);
    
   wd = new float [MAX];
   initFloatArray(wd, 50, width*.25);   
    
   sx = new float [MAX];
   initFloatArray(sx, 1, 10);   
   sy = new float [MAX];
   initFloatArray(sy, 1, 10);  
   sz = new float [MAX];
   initFloatArray(sz, 1, 10);  
    
   colour = new color [MAX];
   initColorArray();
   
   translate(width*.5, height*.5, 0);
}
  
void draw()
{
  background(0);
   
  for (int i = 0; i < MAX; i++)
  {
    drawThings(x[i], y[i], z[i], wd[i]);
  }
  moveThings(); 
  bounceThings();
}
  
void initFloatArray(float [ ] a, float low, float high)
{
  for (int i=0; i < a.length; i++)
  {
    a[i] = int(random(low,high));
  }
}
  
void initColorArray()
{
  for (int i=0; i < colour.length; i++)
  {
    colour[i] = color(random(0, 255), random(0, 255), 255);
  }
}
 
void drawThings(float x, float y, float z, float dia)
{
  pushMatrix();
  fill(pink, 50);
  translate(x, y, z);
  rotateX(10);
  rotateY(10);
  rotateZ(10);
  sphere(dia);
  popMatrix();
}
 
void moveThings()
{
  for (int i=0; i < MAX; i++)
  {
    x[i] = x[i] + sx[i];
    y[i] = y[i] + sy[i];
    z[i] = z[i] + sz[i];
  }
}

void bounceThings()
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


