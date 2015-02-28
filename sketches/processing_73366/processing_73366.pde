
//Justin J. Rotating Cube, CP 1, Mods 16/17
int x=250;
int y=250;
int z=0;
float r=.25;
void setup()
{
  size(500, 500, P3D);
  background(0);
  frameRate(100);
}
void draw()
{
  background(0);
  translate(x, y, z);
  int direction=int(random(6));
  if (direction==0)
  {
    x=x+2;  //right
  }
  else if (direction==1)
  {
    x=x-2;  //left
  }
  else if (direction==2)
  {
    y=y+2;  //down
  }
  else if (direction==3)
  {
    y=y-2;  //up
  }
  else if (direction==4)
  {
    z=z+2;  //backward
  }
  else  //direction==5
  {
    z=z-2;  //forward
  }  
  rotateX(r);
  rotateY(1+r);
  rotateZ(1-r);
  if (r>25)  //color change
  {
    fill(164, 24, 216);
    if (r>30)
    {
      r=0;
    }
  }
  else if (r>20)
  {
    fill(24, 99, 216);
  }
  else if (r>15)
  {
    fill(52, 162, 53);
  }
  else if (r>10)
  {
    fill(250, 233, 38);
  }
  else if (r>5)
  {
    fill(240, 116, 22);
  }
  else
  {
    fill(250, 20, 20);
  }
  box(85);
  r=r+.025;
}
