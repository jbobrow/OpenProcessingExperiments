
int a = 0;
int b = 0;
int c = 500;
int d = 500;
int e = 120;
int f = 200;

int a2= 1000;
int b2 = 0;
int c2 = 500;
int d2 = 500;
void setup()
{
  size(1000,500);
  background(0);
    
}

void draw ()
{

  stroke(e,f);
  e = e - 10;
  
  line(a,b,c,d);
  d = d - 40;

 
 line(a2, b2, c2, d2);
 d2 = d2 - 40;
  smooth();
 


  
}

