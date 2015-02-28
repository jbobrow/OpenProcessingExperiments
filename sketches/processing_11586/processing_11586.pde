
float p4,p3,p2,p1;
float t;
float inverseDistance(float v1, float v2)
{
  return constrain(pow(dist(0, v1, 0, v2), -1), 0, 1);
}

color gradient(float y)
{
  color c1 = color(255, 255, 0, (int)(inverseDistance(y, p1) * 255));
  color c2 = color(255, 127, 0, (int)(inverseDistance(y, p2) * 255));
  color c3 = color(255, 0, 0, (int)(inverseDistance(y, p3) * 255));
  color c4 = color(0, 0, 0, (int)(inverseDistance(y, p4) * 255));

  return blendColor(c4, blendColor(c3, blendColor(c2, c1, BLEND), BLEND), BLEND);
}

void setup()
{
  size(1600, 300, P2D);

  p4 = height * .75;
  p3 = p4 * .75;
  p2 = p3 * .75;
  p1 = p2 * .75;
  
  t = 0;
}

void draw()
{
  loadPixels();

  for (int i = 0; i < width; i++)
  {
    for (int j = 0; j < height; j++)
    {
      pixels[i + j * width] = gradient(j + 50 * noise(i * .02, j * .02, t));
      t += 0.0002;
    }
  }

  updatePixels();
}

