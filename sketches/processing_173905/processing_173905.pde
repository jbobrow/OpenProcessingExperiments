
void setup()
{
  size(300,500);
}

void draw()
{
}

void keyPressed()
{
  int z = int(random(255));
  background(z,255-z,0);
  fill(255-z, z, 0);
  triangle(0,500, 150,0, 300,500);
}
