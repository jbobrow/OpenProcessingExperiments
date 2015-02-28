
void setup() {
  size (400, 400);
  background(255);

  float space = (width-40)/10;

  for (float x = space; x <= width-space; x += space)
  {
    for (float y = space; y <= height-space; y += space)
    {
      stroke(0);
      strokeWeight(10);
      point(x, y);
    }
  }
}


