


int x =0;
int y =0;
int w =1000;
int h =500;

int a = 120;
int b = 200;

int e = 1000;
int d = 0;
int f = 0;
int g = 500;


void setup()
{
  size(1000,500);
  
  background(0); 
 
}

void draw ()
{

stroke(a, b);
a = a - 10;
  line(x,y,w,h );
  h= h - 40;
  smooth();
 
line(e,d, f,g);
g = g - 40;
smooth();
  
  }
  
 

