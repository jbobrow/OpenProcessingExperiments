
// Ball class
class Ball
{
  float x, y;
  float vx, vy;
  float radius;
  color colour = color(0, 0, 255);
  
  float mass = 1.0;
  float gravity = 0.0;
  float bounce = -0.6; // default = -0.6
  
  Ball(float x, float y, float vx, float vy, float radius, color colour) 
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.radius = radius;
    this.mass = radius;
    this.colour = colour;
  }
  
  void move()
  {
//    vy = vy + gravity;
    y += vy;
    x += vx;
  }
  
  void display()
  {
    fill(colour);
    ellipse(x, y, radius * 2, radius * 2);
  } 
}


