
//computer arts for processing 60-257
//hw #11 a psuedo screensaver
//copyright kyree 2012

final int MAX = 100;
float [] x;
float [] y;
float [] ht;
float [] wd;
float [] ax;
float [] ay;
color [] c;


void setup()
{
 size (600,600);
 smooth();
 
  x = new float [MAX];
  initFloatArray(x, 70, width);    
  y = new float [MAX];
  initFloatArray(y, 70, height);  
  ht = new float [MAX];
  initFloatArray(ht, 70, width*.25);
  wd = new float [MAX];
  initFloatArray(wd, 70, width);  
  ax = new float [MAX];
  initFloatArray(ax, 5, 10);    
  ay = new float [MAX];
  initFloatArray(ay, 5, 10);    
  c = new color [MAX];
  initColorArray();

}

void draw()
{
 background (#AEC934); 
 drawBoxes();
 shakeBoxes();
}


void initFloatArray(float [ ] ray, float low, float high)
{
  for (int i=0; i < ray.length; i++)
  {
    ray[i] = int(random(low,high));
  }
}



void initColorArray( )
{
  for (int i=0; i < c.length; i++)
  {
    c[i] = color(#cdcdcd, random(20,200));
  }
}


void drawBoxes()
{
  strokeWeight(3);
  for (int i=0; i < MAX; i++)
  {
    
    fill(c[i]);
    pushMatrix();
    translate(x[i],y[i]);
    rotate(radians(frameCount));
    rect(0,0, ht[i]-25, ht[i]-25);
    popMatrix();
  }
}
    

void shakeBoxes()
{
  for (int i=0; i < MAX; i++)
    {
    x[i] = x[i] + ax[i];
    if (x[i]/2+(ht[i]/2) > width)
      {
      ax[i] = -ax[i];
       }
 
    else if (x[i]/2 - (ht[i]/2) <0)
      {
      ax[i] = -ax[i];
      }
    
    
    
    y[i] = y[i] + ay[i];
    if (y[i]/2+(wd[i]/2) > height)
      {
      ay[i] = -ay[i];
      }
    
    else if (y[i]/2-(wd[i]/2) < 0)
      {
      ay[i] = -ay[i];
      }
    }
}

