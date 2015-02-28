
int count=1;
void setup()
{
  size(600, 600);
  background(0);
}
void draw()
{
  while (count<101)
  {
    fill(random(255), random(255), random(255));
    triangle(random(585), random(585), random(585), random(585), random(585), random(585));
    count++;
  }
  if (mousePressed==true)
  {
    background(0);
    count=1;
  }
}
