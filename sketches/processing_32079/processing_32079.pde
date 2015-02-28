
int x =0;
int y =0;
int w =1000;
int h =500;

int j =0;
int k =500;
int l =1000;
int m =40;


int a = 120;
int b = 200;

int e = 1000;
int d = 0;
int f = 0;
int g = 500;

int x2 = 40;

int a2 = 1000;
int b2 = 500;
int c2 = 0;
int d2 = 40;

void setup()
{
  size(1000,500);
  
 
  background(0);
}

void draw ()
{
stroke(a, b);
b = b - 10;
  line(x,y,w,h );
  h= h - 5;
  smooth();
 
line(e,d, f,g);
g = g - 5;
smooth();
  
  
line(j,k,l,m);
m = m + 5;
smooth();


line(a2,b2,c2,d2);
d2 = d2 + 5;
smooth();

strokeWeight(2);
  }

