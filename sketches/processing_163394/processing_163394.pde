
void setup()
{
  size(600,600);
  frameRate(10); 
}

void draw()
{
  background(#A5A5A5);
  for(float y = 0; y < height; y += 10)
    {
      float rainX = random(0,width);
      float rainY = random(5,10);
      stroke(255);
      line(rainX, y, rainX, y + 10);
    }
}
