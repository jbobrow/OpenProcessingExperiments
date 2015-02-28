
//HW 12 -- faux screen saver
//copyright Jessica Schafer, Pittsburgh, PA, November 2011
//gravity based on:
// Learning Processing
// Daniel Shiffman
// Example 5-9: Simple Gravity

final int MAX = 25;
float [] diam = new float [MAX];
float [] x = new float [MAX];
float [] y = new float [MAX];
float [] z = new float [MAX];
float [] deltay = new float [MAX];
float [] deltax = new float [MAX];
color [] cols = new color [MAX];

float gravity;

void setup ()
{
  size (600, 400, P3D);
  noStroke(); 
  noSmooth();
  sphereDetail(5);
  initVaryValueArray (diam, width/25, width/15);
  initVaryValueArray (x, -width/2, width/2);
  initVaryValueArray (y, -width/2, -width/10);
  initVaryValueArray (z, -width/2, width/2);
  initSameValueArray (deltay, 0);
  initSameValueArray (deltax, 0);
  initializeColors();
  gravity = 0.2;
}


void draw ()
{
  setSceen();
  drawObject();
  bounceObject();
  checkOffScreen();
}

void checkOffScreen()
{
  for(int i = 0; i<MAX; i++)
   { 
    if (abs(x[i]) > width/2+diam[i])
     {
       diam[i] = random (width/25, width/15);
       y[i] = random (-width/2, -width/10);
       x[i] = random (-width/2, width/2);
       z[i] = random(-width/2, width);
       cols[i] = color(random(255), random(255), random(255), random(150, 250));
       deltay[i] = 0;
       deltax[i] = 0;
     }
   }
}


void bounceObject()
{
  for (int i = 0; i<MAX; i++)
  {
     y[i] = y[i] + deltay[i];
     x[i] = x[i] + deltax[i];
     deltay[i] = deltay[i] + gravity;
     if (y[i]> height)
      {
       deltay[i] = deltay[i]*-0.85;
        if (x[i] > 0)
         { deltax[i] = deltax[i]+gravity;}
        else
        {deltax[i] = deltax[i]-gravity;}
      }
  }
}

void drawObject()
{ 
 for (int i = 0; i <MAX; i++)
   {
     fill(cols[i]);
     pushMatrix();
       translate (x[i], y[i], z[i]);
       sphere (diam[i]); 
     popMatrix();
   }
} 

void initVaryValueArray (float[]array, float small, float large)
{
  for (int i = 0; i<array.length; i++)
  {
   array[i] = random(small, large); 
  }
}

void initSameValueArray (float[]array, float v)
{
  for (int i = 0; i<array.length; i++)
  {
   array[i] = v; 
  }
}

void initializeColors ()
{
  for (int i = 0; i<cols.length; i++)
  {
   cols[i] = color(random(255), random(255), random(255), random(150, 250)); 
  }
}


void setSceen()
{
 background(0);
 translate (width/2, 0, 0);
 //lights(); 
 pointLight (0, 255, 255, -width, 0, width);
 pointLight (255, 255, 0, width, 0, width);
  
}

