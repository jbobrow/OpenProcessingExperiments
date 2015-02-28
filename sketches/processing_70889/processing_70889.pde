
void setup()
{
  size(500, 500);
  background(0);
  ellipseMode(CENTER);
  rectMode(CORNER);
  frameRate(25);
  smooth();
}

int rot = 0;

void draw()
{
  rot += 5;   
  fill(0);
  rect(0, 0, 500, 500);
  for (int i = 30; i <= 500; i += 30)
  {
    for (int j = 30; j <= 500; j += 30)
    {
      fill(255);
      float offset = radians(i/3 + j/3);
      arc(i, j, 20, 20, radians(rot) + offset, radians(rot+180) + offset);
    }
  }
}
