
int a=0;
int j=0;
int c=20;
int d=20;

float r;
float g;
float b;

void setup()
{
  size(1000,700);
  background(#F5C6C6);
}

void draw(){
r=random(250);
g=random(250);
b=random(250);
fill(r,g,b);
frameRate(50);
rect(a,j,c,d);
a=a+20;
if(a>width)
{
  a=-20;
  a=a+20;
  j=j+20;
}
}
