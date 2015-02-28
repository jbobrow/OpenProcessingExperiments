
void setup()
{
 frameRate(60);
}
void calculateTimePass()
{
  if (frameCount`==0)
  println("Time in seconds = "+frameCount/60);
}
void draw()
{
  calculateTimePass();
}
