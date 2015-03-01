
void setup()
{
  size(500,500);
}

void draw()
{
}

void keyPressed()
{
  int x = int(random(255));
  int y = int(random(255));
  int z = int(random(255));
  int a = x + y + z;
  int b = 255-x+255-y+255-z;
  if(a > b)
  {
    background(255-x, 255-y, 255-z);
  }
  else
  {
    background(x, y, z);
  }
  if(a < b)
  {
    fill(255-x, 255-y, 255-z);
  }
  else
  {
    fill(x, y, z);
  }
  rect(100,100,300,300);
  save("Test.png");
}
