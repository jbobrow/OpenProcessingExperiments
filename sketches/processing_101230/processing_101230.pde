
void setup()
{
  size(400, 400);
  strokeWeight(4);
  background(255);
}
void draw()
{
  stroke(0, random(256), 0);
  line(399, 399, random(400), random(400));
}


