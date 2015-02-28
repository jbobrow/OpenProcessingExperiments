

ParticleSystem ps;

void setup() 
{
  size(400,400);
  colorMode(RGB, 255, 255, 255, 100);
  ps = new ParticleSystem();
  smooth();
  
}

void draw() 
{
  background(0);
  ps.run();
}

void mousePressed()
{
  ps.particleAdd(mouseX, mouseY);
}

void mouseDragged()
{
  ps.particleAdd(mouseX, mouseY);
}

void keyPressed()
{
  if(key == ' ')
  {
    for(int i = ps.particles.size()-1; i >=0; i--)
    {
      ps.particles.remove(i);
    }
  }
}


class ParticleSystem
{
  ArrayList particles;
  
  ParticleSystem()
  {
    particles = new ArrayList();
  }
  
  void run()
  {
    for (int i=0; i < particles.size(); i++)
    {
      Particle p = (Particle) particles.get(i);
      p.run();
    }
  }
  
  void particleAdd(int xx, int yy)
  {
    particles.add(new Particle(xx,yy));
  }
  
}

class Particle
{
  int x,y;
  int timer;
  int r;
  int stopTimer, stopR, stopY;
  
  Particle(int xx, int yy)
  {
    x = xx;
    y = yy;
    timer = 100;
    r = 0;
    stopY = int(random(1,400));
    stopTimer = int(random(1,100));
    stopR = int(random(10, 100));
  }
  
  void run()
  {
    update();
    display();
  }
  
  void update()
  {
    if (y < stopY)
    {
      y++;
    }
    if (timer > stopTimer)
    {
      timer--;
    }
    if (r < stopR)
    {
      r++;
    }
  }
  
  void display()
  {
    fill(255,timer);
    ellipse(x,y,r,r);
  }
  
  
}


