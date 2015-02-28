
float x1 = 250;

float x2 = 0;
float x3 = 250;

float x5 = 0;
float x4 = 250;

float x6 = 500;
float x7 = 250;

float x8 = 500;
float x9 = 250;

void setup()
{
  size(500,500);
  smooth();
}

void draw()
{ 
stroke(16,156,229);

while(x3>0)  
while(x2<250)

{
  line(x1,x2,x3,x1);
  x2 = x2+5;
  x3 = x3-5;
  
}

  while(x5<250)
  while(x4<500)
  {
  line(x1,x5,x4,x1);
  x4 = x4+5;
  x5 = x5+5;
  }
  while(x6>250)
  while(x7>0)
{
  line(x1,x6,x7,x1);
  x6 = x6-5;
  x7 = x7-5;
  
}
 while(x8>250)
  while(x9<500)
{
  line(x1,x8,x9,x1);
  x8 = x8-5;
  x9 = x9+5;
  line(0,x1,500,x1);
  
}

}


