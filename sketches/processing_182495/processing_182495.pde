
Cube[] cubes;
float rotX = 0;
float rotY = 0;
float rotZ = 0;

void setup()
{
  size(800, 800, P3D);
  cubes = new Cube[100];
  for(int i = 0; i < 100; i++)
  {
    cubes[i] = new Cube();
  }
}

void draw()
{
  background(255);
  lights();
  for(int i = 0; i < 100; i++)
  {
    pushMatrix();
    translate(cubes[i].x, cubes[i].y, cubes[i].z);
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    cubes[i].show();
    popMatrix();
  }
  rotX+=.01;
  rotY+=.01;
  rotZ+=.01;
}

class Cube
{
  int x, y, z, side, colour;
  Cube()
  {
    x = (int)(Math.random() * 800);
    y = (int)(Math.random() * 800);
    z = (int)(Math.random() * 200);
    side = (int)(Math.random() * 100);
    colour = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255), 100);
  }
  void show()
  {
    noStroke();
    fill(colour);
    box(side);
  }
}


