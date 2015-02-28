
//Doubling Shapes
int y = 1;
void setup ()
{
  size(600, 600);
  frameRate(1);
}
void draw ()
{
  background(255, 120, 140);
  smooth();
  int p = 1;
  while (p <= y)
  {
    stroke(78, 127, 203);
    fill(207, 232, 201);
    ellipse(int(random(600)), int(random(600)), 5, 10);
    p++;
  }
  y = y*2;
}
