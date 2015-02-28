

float y=.3;
float x=0;
int z=0;
int num=0;
int translateX=150;
int translateY=150;
int moveX=150;
int moveY=150;
float orbitY=.0;
void setup()
{
  size(300, 300, P3D);
}

void draw ()
{
  background(0);
  {
  translate(moveX, moveY, z);
  rotateX(x);
  rotateY(y);
  rotateZ(0);
  }
  if (key=='q')
  {
    x=x+.1;
  }
  else if (key=='e')
  {
    x=x-.1;
  }
  else
  {
    y=y+.1;
  }
  box(100);
  if (key=='c')
  {
    num=int(random(-1, 4));
  }
  if (num>1)
  {
    fill(255, 0, 0);
  }
  else if (num==1)
  {
    fill(0, 255, 0);
  }
  else 
  {
    fill(0, 0, 255);
  }
}
void keyPressed ()
{
  if (key=='z'&& z<100)
  {
    z=z+10;
  }
  if (key=='x' && z>-250)
  {
    z=z-10;
  }
  else
  {
    z=z;
  }
  if (key=='w' && moveY>25)
  {
    moveY=moveY-10;
  }
  if (key=='s' && moveY<250)
  {
    moveY=moveY+10;
  }
  if (key=='a' && moveX>0)
  {
    moveX=moveX-10;
  }
  if (key=='d' && moveX<275)
  {
    moveX=moveX+10;
  }
}
