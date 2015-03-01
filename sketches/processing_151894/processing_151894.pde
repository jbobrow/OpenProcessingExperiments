
void setup()
{
  size(500, 500);
  background(0);
  strokeWeight(4);
}

void draw()
{
  stroke(random(256), 0, 0);
  line(250, 250, random(500), 400);
}


