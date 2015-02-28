
// Brandan H. Computer prog. 1 block 7
int x=1;
void setup()
{
  size (750,750);
  background(0,255,0);
}
void draw()
{
  while (x<=100)
  {
    float y=random(width);
    float z=random(height);
    fill(random(255),random(255),random(255));
    rect(y,z,50,50);
    x++;
  }
}
void mousePressed()
{
  x=1;
  background(0,255,0);
}
