
void setup() {
  size (400, 400);
  background(255);

  float space = (width-40)/10;

  for (float x = space; x <= width-space; x += space)
  {
    for (float y = space; y <= height-space; y += space)
    {
      strokeWeight(random(40));
      if (random(40) < 20) {
        point(x + random(-10, 10), y + random(-10, 10));
      }
      else
        strokeWeight(5);
      line(x + random(-100,100), y, x, y + random(-100,100));
    }
  }
}


