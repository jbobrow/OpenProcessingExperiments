
Particle[] p = new Particle[100];
float spring = 0.0000001;
float xt = 0, yt = 100;
float inc = 0.01;

void setup()
{
  size(800, 400);

  for (int i = 0; i < p.length; i++)
  {
    p[i] = new Particle(random(width), random(height), 5);
    p[i].vx = random(-50, width - 100);
    p[i].vy = random(-50, height - 100);
    p[i].xt = random(1, 200);
    p[i].yt = random(1, 200);
  }
}

void draw()
{
  background(0);

  for (int i = 0; i < p.length; i++)
  {
    p[i].x = p[i].vx + noise(p[i].xt) * 150;
    p[i].y = p[i].vy + noise(p[i].yt) * 150;

    p[i].xt += inc;
    p[i].yt += inc;
    
    for(int j = i + 1; j < p.length; j++)
    {
      springTo(p[i], p[j]);
    }
    p[i].display();
  }
}

void springTo(Particle p1, Particle p2)
{
  float dx = p2.x - p1.x;
  float dy = p2.y - p1.y;
  float dist = sqrt(dx * dx + dy * dy);

  if (dist < 100)
  {
    float ax = dx * spring;
    float ay = dy * spring;
    float alpha = 10 + (dist/100) * 200;  

    stroke(alpha);
    line(p1.x, p1.y, p2.x, p2.y);
  }
}

class Particle
{
  float x;
  float y;
  float vx;
  float vy;
  float r;
  color c = color(200);
  float xt, yt;
  Particle(float _x, float _y, float _r)
  {
    x = _x;
    y = _y;
    r = _r;
  }

  void display()
  {
    fill(c);
    noStroke();
    ellipse(x, y, r, r);
  }
}

