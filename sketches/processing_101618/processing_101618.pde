
// A perlin-noise "firefly" (written by Jakob Thomsen)

void setup()
{
  size(512, 512, P2D);
  colorMode(HSB, 1);
  background(0);
}

void draw()
{
  fill(0,0,0,0.04);
  rect(0,0,width, height);

  float time = float(millis()) / 1000.0;
  float x = noise(time, 0) * width;
  float y = noise(time, 1) * height;
  float h = noise(time, 3);
  float s = 1.0;
  float b = 1.0;
  noStroke();
  fill(h, s, b);
  ellipse(x, y, 30, 30);
}
