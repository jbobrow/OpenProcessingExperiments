
long count = 0;
void setup()
{
  size(400, 400);
  frameRate(30);
  ellipseMode(RADIUS);
}

void draw()
{
  background(250);
  float radiusSin = sin(count / 15.0) * 100;
  float radiusCos = cos(count / 15.0) * 100;
  fill(255, 255, 255, 0);
  for (int i = width / 10; i < width; i+= width / 10) {
    for (int j = height / 10; j < height; j += height / 10) {
      ellipse(i, j, radiusSin, radiusSin);
      ellipse(i, j, radiusCos, radiusCos);
    }
  }
  if (++count > 10000000) {
    count = 0;
  }
}
