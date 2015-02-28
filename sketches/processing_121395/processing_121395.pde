
int RADI = 200;

void setup()
{
  size(400, 400);
  ellipseMode(RADIUS);
}

void draw()
{
  background(255);
  float rad = radians(frameCount % 360);
  float x = RADI * cos(rad) + width / 2;
  float y = RADI * sin(rad) + height / 2;
  stroke(0);
  line(width / 2, height / 2, x, y);
  line(width / 2, height / 2, y, x);
}
