
int a = 500;
int b = 500;
int c = -500;
float x=-.5;
float y=.5;
float z=.5;


void setup()
{
  size(1000,1000,P3D);
  noFill();
  stroke(75);
  frameRate(30);
}

void draw()
{
  int d = int(random(0,6));
  if(d == 0)
  {
    a=a+25;
  }
  else if(d == 1)
  {
    a=a-25;
  }
  else if(d == 2)
  {
    b=b+25;
  }
  else if(d == 3)
  {
    b=b-25;
  }
  else if(d == 4)
  {
    c=c+25;
  }
  else
  {
    c=c-25;
  }
  
  translate(a,b,c);
  
  rotateX(-.75);
  rotateY(.75);
  

  
  if(keyPressed == true && key == 'x')
  {
    rotateX(x);
    x=random(-2,-2);
  }
  if(keyPressed == true && key == 'y')
  {
    rotateY(y);
    y=random(-2,-2);
  }
  if(keyPressed == true && key == 'z')
  {
    rotateZ(z);
    z=random(-2,-2);
  }
  
  box(25);
}

