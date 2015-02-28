
//Jimmy C; Block 6; CP1

void setup()
{
  size(960, 540, P3D);
  frameRate(2);
  smooth();
  noStroke();
}

void draw()
{
  background(0);
  pointLight(255, 255, 255, -500, 250, 300);
  pointLight(255, 255, 255, 500, 250, 300);
  pointLight(255, 255, 255, 600, 250, -300000);
  int i = 1;
  while (i <= 100)
  {
    int r = int(random(0, 255));
    int b = int(random(0, 255));
    int g = int(random(0, 255));
    fill(r, b, g, 100);
    int xoffset = int(random(0, 960));
    int yoffset = int(random(0, 540));
    int zoffset = int(random(-2000, 20));
    translate (xoffset, yoffset, zoffset);
    int size = int(random(80, 100));
    box(size);
    i++;
    translate (-xoffset, -yoffset, -zoffset);
  }
}
