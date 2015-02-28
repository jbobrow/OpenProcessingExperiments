
void setup()
{
  size(100,100);
  frameRate(60);
}
void draw()
{
  calculateTimePass();
}

void calculateTimePass()
{
  if(frameCount== frameRate/60)
  println(frameCount);
}
