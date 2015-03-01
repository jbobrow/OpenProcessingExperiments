
Particle[] p = new Particle[100];
float spring = 0.0000001;

void setup()
{
  size(800, 400);
  
  for(int i = 0; i < p.length; i++)
  {
    p[i] = new Particle(random(width), random(height), 5);
    p[i].vx = random(-3, 3);
    p[i].vy = random(-3, 3);
  }
}

void draw()
{
  background(255);
  
  for(int i = 0; i < p.length; i++)
  {
    p[i].x += p[i].vx;
    p[i].y += p[i].vy;
    
    if(p[i].x < 0)
    {
      p[i].x = width;
    }
    else if(p[i].x > width)
    {
      p[i].x = 0;
    }
    
    if(p[i].y < 0)
    {
      p[i].y = height;
    }
    else if(p[i].y > height)
    {
      p[i].y = 0;
    }
    
    for(int j = i + 1; j < p.length; j++)
    {
       springTo(p[i], p[j]);     
    }
    p[i].display();
  }
  
  //filter(BLUR, 0);
  
}

void springTo(Particle p1, Particle p2)
{
  float dx = p2.x - p1.x;
  float dy = p2.y - p1.y;
  float dist = sqrt(dx * dx + dy * dy);
  
  if(dist < 100)
  {
    float ax = dx * spring;
    float ay = dy * spring;
    float alpha = 10 + (dist/100) * 200;   
    
    p1.vx += ax;
    p1.vy += ay;
    p2.vx -= ax;
    p2.vy -= ay;
    
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
    color c = color(0);
    
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
    
    void move()
    {
      x += vx;
      y += vy;
    }
}
