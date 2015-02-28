
float x = 0;

float y = 0;

float z = 0;

float a = 0;

float b = 0;

float c = 0;

float d = 0;

float e = 0;

float f = 0;

float g = 0;

float h = 0;

float i = 0;

void setup()
{
  size(800,800);
  background(255,255,255);
}
void draw()
{
  fill(10,237,247);
  rect(0,0,800,800);
  
  fill(255,255,255);
  noStroke();
  ellipse(100,400,300,50);
  
  fill(255,255,255);
  noStroke();
  ellipse(700,200,300,50);
  
  fill(0,0,0);
  quad(320,180,480,180,470,500,330,500);
  
  fill(0,0,0);
  rect(0,150,800,10);
  
  fill(247,212,10);
  noStroke();
  rect(340,160,120,370);
  
  fill(a,b,c);
  ellipse(400,250,60,60);
  
  fill(d,e,f);
  ellipse(400,350,60,60);
  
  fill(g,h,i);
  ellipse(400,450,60,60);
  
  if (key == 'b')
  {
    if(y == 0 && z == 1)
    {
    g = 0;
    h = 0;
    i = 0;
    a = 247;
    b = 30;
    c = 10;
    z = 0;
    x = 1;
    }
  }
     
if (key == 'b')
  {
    if(z == 0 && x == 1)
    {
      a = 0;
      b = 0;
      c = 0;
      d = 243;
      e = 247;
      f = 10;
      x = 0;
      y = 1;
      
    }
  }
  
if (key == 'b')
  {
    if(x == 0 && y == 1)
    {
      d = 0;
      e = 0;
      f = 0;
      g = 21;
      h = 206;
      i = 50;
      y = 0;
      z = 1;
    }
  }
      
}


