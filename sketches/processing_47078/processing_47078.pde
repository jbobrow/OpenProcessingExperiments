
class Particle
{
  PVector loc;
  PVector locOld;
  PVector vel;
  PVector acc;
  float mass;
  float maxVel;
  float n;
  boolean isDead;
  color c;
  
  Particle()
  {
    loc = new PVector(random(width*2), random(-height, height));
    locOld = new PVector();
    vel = new PVector();
    acc = new PVector();
    mass = 10;
    maxVel = 8.0;
    c = color(noise(loc.x)*255, 64, noise(loc.y)*128, 255);
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
    float noiseVal = noise(loc.x/80, loc.y/80, n);
    acc.x = cos(noiseVal*-4)*64;
    acc.y = sin(noiseVal*2)*64;
     
    vel.add(acc);
    vel.limit(maxVel);
    loc.add(vel);
    
    if (loc.x>width || loc.y>height) 
    {
      isDead = true;
    }
    
    n+=0.001;
  }
  
  void render()
  {
    stroke(c, 64);
    strokeWeight(4);
    line(loc.x, loc.y, locOld.x, locOld.y);
  }
}

