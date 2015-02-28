
int RADI = 190;

void setup()
{
  size(400, 400);
  noStroke();
}

void draw()
{
  background(255);
  float rad = radians(frameCount % 360);
  float x = RADI * cos(rad) + width / 2;
  float y = RADI * sin(rad) + height / 2;
  fill(0xff, 0x78, 0x89);
  ellipse(x,y, 10, 10);
}
