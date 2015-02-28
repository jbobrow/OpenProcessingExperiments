
class Mover
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topspeed = 8;
  int   minRadius = 4;
  int   maxRadius = 20;
  int   radius;
  
  float mass;
  
  int     age = 0;
  boolean isAlive = true;
  int     maxAge = 400;
  
  Mover(PVector initialPos)
  {
    location = new PVector(initialPos.x, initialPos.y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001, 0.001);
    
    topspeed = 8;
    radius = (int)random(minRadius, maxRadius);
    
    mass = radius;
  }
  
  void update()
  {
    acceleration = new PVector(random(-1, 1), random(-1, 1));
    acceleration.normalize();
    acceleration.mult(random(-.2, .2));
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    if (age == maxAge)  isAlive = false;
    age ++;
  }
  void display()
  {
    noStroke();
    fill(255);
    int r = (int)map(age, 0, maxAge, radius, .1); 
    ellipse(location.x, location.y, r, r);
  }
  
  void checkEdges()
  {
    if (location.x > width || location.x < 0)  velocity.x *= -1;
    if (location.y > height || location.y < 0) velocity.y *= -1;
  }
  
  void applyForce(PVector force)
  {
    //acceleration.add(PVector.div(force, mass));
  }
}


