
float counter = 0;

void setup()
{
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  float h = map(sin(counter), -1, 1, 0, 360);
  background(h, 100, 100);
  counter += 0.01;
}
