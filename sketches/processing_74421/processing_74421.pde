
void setup()
{
  size(500,500);
  frameRate(10);
}
void draw()
{
  background(0);
  int x=1;
  fill(255);
  noStroke();
  while(x<=100)
  {
rect(random(0,500),random(0,500),random(0,100),random(0,100));
  x++;
  }
}
