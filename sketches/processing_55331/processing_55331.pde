
//homework #11 - 48257 S'12
//melissa (macy) goh copyright 2012
//used Homework 11 notes

final int MAX = 20;
 
float [] x;
float [] y;
float [] wd;
float [] sx;
float [] sy;
color [] colour;
 
void setup()
{
   size (400, 400);
   smooth();
   noStroke();
       
   x = new float [MAX];
   initFloatArray(x, 50, width);    
   y = new float [MAX];
   initFloatArray(y, 50, height);  
   
   wd = new float [MAX];
   initFloatArray(wd, 50, width*.25);    
   
   sx = new float [MAX];
   initFloatArray(sx, 1, 10);    
   sy = new float [MAX];
   initFloatArray(sy, 1, 10);    
   
   colour = new color [MAX];
   initColorArray();
}
 
void draw()
{
  background(0);
  
  drawThings();
  moveThings();  
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

void drawThings()
{
  for (int i=0; i < MAX; i++)
  {
    fill(colour[i], 60);
    rect(x[i], y[i], wd[i], wd[i]);
  }
}

void moveThings()
{
  for (int i=0; i < MAX; i++)
  {
    x[i] = x[i] + sx[i];
    
    if (x[i] + (wd[i]/2) > width)
    {
      sx[i] = -sx[i];
    }
    if (x[i] - (wd[i]/2) < -wd[i])
    {
      sx[i] = -sx[i];
    }
     
    y[i] = y[i] + sy[i];
    
    if (y[i] + (wd[i]/2) > height)
    {
      sy[i] = -sy[i];
    }
    
    if (y[i] - (wd[i]/2) < -wd[i])
    {
      sy[i] = -sy[i];
    }
  }
}


