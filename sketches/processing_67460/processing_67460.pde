
float G = 10.0;
float eps = 100.0;

class Particle
{
  PVector position;
  PVector velocity;
  float mass;
  
  Particle(PVector _pos, PVector _vel, float _mass)
  {
    position = _pos;
    velocity = _vel;
    mass = _mass;
  }
  
  Particle(Particle o)
  {
    position = new PVector(o.position.x, o.position.y);
    velocity = new PVector(o.velocity.x, o.velocity.y);
    mass = o.mass;
  }
  
  void gravitate(Particle o)
  {
    if (this == o)
      return;
    
    float Mm = mass * o.mass;
    float r2 = sq(position.x - o.position.x) + sq(position.y - o.position.y) + eps;
    
    float F = G * Mm / r2;
    float A = atan2(o.position.y - position.y, o.position.x - position.x);
    
    float acc = F / mass;
    velocity.add(new PVector(acc * cos(A), acc * sin(A)));
  } 
  
  void step()
  {
    position.add(velocity);
  }
}

