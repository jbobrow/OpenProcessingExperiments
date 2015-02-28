
int a = 10;
int b = 10;
float c = 255;
float d = 255;
float e = 255;

void setup()
{
  
  size (800,800);
  smooth();
  
}

void draw()
{
   stroke(c,d,e,70);
   strokeWeight(90);
 
  if (a<790)
  {
 line(10,a,790,b);
 
  }
 
 a = a+1;
 b = b+1;
 c = c+random(-10,10);
 d = d+random(-10,10);
 e = e+random(-10,10);
 
  
}

