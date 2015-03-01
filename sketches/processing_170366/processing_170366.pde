
Ball[] balls = new Ball[3];

void setup()
{
  size(500, 500);
  background(255);
  for (int i = 0; i < balls.length; i++)
  {
    balls[i] = new Ball();
  }
}

void draw()
{
  background(255);
  for (int i = 0; i < balls.length; i++)
  {
    balls[i].display();
  }

  for (int k = 0; k < balls.length; k ++)
  {
    for (int a = 0; a < balls.length; a ++)
    {
      if (k != a)
      {
        if (balls[k].collide(balls[a]))
        {
          balls[k].changeColor(balls[a]);
          balls[k].reset();
          balls[a].reset();
        }
      }
    }
  }
  
  for (int j = 0; j < balls.length; j++)
  {
    balls[j].grow();
  }
}

class Ball
{
  color c = color(random(0, 255), random(0, 255), random(0, 255));
  float xpos = random(0, width);
  float ypos = random(0, height);
  float r = 0;
  float grow = 1;

  Ball()
  {
  }

  void display()
  {
    noStroke();
    fill(c);
    ellipse(xpos, ypos, r*2, r*2);
  }

  void grow()

  {
    r = r + grow;
  }

  boolean collide(Ball b)
  {
    float distance = 0;
    distance = dist(xpos, ypos, b.xpos, b.ypos);
    if (distance < r + b.r)
    {
      return true;
    } else
    {

      return false;
    }
  }

  void changeColor(Ball a)
  {
    c = color(random(0, 255), random(0, 255), random(0, 255));
    a.c = c;
  }

  void reset()
  {

    xpos = random(0, width);
    ypos = random(0, height);
    r = 0;
  }
}



