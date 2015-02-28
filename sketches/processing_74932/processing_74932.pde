
//Brandan H. Computer Programming 1 Block 7
int x=1;
int y=1;

void setup()
{
  size(750, 750);
  frameRate(.75);
}
void draw()
{

  background(255);
  int x = 1;
  while (x<=y)
  {
    fill(random(255), random(255), random(255));
    ellipse(int(random(750)), int(random(750)), 20, 20);
    x++;
  }
  if (x>=y)
  {
    y=y*2;
  }
  if (x>16385)
  {
    x=1;
    y=1;
  }
  fill(0);
  textSize(100);
  text(y/2, 100, 100);
}
