
int m= 500;
int x= 0;
int m2= 500;
int x2= 0;
int change= 5;
int change2= 5;

void setup()
{
  size(500, 500);
  background(255);
  noFill();
  frameRate(10);
}

void draw()
{
  myTriangle();
  myRect();
}

void myRect()
{
  stroke(0,227,255);
  rect(x,x,m,m);
  m=m-2*(change2);
  x=x+change2;
  if(x>500)
  {
    change2= -5;
  }
  if(x<0)
  {
    change2= 5;
  } 
}

void myTriangle()
{
  fill(0,0,0,10);
  rect(0,0,500,500);
  stroke(255);
  triangle(250,x2,x2,m2,m2,m2);
  m2=m2-change;
  x2=x2+change;
  if(x2>500)
  {
    change = -5;
  }
  if(x2<0)
  {
    change = 5;
  }
}
