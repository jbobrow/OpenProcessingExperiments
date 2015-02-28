
// Midpoint-Displacement Mountain 2d
// (implemented by Jakob Thomsen)

float altitude[] = new float[512 + 1];

void mountain(int start, int end)
{
  if(end > start + 1)
  {
    int center = (start + end) >> 1;
    int dist = end - start;

    float scale = float(dist) / float(altitude.length - 1);
    // scale = pow(scale, 1.5);

    float h = (altitude[start] + altitude[end]) / 2.0;

    float diff = random(-scale,+scale);
    altitude[center] = h + diff;
    mountain(start, center);
    mountain(center, end);
  }
}

void display()
{
  for(int i = 0; i < altitude.length; i++)
  {
    float x = float(i) / float(altitude.length - 1) * float(width);
    float y = (altitude[i] + 1.0) * float(height) / 2.0;

    // stroke(0.0,0.0,1.0);
    stroke(1);
    line(x, 0, x, y);
    // stroke(1.0, 1.0, 1.0);
    stroke(0);
    line(x, height, x, y);
  }
}

void setup()
{
  size(512, 512);
  colorMode(RGB, 1);
}

void draw()
{
  mountain(0, altitude.length - 1);
  display();
  noLoop();
}
