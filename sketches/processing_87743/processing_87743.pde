
void setup()
{
  size(500,500);
}
void draw()
{
  fill(0,0,0,10);
  stroke(0);
  rect(0,0,500,500);
  fill(0);
  stroke(0,255,0);
  rect(random(0,500),random(0,500),20,20);
}
