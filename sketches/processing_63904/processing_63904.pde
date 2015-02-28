
void setup() {
  size (400, 400);
  background(255);
  strokeWeight(20);
  stroke(0);

  float space = (width-40)/10;

  for (float x = space; x <= width-space; x += space)
  {
    for (float y = space; y <= height-space; y += space)
    {
      if (random(-40, 40) > 0) {
        point(x + random(-10, 10), y + random(-10, 10));
      }
      else
      {
        point(x + random(10, 40), y + random (10, 40));
      }
    }
  }
}


