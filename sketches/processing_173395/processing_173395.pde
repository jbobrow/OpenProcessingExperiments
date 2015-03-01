
void setup()
{
  size(600, 400);
  rectMode(CENTER);
}
void draw()
{

  background(128, 128, 0);

  fill(255, 50);
  stroke(128, 100);
  for (int x = 0; x <= width; x+=100)
  {
    for (int y = 0; y<=height; y+=100)
    {
      pushMatrix();
      translate(x, y);
      float f = random(155, 255);
      fill(f, 50);
      for (int i = 100; i >0; i-=10)
      {
        fill(i*2.55, 150);
        rotate(radians(frameCount*.25));
        rect(0, 0, i, i);
      }

      popMatrix();
    }
  }
}

