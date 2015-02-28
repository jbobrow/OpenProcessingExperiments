
float bounce = 1;
class Ball
{
  PVector loc, vel;
  float rad;
  Ball(float x, float y, float a, float s, float r)
  {
    loc = new PVector(x, y);
    vel = new PVector(s * cos(a), s * sin(a));
    rad = r;
  }
  boolean beingTouched()
  {
    return dist(loc.x, loc.y, mouseX, mouseY) <= rad;
  }
  void run()
  {
    loc.add(vel);
    doCollisions();
    show();
  }
  void show()
  {
    if (beingTouched())
      fill(255, 0, 0, 200);
    else
    {
      fill(50);
      float addition = (700 - dist(mouseX, mouseY, loc.x, loc.y)) / 2000;
      if (addition < 0)
        addition = 0;
      score += addition;
    }
    noStroke();
    ellipse(loc.x, loc.y, rad * 2, rad * 2);
  }
  void doCollisions()
  {
    if (loc.x - rad <= 0)
    {
      loc.x = rad;
      vel.x *= -bounce;
    }
    if (loc.x + rad >= width)
    {
      loc.x = width - rad;
      vel.x *= -bounce;
    }
    if (loc.y - rad <= 0)
    {
      loc.y = rad;
      vel.y *= -bounce;
    }
    if (loc.y + rad >= height)
    {
      loc.y = height - rad;
      vel.y *= -bounce;
    }
  }
}

