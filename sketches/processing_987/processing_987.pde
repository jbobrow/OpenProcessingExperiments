
class particle
{
  boolean hasTarget, hasActualTarget;
  PVector position;
  PVector velocity;
  int target;

  particle(float x, float y, float vx, float vy)
  {
    // spawn in a random location
    hasTarget = false;
    hasActualTarget = false;
    target = -2; // -2 means no target, -1 means THE target (omg!), 0+ means the number of the particle in the array
    position = new PVector();
    velocity = new PVector(); 
    position.x = x;
    position.y = y;
    velocity.x = vx;
    velocity.y = vy;
  }

  void update()
  {
    // slow down particles all the time to makes them converge nicely
     velocity.mult(PARTICLE_SLOWDOWN_MULTIPLIER);
     position.add(velocity);
  }

  void render()
  {
    pushMatrix();
    translate(position.x,position.y,0);
    
    // colour particles based on their state
    // probably way cooler things can be done.
    if(hasActualTarget)
    {
      fill(255,0,0);
    }
    else if(hasTarget)
    {
      fill(0,255,0);
    }
    else
    {
      fill(255,255,255);
    }
    rect(0,0,2,2);
    popMatrix();
  }
}


