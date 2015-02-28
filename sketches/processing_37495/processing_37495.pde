
int x=0;
int a=1;

void setup()
{
  size(200,200);
}

void draw()
{
  background(128);
  noStroke();
  rect(x,100,20,20);
  x=x+1*a;
  
  if((x<=0) || (x+20>=200))
    {
    a=a*-1;
    }
}

