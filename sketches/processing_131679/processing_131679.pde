
//Copyright Talha Aamir 2014

float x, y, wd, ht;
float diameter;
float dx;
float dy;
float x2, y2;
float dx2;
float dy2;

void setup()
{
  size(400, 400);
  x = 0;
  y = 0;
  wd = 400;
  ht = 400; 
  diameter = 50;
  dx = 3;
  dy = 0;
  x2 = width - diameter;
  y2 = width - diameter;
  dx2 = 5;
  dy2 = 0;
}

void draw()
{
 prepWindow();
 moveFigures();
 drawFigures();  
}

void prepWindow()
{
 fill(0);
 rect(0, 0, width, height);

}

void figure(float fx, float fy, float fdiameter) 
{
  fill(250, 250, 210);
  ellipse(fx + .5*fdiameter, fy + .5*fdiameter, fdiameter, fdiameter);
}

void moveFigures()
{//figure 1
  x = x + dx;
  y = y + dy;
  
  if(y <= 0)
  {
    println("1");
    dx = 3;
    dy = 0;
  }
  
  if(x + diameter > width)
  {
    println("2");
    dx = 0;
    dy = 3;
  } 
  
  if(y + diameter > height)
  {
    println("3");
    dx = -3;
    dy = 0;  
  }

  if(x < 0 && y + diameter > height)
  {
    println("4");
    dx = 0;
    dy = -3;
  }  
  
  //figure 2
  x2 = x2 + dx2;
  y2 = y2 + dy2;
  
  if(y2 <= 0)
  {
    println("1");
    dx2 = 5;
    dy2 = 0;
  }
  
  if(x2 + diameter > width)
  {
    println("2");
    dx2 = 0;
    dy2 = 5;
  } 
  
  if(y2 + diameter > height)
  {
    println("3");
    dx2 = -5;
    dy2 = 0;  
  }

  if(x2 < 0 && y2 + diameter > height)
  {
    println("4");
    dx2 = 0;
    dy2 = -5;
  }  
  
}

void drawFigures()
{
  figure(x, y, diameter);
  figure(x2, y2, diameter);
}


