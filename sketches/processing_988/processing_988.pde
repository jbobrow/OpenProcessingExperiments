
class particle
{
  boolean hasTarget, hasActualTarget;
  PVector position;
  PVector velocity;
  //int hopsFromTarget;
  float mass;
  int target;

  particle(float x, float y, float z, float vx, float vy, float vz)
  {
    hasTarget = false;
    hasActualTarget = false;
    //hopsFromTarget=0;
    target = -2;
    position = new PVector();
    velocity = new PVector(); 
    position.x = x;
    position.y = y;
    position.z = z;
    velocity.x = vx;
    velocity.y = vy;
    velocity.z = vz;
    mass = random(1,2);
  }

  void followGravity(PVector location, float mass1, float mass2)
  {
    PVector unitVector = new PVector();
    unitVector = location.get();
    unitVector.sub(position);
    float dist = location.dist(position);
    unitVector.normalize();
    PVector force = new PVector();
    double g = -0.06673;
    g *= ((mass1*mass2)/(dist));
    force.x = (float)(g*(double)unitVector.x);
    force.y = (float)(g*(double)unitVector.y);
    float magnitude = force.mag();
    velocity.sub(force);
  }

  void update()
  {
     velocity.mult(0.75);
     position.add(velocity);
  }

  void render()
  {
    pushMatrix();
    //translate(position.x,position.y,position.z);
    
    if(hasActualTarget)
    {
      translate(position.x,position.y,position.z);
      fill(255,0,0);
      box(1);
    }
    else if(hasTarget)
    {
      stroke(0,255,0,255);
      fill(0,255,0,255);
      line(position.x,position.y,position.z,ParticleSystem.Particles[target].position.x,ParticleSystem.Particles[target].position.y,ParticleSystem.Particles[target].position.z);
      noStroke();
      box(1);
    }
    else
    {
      translate(position.x,position.y,position.z);
      fill(255,255,255);
      box(1);
    }
    //box(1);
    popMatrix();
  }
}


