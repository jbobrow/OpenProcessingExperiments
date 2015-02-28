
void setup()
{
  size(500, 500);

}
void draw()
{ background(0, 0, 0);
  smooth();
  stroke(0, 255, 255);
  float xx;
  for (xx = 50; xx<=width; xx = xx+50)
  {
    line(xx, 0, width, xx);
  }
}
