
ParticleSystem balloons = new ParticleSystem();
boolean mouseDown = false;

void setup()
{
  size(800,600,P2D);
  smooth();
  background(255);
  noStroke();
  ellipseMode(RADIUS);
}
 
void draw()
{
  background(255);
  if(mousePressed)
  {
    balloons.add(new Particle(mouseX, mouseY));
  }
  balloons.run();
}

void keyPressed()
{
  if(key != CODED)
  {
    switch(key)
    {
      case 'r' : balloons.removeAll(); break;
    }
  }
}


class Particle
{
  float x = width/2;
  float y = height/2;
  float xv = -1+random(6);
  float yv = -random(4);
  float maxYV = 20;
  float gravity = 0.1;
  float friction = 1;
  float radius = random(5,14);
  color c = color(random(255),random(255),random(255),20);
   
  Particle(){  }
 
  Particle(float xp,float yp)
  {
    x = xp;
    y = yp;
  }
 
  Particle(float xp,float yp,float xvel,float yvel)
  {
    this(xp, yp);
    xv = xvel;
    yv = yvel;
  }
 
  void run()
  {
    update();
    render();
  }
 
  public void update()
  {
    if((yv < maxYV))
    {
      yv -= gravity*.2;
    }
    yv *= friction;

    y += yv;
    x += xv;
  }
 
  void render()
  {
    noStroke();
    fill(c);
    ellipse(x,y,radius,radius*1.05);
  }
}

class ParticleSystem
{
  ArrayList particles = new ArrayList();
   
  ParticleSystem(){}
   
  void add(Particle p)
  {
    particles.add(p);
  }
   
  void removeAll()
  {
    particles.clear();
  }
   
  void run()
  {
    for(int i = 0; i < particles.size(); i++)
    {
      Particle p = (Particle)particles.get(i);
      p.run();
    }
  }
}
