
void setup()
{
  size(500, 500,P2D);
  smooth();
  background(0);
  strokeWeight(2);
  frameRate(25);
}

float phaseIncInc = TWO_PI/10000;
float phaseInc = phaseIncInc;

float radiusInc = 2;

void draw()
{
  translate(width >> 1, height >> 1);
  background(0);

  float phase = 0;
  float radius = 0;

  float prevX = 0;
  float prevY = 0;
  float newX, newY;

  for (int i = 0; i < 200;i++)
  {
    newX = cos(phase) * radius;
    newY = sin(phase) * radius;

    stroke(cos(phase)*128+128,sin(phase)*128+128,sin(phase-HALF_PI)*128+128);

    line(prevX, prevY, newX, newY);
    prevX = newX;
    prevY = newY;

    phase += phaseInc;
    radius += radiusInc;
  }

  phaseInc += phaseIncInc;
  if (phaseInc > TWO_PI) phaseInc -= TWO_PI;
}




