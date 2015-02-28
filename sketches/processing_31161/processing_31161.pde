
// globals
float GRAVITY = 0.2;
float time = 0;

// particle
class Particle
{
  int x, y, x0, y0;
  color c;
  
  Particle(int x, int y, int x0, int y0)
  {
    this.x = x;
    this.y = y;
    this.x0 = x0;
    this.y0 = y0;
    this.c = color(100 + random(100), 220, 240, random(255));
  }
  
  void Reset()
  {
    this.x = 10 + (int)random(width);
    this.y = 10 + (int)random(height);
    if (mousePressed == true)
    {
      this.x0 = this.x + (int)random(-(mouseX / 20), (mouseY / 20));
    }
    else
    {
      this.x0 = this.x; // this.x + (int)random(-10, 10);
    }
    this.y0 = this.y - 1 - (int)random(10);
  }
  
  void Vertlet()
  {
    int oldX = this.x;
    int oldY = this.y;
    
    this.x += this.x - this.x0 + (0 * time * time);
    this.y += this.y - this.y0 + (GRAVITY * sin(time) * sin(time));    
    
    this.x0 = oldX;
    this.y0 = oldY;
  }
}

Particle[] p = new Particle[1000];

// setup
void setup()
{
  size(640, 480);
  smooth();
  frameRate(60);
  
  for (int i = 0; i < p.length; i++)
  {
    p[i] = new Particle(0,0,0,0);
    p[i].Reset();
  }
}

// draw
void draw()
{
  fill(200);
  noStroke();
    
  for (int i=0; i < p.length; i++)
  {
    fill(p[i].c);    
    ellipse(p[i].x, p[i].y, 20+random(10), 20+random(10));
    p[i].Vertlet();    

    if ((p[i].x < 0) || (p[i].y < 0) || (p[i].x > width) || (p[i].y > height))
    {
      p[i].Reset();
    }
  }

  translate(width/2, height/2);  
  rotate(time * (PI/24));  
  fill(100, 55);
  stroke(0, 55);  
  for (int i=0; i < 6; i++)
  {
    rect(-width, i*height/3.05, width*4, 10);
    rect(i*width/3.05, -height, 10, height*4);
  }

  time += 0.1;
}

