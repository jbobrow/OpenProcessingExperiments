
// Lucky Lui computer programming 1 (100 random shapes)
void setup()
{
  frameRate(1);
  size(600, 600, P3D);
}
void draw()
{
  background (int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  int z=1;
  while (z<=100)
  {
    z=z+1;
    stroke(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    fill (int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    int size = int(random(3, 50));
    int offsetX = int(random(0, 600));
    int offsetY = int(random(0, 600));
    translate(offsetX, offsetY, 0);
    sphere(size);
    translate(-offsetX, -offsetY, 0);
  }
}
