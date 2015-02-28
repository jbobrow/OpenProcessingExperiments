
int x =0;
int y =0;
int w =1000;
int h =500;
int a = 120;
int b = 200;

void setup()
{
  size(1000,500);
  
 
  background(0);
}

void draw ()
{
stroke(a, b);
b = b - 4;
  line(x,y,w,h );
  h= h - 10 ;
  smooth();
  
  
  

 
  }

