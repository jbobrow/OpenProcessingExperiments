
//Eric K, CP1 mods 4-5, Rotating Cubes
//url: http://ericsprogrammingsite.webs.com/Rotating_Cubes.html

/* @pjs globalKeyEvents="true"; */

/**
 Creates a cube of cubes.<p>
 You can alternate view modes using the spacebar.<br>
 You can change the number of cubes on each edge using '+' or '-'.<p>
 
 In view mode 1, move the mouse to rotate the cube(s).<br>
 Press '1' and '9' to zoom in and out, respectively.<p>
 In view mode 2, press the number keys to move.<br>
 Press '4' and '6' to move left and right.<br>
 Press '8' and '2' to move up and down.<br>
 Press '1' and '9' to move forward and backward.
 */

int viewMode = 1;
int n = 3;
float posX = 0;
float posY = 0;
float posZ = 0;
int distance = 30;
int ix;
int iy;
int iz;
void setup()
{
  size(500, 500, P3D);
  noStroke();
}
void draw()
{
  background(0);
  camera(posX, posY, posZ, 0, 0, 0, 0, 1, 0);
  pointLight(0, 255, 255, posX, posY, posZ);
  ix = 0;
  while (ix < n)
  {
    iy = 0;
    while (iy < n)
    {
      iz = 0;
      while (iz < n)
      {
        translate((n-1)*-75+ix*150, (n-1)*-75+iy*150, (n-1)*-75+iz*150);
        box(100);
        translate((n-1)*75-ix*150, (n-1)*75-iy*150, (n-1)*75-iz*150);
        iz = iz + 1;
      }
      iy = iy + 1;
    }
    ix = ix + 1;
  }
  interaction();
}
void interaction()
{
  if (viewMode == 1)
  {
    posX = (-4*mouseX+2*width)*distance/20;
    posY = (-4*mouseY+2*height)*distance/20;
    posZ = n * distance * 3;
    if (keyPressed)
    {
      if (key == '9' && distance < 49)
      {
        distance = distance + 1;
      }
      if (key == '1' && distance > 10)
      {
        distance = distance - 1;
      }
    }
  }
  else
  {
    if (keyPressed)
    {
      if (key == '6')
      {
        posX = posX + 10;
      }
      if (key == '4')
      {
        posX = posX - 10;
      }
      if (key == '2')
      {
        posY = posY + 10;
      }
      if (key == '8')
      {
        posY = posY - 10;
      }
      if (key == '1')
      {
        posZ = posZ + 10;
      }
      if (key == '9')
      {
        posZ = posZ - 10;
      }
    }
  }
}
void keyPressed()
{
  if (key == ' ')
  {
    viewMode = viewMode + 1;
    if (viewMode > 2)
    {
      viewMode = 1;
    }
  }
  if (key == '+' && n < 12)
  {
    n = n + 1;
  }
  if (key == '-' && n > 1)
  {
    n = n - 1;
  }
}
