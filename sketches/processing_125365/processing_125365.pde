

float hookesConst = 0.3;
float damping = 0.99;
float particleDiameter = 25.0;
float particleRadius = particleDiameter * 0.5;

class Particle
{
  Particle(float x, float y, PVector v)
  {
    position = new PVector(x,y);
    velocity = v.get();
  }
  
  void bounceFromScreenEdge()
  {
    if (position.x < particleRadius && velocity.x < 0.0)
      velocity.x *= -1.0;

    if (position.y < particleRadius && velocity.y < 0.0)
      velocity.y *= -1.0;

    if (position.x > width - particleRadius && velocity.x > 0.0)
      velocity.x *= -1.0;

    if (position.y > height - particleRadius && velocity.y > 0.0)
      velocity.y *= -1.0;
  }
  
  PVector position;
  PVector velocity;
};

class Link
{
  Link(int n1, int n2)
  {
    index1 = n1;
    index2 = n2;
    
    fLength = arrParticle[index1].position.dist(arrParticle[index2].position);
  }
  
  int index1;
  int index2;
  float fLength;
};

Particle arrParticle[];
Link arrLink[];

void setup()
{
  size(900, 600);
  frameRate(50);
  background(0);
  
  PVector v1 = new PVector(3.0,  0.0);
  PVector v2 = new PVector(0.0, -4.0);
  
  arrParticle = new Particle[10];

  // obj1
  arrParticle[0] = new Particle(100.0, 250.0, v1);
  arrParticle[1] = new Particle(100.0, 300.0, v1);
  arrParticle[2] = new Particle(150.0, 250.0, v1);
  arrParticle[3] = new Particle(150.0, 300.0, v1);
  arrParticle[4] = new Particle(200.0, 250.0, v1);
  arrParticle[5] = new Particle(200.0, 300.0, v1);

  // obj2
  arrParticle[6] = new Particle(400.0, 500.0, v2);
  arrParticle[7] = new Particle(400.0, 550.0, v2);
  arrParticle[8] = new Particle(450.0, 500.0, v2);
  arrParticle[9] = new Particle(450.0, 550.0, v2);
  
  arrLink = new Link[17];

  // obj1
  arrLink[0]  = new Link(0, 1);
  arrLink[1]  = new Link(0, 2);
  arrLink[2]  = new Link(0, 3);
  arrLink[3]  = new Link(1, 2);
  arrLink[4]  = new Link(1, 3);
  arrLink[5]  = new Link(2, 3);
  arrLink[6]  = new Link(2, 4);
  arrLink[7]  = new Link(2, 5);
  arrLink[8]  = new Link(3, 4);
  arrLink[9]  = new Link(3, 5);
  arrLink[10] = new Link(4, 5);
  
  // obj2
  arrLink[11] = new Link(6, 7);
  arrLink[12] = new Link(6, 8);
  arrLink[13] = new Link(6, 9);
  arrLink[14] = new Link(7, 8);
  arrLink[15] = new Link(7, 9);
  arrLink[16] = new Link(8, 9);
}

void draw()
{
  fill(0, 100);
  rect(0, 0, width, height);
  noFill();
  stroke(255);
  strokeWeight(3);
  
  // Draw particles
  for (int n = 0; n < arrParticle.length; ++n)
  {
    PVector pv = arrParticle[n].position;
    ellipse(pv.x, pv.y, particleDiameter, particleDiameter);
  }

  // Draw links  
  for (int n = 0; n < arrLink.length; ++n)
  {
    Link link = arrLink[n];
    PVector pv1 = arrParticle[link.index1].position;
    PVector pv2 = arrParticle[link.index2].position;
    line(pv1.x, pv1.y, pv2.x, pv2.y);
  }
  
  // Move particles
  for (int n = 0; n < arrParticle.length; ++n)
  {
    Particle p = arrParticle[n];
    p.position.add(p.velocity);
    p.bounceFromScreenEdge();
    p.velocity.mult(damping);
  }
  
  // Hookes law
  for (int n = 0; n < arrLink.length; ++n)
  {
    Link link = arrLink[n];
    PVector pos1 = arrParticle[link.index1].position;
    PVector pos2 = arrParticle[link.index2].position;
    PVector v1   = arrParticle[link.index1].velocity;
    PVector v2   = arrParticle[link.index2].velocity;
    
    PVector force = new PVector(pos2.x - pos1.x, pos2.y - pos1.y);
    force.normalize();
    float extension = pos1.dist(pos2) - link.fLength;
    force.mult(hookesConst * extension);
    
    v1.add(force);
    v2.sub(force);
  }
  
  // Particle collisions
  for (int n = 0; n < arrParticle.length; ++n)
  {
    Particle p1 = arrParticle[n];
    
    for (int m = n; m < arrParticle.length; ++m)
    {
      Particle p2 = arrParticle[m];
      float currentDist = p1.position.dist(p2.position);
      
      if (currentDist < particleDiameter)
      {
        // That's a collision, but are they still moving towards each other?
        PVector p1next = new PVector(p1.position.x + p1.velocity.x, p1.position.y + p1.velocity.y);
        PVector p2next = new PVector(p2.position.x + p2.velocity.x, p2.position.y + p2.velocity.y);
        
        float nextDist = p1next.dist(p2next);        

        if (nextDist < currentDist)
        {
          // Yes.  For a completely elastic collision between two objects of equal mass we can just exchange their velocities.
          float x = p1.velocity.x;
          float y = p1.velocity.y;
          p1.velocity.x = p2.velocity.x;
          p1.velocity.y = p2.velocity.y;
          p2.velocity.x = x;
          p2.velocity.y = y;
        }
      }
    }  
  }

  // Let's add some interaction
  if (mousePressed)
  {
    for (int n = 0; n < arrParticle.length; ++n)
    {
      PVector position = arrParticle[n].position;
      PVector velocity = arrParticle[n].velocity;
      
      if (dist(position.x, position.y, pmouseX, pmouseY) < particleRadius)
      {
        velocity.x = mouseX - pmouseX;
        velocity.y = mouseY - pmouseY;
      } 
    }
  }
}


