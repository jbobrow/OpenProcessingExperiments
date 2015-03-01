
void setup()
{
  size(300,500);
}

void draw()
{
}

void keyPressed()
{
  background(255);
  for(int z = 0; z < 6; z++)
  {
    fill(random(255), random(255), random(255));
    triangle(random(300), random(500), random(300), random(500), random(300), random(500));
  }
}
