
// Animated "loopy" random walk
// written by Jakob Thomsen

float time;
float time_step;
float time_scale;
float way_scale;

class Pen
{
  float x;
  float y;
  float phi;
  
  Pen(float _x, float _y, float _phi)
  {
    x = _x;
    y = _y;
    phi = _phi;
  }

  void step(float phi_step, float distance)
  {
    phi = phi + phi_step;
    x = x + cos(phi) * distance;
    y = y + sin(phi) * distance;
  }
  
  void display(float size)
  {
    strokeWeight(size);
    point(x, y);
  }
}

Pen [] Pens = new Pen[1];

void setup()
{
  size(640, 480);
  background(255, 255, 255);
  time = 0;
  time_step = 1.0 / 25.0;
  time_scale = 0.1;
  way_scale = 10.0;
}

void draw()
{
  background(255);
  if(time_step == 0)
  {
    time = millis() / 1000.0;
  }
  else
  {
    time += time_step;
  }

  for(int i = 0; i < Pens.length; i++)
  {
    Pens[i] = new Pen(width / 2, height / 2, 0);
  }
  
  int n = 1000;
  for(int j = 0; j < n; j++)
  {
    float t = float(j) / float(n);

    for(int i = 0; i < Pens.length; i++)
    {
      float s = float(i) / float(Pens.length);
      // P.step(1.0 * PI / 180.0, 1.0); // Kreis
      // P.step(random(-0.1, 0.1) * 2.0 * PI, 1.0);
      // P.step(0.01 * noise(time) * 2.0 * PI, 1.0);
      // P.step((2.0 * noise(time) - 1.0) * 2.0 * PI, 1.0);
      // Pens[i].step(noise(way_scale * t, s, time * time_scale) * 0.125 * (2.0 * noise(way_scale * t, s, time * time_scale) - 1.0) * 2.0 * PI, 1.0);
      Pens[i].step(exp(t * 0.1) * noise(way_scale * t, s, time * time_scale) * 0.125 * (2.0 * noise(way_scale * t, s, time * time_scale) - 1.0) * 2.0 * PI, 1.0);
      Pens[i].display(10.0 * noise(way_scale * t, s, time * time_scale * 0));
      // Pens[i].display(10.0 * noise(way_scale * t, s));
    }
  }
}
