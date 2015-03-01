
void setup ()
{
  size (600, 200);
  smooth();
  frameRate(12);
  background (#57385c);
}

void draw ()
{

  float x = random(0, width);
  float y = random(0, height);
  float d = random (10, 20);
  color fillColor = randomColor();

  strokeWeight(3);
  fill(fillColor);
  stroke(randomColor());
  ellipse(x, y, d, d);
}

color randomColor() {
  float r = random (0, 255);
  float g = random (0, 255);
  float b = random (0, 255);

  color c = color (r, g, b);

  return c;
}

void mousePressed () {
  background (#57385c);
}

