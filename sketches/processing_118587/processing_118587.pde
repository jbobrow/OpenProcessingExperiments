
Ball ball1;
Ball ball2;
Ball ball3;

void setup()
{
  size(900, 400);
  smooth();
  ball1 = new Ball(random(width), random(height), 0, color(random(255), random(255), random(255)));
  ball2 = new Ball(random(width), random(height), 0, color(random(255), random(255), random(255)));
  ball3 = new Ball(random(width), random(height), 0, color(random(255), random(255), random(255)));
}


void draw()
{
  background(255);
  ball1.display();
  ball2.display();
  ball3.display();
  ball1.grow();
  ball2.grow();
  ball3.grow();
}
class Ball
{
  float x;
  float y;
  float r = 0;
  color c;
  
  // constructor
  Ball(float ballx, float bally, float radius, color ballcolor)
  {
    x = ballx;
    y = bally;
    r = radius;
    c = ballcolor;
  }
  
  void reset()
  {
    r = 0;
    x = random(width);
    y = random(height);
    ball1.c += color(random(255));
    ball2.c += color(random(255));
    ball3.c += color(random(255));
  }
  
  boolean intersect(Ball b)
  {
    // distance
    float distance = dist(x, y, b.x, b.y);
    
    if (distance < r + b.r) // compare distance to the sum of the radii
    {
      return true;
    }
    else 
    {
      return false;
    }
  }
  
  void grow()
  {
    r++; // increments the size of the radius
    
    if (ball1.intersect(ball2)) 
    {
      ball1.reset();
      ball2.reset();
    }
    if (ball2.intersect(ball3))
    {
      ball2.reset();
      ball3.reset();
    }
    if (ball1.intersect(ball3))
    {
      ball1.reset();
      ball3.reset();
    }
  }
  
  void display()
  {
    fill(c);
    noStroke();
    ellipse(x, y, r * 2, r * 2);
  }
}


