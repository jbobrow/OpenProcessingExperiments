
Dot[] dots = new Dot[200];
float friction = 0.95;

void setup()
{
  size(400, 400);
  background(255);
  
  for(int i = 0; i < dots.length; i++)
  {
    float r = sqrt(random(0, 1)) * 100 ;
    float angle = random(PI*2);
    float x = width/ 2 + cos(angle) * r;
    float y = height/2 + sin(angle) * r;
    dots[i] = new Dot(x, y, 1);
  }
}

void draw()
{
  fill(255, 2);
  rect(0, 0, width, height);
  
  for(int i = 0; i < dots.length; i++)
  {
    dots[i].vx = random(-1, 1);
    dots[i].vy = random(-1, 1);
    dots[i].vx *= friction;
    dots[i].vy *= friction;
    
    dots[i].move();
    dots[i].display();
  }
   
}

class Dot
{
  float x, y;
  float vx, vy;
  float radius;
  color c = color(0);
  
  Dot(float _x, float _y, float _radius)
  {
    radius = _radius;
    x = _x;
    y = _y;
  }
  
  void display()
  {
    fill(c);
    noStroke();
    rect(x, y, radius, radius);
  }
  
  void move()
  {
    x += vx;
    y += vy;
  }
}
