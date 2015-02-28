
// "loopy" ramdom walk (written by Jakob Thomsen)

float x;
float y;
float phi;

void step(float phi_step, float distance)
{
  phi = phi + phi_step;
  x = x + cos(phi) * distance;
  y = y + sin(phi) * distance;
}

void setup()
{
  size(640, 480);
  background(255, 255, 255);
  x = width / 2;
  y = height / 2;
  phi = 0;
}

void draw()
{
  float time = millis() / 1000.0;
  float previous_x = x;
  float previous_y = y;
  // step(1.0 * PI / 180.0, 1.0); // Kreis
  // step(random(-0.1, 0.1) * 2.0 * PI, 1.0);
  // step(0.01 * noise(time) * 2.0 * PI, 1.0);
  // step((2.0 * noise(time) - 1.0) * 2.0 * PI, 1.0);
  step(noise(time, 1) * 0.125 * (2.0 * noise(time) - 1.0) * 2.0 * PI, 1.0);
  strokeWeight(noise(time) * 10.0);
  line(previous_x, previous_y, x, y);
}
