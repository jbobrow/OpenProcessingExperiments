
// Visualization of animated two-dimensional perlin noise
// written by Jakob Thomsen

// (see http://en.wikipedia.org/wiki/Perlin_noise)
// another good link: http://paulbourke.net/texture_colour/perlin/

int linearize(int x, int y)
{
  x = constrain(x, 0, width - 1);
  y = constrain(y, 0, height - 1);

  return x + y * width;
}

float g_time;

void setup()
{
  size(512, 512, P2D);
  colorMode(RGB, 1);
  g_time = 0.0;
}

void draw()
{
  // g_time = float(millis()) / 1000.0;
  g_time += 0.1;

  loadPixels();
  for (int y = 0; y < height; y++)
  {
    for (int x = 0; x < width; x++)
    {
      pixels[linearize(x, y)] = color(noise(g_time / 1.0, float(x) / 100.0, float(y) / 100.0));
    }
  }
  updatePixels();
}
