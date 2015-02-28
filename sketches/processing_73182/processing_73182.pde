
//Grace O Computer Programming 1 Mods 14-15
/** Click to create a new string of boxes. Press any key to clear
 the screen and start again. Click and drag to change the position
 of the "camera".*/
 
int x=250;
int y=250;
int z=250;
int direction = int(random(0, 6));
void setup()
{
  size(500, 500, P3D);
}
void draw()
{
  translate(x, y, z);
  rotateX(-.3);
  rotateY(.3);
  fill(x, y, z);
  box(20);
  int direction = int(random(0, 6));
  if (direction == 0)
  {
    x=x+20;
  }
  else if (direction == 1)
  {
    x=x-20;
  }
  else if (direction ==2)
  {
    y=y+20;
  }
  else if (direction==3)
  {
    y=y-20;
  }
  else if (direction ==4)
  {
    z=z+20;
  }
  else
  {
    z=z-20;
  }
  if (mousePressed==true)
  { 
    x=mouseX;
    y=mouseY;
    z=0;
  }
  if (keyPressed==true)
  {

    camera(400, -1200, 10, 0, 0, 0, 0, 1, 0);
    background(200);
    x=250;
    y=250;
    z=-250;
  }
}
void mouseDragged()
{
  camera(3*mouseX-100, 3*mouseY-100, 200, 0, 0, 0, 0, 1, 0);
}
