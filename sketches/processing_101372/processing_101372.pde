
// Animated visualization of Johan Gielis' superformula.
// Written by Jakob Thomsen.
// (see http://en.wikipedia.org/wiki/Superformula)

float speed;

float superformula(float a, float b, float m, float n1, float n2, float n3, float phi)
{
  return pow(pow(cos(m * phi / 4.0) / a, n2) + pow(sin(m * phi / 4.0) / b, n3), -1.0 / n1);
}

void display(float time, float val, boolean invert)
{
  int count = 500;
  int index = 0;
  
  for(index = 0; index < count; index++)
  {
    float t = float(index) / float(count);
    float phi = speed * time + t * 2.0 * PI;
    
    float a = 1.0;
    float b = 1.0;
    float m = 1.0 + noise(speed * time, 3) * 20.0; // 3;
    float n1 = 1.0 + int(noise(speed * time, 4) * 20.0); // 5.0;
    float n2 = 1.0 + int(noise(speed * time, 5) * 20.0); // 18.0;
    float n3 = 1.0 + int(noise(speed * time, 6) * 20.0); // 18.0;

    float radius = superformula(a, b, m, n1, n2, n3, phi);
    if(invert)
    {
      radius = 1.0 / radius;
    }

    float x = cos(phi);
    float y = sin(phi);

    float thickness = noise(t * 20.0, time) * 20; // * 20.0;

    noStroke();
    fill(val, val, val, 64);
    ellipse(100.0 * radius * x + width / 2, 100.0 * radius * y + height / 2, thickness, thickness);
  }
}

void setup()
{
  size(640, 480);
  speed = 0.1;
}

void draw()
{
  background(128, 128, 255);
  
  float time = millis() / 1000.0;
  display(time, 255, true);
  display(time, 0, true);
  display(time, 0, false);
  display(time, 255, false);
}

