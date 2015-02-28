
void setup() {
  size (400, 400);
  background(255);

  float space = (width-40)/10;

  for (float x = space; x <= width-space; x += space)
  {
    for (float y = space; y <= height-space; y += space)
    {
      stroke(0);
      strokeWeight(random(80));
      point(x + random(-10, 10), y + random(-10, 10));
    }
  }
}


