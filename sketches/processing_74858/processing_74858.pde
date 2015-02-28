
//Michelle Z, CP1 4-5, 100 Shapes

float r = 0;
float g = 0;
float b = 0;
int num = 1;
int boxSize = int(random(50, 150));

void setup()
{
  size(600, 600, P3D);
  background(0);
  noStroke();
  smooth();
}

void draw()
{
  int x = int(random(0, 600));
  int y = int(random(0, 600));
  int z = int(random(-200, 0));
  lights();
  fill(r, g, b);
  r = random(255);
  g = random(255);
  b = random(255);

  while (num < 300)
  {   
    translate(x, y, z);
    rotateX(random(1));
    rotateY(random(1));
    rotateZ(random(1));
    box(boxSize);
    translate(-x, -y, -z);
    num = num + 1;
  }
  if (num == 300)
  {
    num = 1;
  }
}


