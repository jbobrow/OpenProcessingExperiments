
void setup()
{
  size (500, 500);
  background(255);
  smooth();

}

void draw()
{
 background(255);
  noStroke();
  fill(0);
  for (int x = 20; x < width-40; x+= width/8+5)
  {
  for (int y = 40; y < height-40; y++)
  {
    rect (x, y, width/8, random(1, 10));
    y += random (1,20);
  }
  noLoop();
}
}









