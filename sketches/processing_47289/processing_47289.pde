
class Particle
{
  PVector loc;
  PVector origin;
  PVector locOld;
  PVector vel;
  PVector acc;
  float mass;
  float maxVel;
  float n;
  boolean isDead;
  color c;
  float a;
  float r = 200;
  
  Particle()
  {
    loc = new PVector();
    origin = new PVector();
    origin.x = loc.x;
    origin.y = loc.y;
    locOld = new PVector();
    vel = new PVector();
    acc = new PVector();
    mass = 10;
    maxVel = 8.0;
    c = color(0);
    a = -0.1;
    n = 0;
    float noiseVal = noise(cos(a), sin(a), n)*TWO_PI;
    loc.x = origin.x + cos(a)*(r+noiseVal*24);
  }
  
  void run()
  {
    update();
    render();
  }
  
  void update()
  {
    locOld.x = loc.x;
    locOld.y = loc.y;
    float noiseVal = noise(cos(a), sin(a), n)*TWO_PI;
    loc.x = origin.x + cos(a)*(r+noiseVal*32-n);
    loc.y = origin.y + sin(a)*(r+noiseVal*32-n);
     
    vel.add(acc);
    vel.limit(maxVel);
    //loc.add(vel);
    
    if (loc.x>width || loc.y>height) 
    {
      isDead = true;
    }
    
    n+=0.02;
    a = (a+0.8)%TWO_PI;
  }
  
  void render()
  {
    c = color(n%192, n*2%192, n*6%192);
    stroke(c, 32);
    strokeWeight(1);
    line(loc.x, loc.y, locOld.x, locOld.y);
  }
}

