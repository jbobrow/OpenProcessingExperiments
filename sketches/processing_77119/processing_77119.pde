
int a;
int a1;

void setup()
{
  size(100,100);
  background(0);
  a = 0;
  a1 = 1;
}

void draw()
{
  a = a+a1;
  
  
  if (a <= 0)
  {
    a1 = -a1;
  }
  
  if (a >=255)
  {
    a1 = -a1;
  }

  
  
  
  background(0);
  //background(0,a);
  fill(255,255,150, a);
  ellipse(width/2, height/2, 20, 20);
  //background(0,a);
  
}
  
  


