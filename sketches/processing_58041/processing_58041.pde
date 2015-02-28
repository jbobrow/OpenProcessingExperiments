
// 48-257, bumyeolk_HW11
// Bumyeol Kim, Copyright 2012

int MAX = 50;

float [] x;
float [] y;
float [] px;
float [] py;
float [] dia;
color [] clr;

void setup()
{
  size(600, 600);
  noStroke();
  
  x = new float [MAX];
  y = new float [MAX];
  px = new float [MAX];
  py = new float [MAX];
  dia = new float [MAX];
  clr = new color [MAX];
  
  initArray(x, 5, width-5);
  initArray(y, 5, height-5);
  initArray(px, .2, 3);
  initArray(py, .2, 3);
  initArray(dia, 40, width*.2);
  initColor( );
}

void draw()
{
  prepScreen();
  moveForms();
  drawForms();
}

void initArray(float [] floatArray, float low, float high)
{
  for(int i = 0; i < floatArray.length; i++)
  {
    floatArray[i] = int(random(low, high));
  }
}

void initColor( )
{
  for(int i = 0; i < clr.length; i++)
  {
    clr[i] = color(random(255), random(255), random(255));
  }
}

void prepScreen()
{
  noStroke();
  fill(255, 53, 34, 10);
  rect(0, 0, width, height);
}

void moveForms()
{
  for(int i = 0; i < MAX; i++)
  {
    x[i] = x[i] + px[i];
    if(x[i] > width)
    {
      px[i] = -px[i];
    }
    if(x[i] < 0)
    {
      px[i] = -px[i];
    }
    
    y[i] = y[i] + py[i];
    if(y[i] > height)
    {
      py[i] = -py[i];
    }
    if(y[i] < 0)
    {
      py[i] = -py[i];
    }
  }
}

void drawForms()
{
  for(int i = 0; i < MAX; i++)
  {
    fill(clr[i], 90);
    ellipse(x[i], y[i], dia[i], dia[i]);
  }
}



