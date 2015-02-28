
//Montana Cruz, CP1, 4/5
//
int x=1;
void setup()
{
  size(500, 500);
  background(random(255),random(255),random(255));
}
void draw()
{
  while (x<=100)
  {
    float b=random(width);
    float c=random(height);
    fill(255, 0, 0);
    ellipse (random(501), random(501), 25,25);
    fill(255);
    x++;
  }
}
void mousePressed()
{
  x=1;
  background(random(255),random(255),random(255));

}
