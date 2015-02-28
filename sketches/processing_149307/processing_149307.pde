
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

void setup()
{
  size(512, 512, P2D);
  colorMode(RGB, 1);
  loadPixels();
  for (int y = 0; y < height; y++)
  {
    for (int x = 0; x < width; x++)
    {
      float value = noise(float(x) / 80.0, float(y) / 80.0);

      if(value > 0.6) {
          pixels[linearize(x, y)] = color(value, value, value);
      }
      else if(value > 0.5) {
          pixels[linearize(x, y)] = color(0, value, 0);
      }
      else {
          pixels[linearize(x, y)] = color(0, 0, value);
      }
      
      //pixels[linearize(x, y)] = color(value);

    }
  }
  updatePixels();
}

void draw()
{
}
