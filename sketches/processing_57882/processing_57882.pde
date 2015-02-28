
//Mitsuko Verdery 
//Copyright 2012
//Hw #11

final int MAX = 50;

float [] wd;
float [] ht;
float [] x;
float [] y;
float [] mx;
float [] my;
color [] colo;

void setup()
{
  size (500, 500); 
  x = new float[MAX];
  array1 (x, 10, width-20);
  y = new float[MAX];
  array1 (y, 10, height-20);
  wd = new float[MAX];
  array1 (wd, 0, width*.1);
  ht = new float[MAX];
  array1 (ht, 0, height*.1);
  mx = new float [MAX];
  array1 (mx, 10, 20);
  my = new float [MAX];
  array1 (my, 10, 20);
  colo = new color[MAX];
  colorarray();
 
}

void draw()
{
  display();
  drawrect();
  bounce();
}

void array1 ( float [] array, float low, float high)
{
  for (int i = 0; i< array.length; i++) {
    array[i] = int(random(low, high)); 
  }
}

void colorarray()
{
  for (int i = 0; i<colo.length; i++)
  {
    colo[i] = color(random(255), random(255), random(255));
  }
}

void bounce()
{
  for (int i=0; i<x.length; i++)
  {
    x[i]+=mx[i];
    if (x[i] >width)
    {
      mx[i]=-mx[i];
    }
    else if (x[i] < 0)
    {
      mx[i]=-mx[i];
    }
    
    y[i]+=my[i];
    if (y[i] >height)
    {
      my[i]=-my[i];
    }
    else if (y[i] < 0)
    {
      my[i]=-my[i];
    }
  }
}

void drawrect()
{
  for (int i = 0; i< MAX; i++) 
  {
    fill (colo[i], 50);
    rect (x[i], y[i], wd[i], ht[i]);
  }
}

void display()
{
  strokeWeight(0);
  fill(255, 255, 255, 100);
  rect(0,0, width, height);
}

