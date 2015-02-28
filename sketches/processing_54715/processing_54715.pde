
// Homework #11 48-257
// Humaira Tasnim htasnim Copyright 2012

final int MAX = 20;

float [] x;
float [] y;
float [] s;
float [] dx;
float [] dy;
color [] col;

void setup()
{
   size (600, 600);
   
   x = new float [MAX];
   initFloatArray(x, 50, width-50);
   
   y = new float [MAX];
   initFloatArray(y, 50, height-50);
   
   s = new float [MAX];
   initFloatArray(s, 10, width*.15);
   
   dx = new float [MAX];
   initFloatArray(dx, 2, 10); 
   
   dy = new float [MAX];
   initFloatArray(dy, 2, 10); 
   
   col = new color [MAX];
   initColorArray();
}

void draw()
{
  prepScreen();
  moveStuff();
  drawStuff();
}

void initFloatArray(float [ ] arr, float low, float high)
{
  for (int i=0; i < arr.length; i++)
  {
    arr[i] = int(random(low,high));
  }
}

void initColorArray( )
{
  for (int i=0; i < col.length; i++)
  {
    col[i] = color(random(30,256), random(220,256), random(30,256));
  }
}

void moveStuff( )
{
  for (int i=0; i < MAX; i++)
  {
    x[i] = x[i] + dx[i];
    if (x[i]+(s[i]/2) > width)
    {
      dx[i] = -dx[i];
    }
    else if (x[i]-(s[i]/2) < 0)
    {
      dx[i] = -dx[i];
    }
    
    y[i] = y[i] + dy[i];
    if (y[i]+(s[i]/2) > height)
    {
      dy[i] = -dy[i];
    }
    else if (y[i]-(s[i]/2) < 0)
    {
      dy[i] = -dy[i];
    }
  }
}

void drawStuff( )
{
  for (int i=0; i < MAX; i++)
  {
    smooth();
    noStroke();
    rectMode(CENTER);
    fill(col[i]);
    rect(x[i], y[i], s[i]-20, s[i]-20);
    fill(col[i], 150);
    rect(x[i], y[i], s[i], s[i]);
  }
}

void prepScreen( )
{
  rectMode(CORNER);
  fill(#489298);
  rect(0, 0, width, height); 
}

