
void setup()
{
  size(300, 300);
  smooth();
  background(255);
}

int tx, ty;
int w = -1;

void draw()
{
  background(255);
  if (w == -1) {
    raster();
  }
  strokeWeight(0.5);
  stroke(0);
  line(-width, ty, width, ty);
  line(tx, -height, tx, height);
  translate(tx, ty);
  if (w == 1) {
    raster();
  }
  fill(#0077FF);
  float ox = mouseX - tx;
  float oy = mouseY - ty;
  text(ox + ", " + oy, mouseX-tx, mouseY+30-ty);
}

void mousePressed()
{
  tx = mouseX;
  ty = mouseY;
}

void keyPressed()
{
  if(key == 'w')
  {
    w *= -1;
  }
  if(key == 'd')
  {
    tx = 0;
    ty = 0;
  }
}

void raster()
{
  for (int i = 0; i < width; i+=10)
  {
    stroke(0, 127);
    strokeWeight(0.25);
    line(i, 0, i, height);
    stroke(0);
    strokeWeight(0.5);
    line(i, 0, i, 3);
  }
  for (int i = 0; i < height; i+=10)
  {
    stroke(0, 127);
    strokeWeight(0.25);
    line(0, i, width, i);
    stroke(0);
    strokeWeight(0.5);
    line(0, i, 3, i);
  }
}
