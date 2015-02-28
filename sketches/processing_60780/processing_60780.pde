
class ball
{
  float x, y;
  float targetX, targetY;
  float easing = 0.05;
  float ball_size = 20;

  void display_ellipse()
  {
    targetX = mouseX;
    targetY = mouseY;
    float dx = targetX - x;
    float dy = targetY - y;
    if (abs(dx) > 1)
    {
      x += dx * easing;
    }
    if (abs(dy) > 1)
    {
      y += dy * easing;
    }
    fill(#FFFFFF, 127);
    ellipse(x, y, ball_size, ball_size);
  }
}

