
class Behaviour {

  /* This is the algorithm - checks each particle against
   a series of rules and updates vx and vy values - these	
   values determine the particle's new position */

  ArrayList p_list;
  Particle particle;

  // change these to change swarm behaviour	
  float  inertia = 0.9, // sort of 'laziness' (0-1)
  max_velocity = 12.0, // != speed
  separation = 35, // min distance between particles
  gravity_threshold = 500; // radius of particle attraction

  Behaviour() {
  }

  void process (ArrayList p_list_, Particle particle_) {
    p_list = p_list_;
    particle = particle_; 

    // call the algorithm methods
    for (int i = 0; i < p_list.size(); i++)
    {
      Particle neighbour = (Particle) p_list.get(i);

      if (neighbour != particle) { // don't compare particle to itself
        separation_rule(neighbour);
        gravity_rule(neighbour);
      }
    }

    inertia();
    constraint();
    velocity_clamp();

    // update particle position by adding new vectors
    particle.x += particle.vx;
    particle.y += particle.vy;
  }

  /* rules */

  // n.b. the *0.1 and *10 in separation_rule() and gravity_rule() are 
  // arbitrary values that produce the right kind of movement in Processing

  void separation_rule (Particle neighbour) {
    float distance = dist(particle.x, particle.y, neighbour.x, neighbour.y);
    float ratio = separation / distance;

    // if particle is too close to its neighbour, move away
    // tweak on original boids rule
    if (ratio > 1)
    {
      particle.vx -= (neighbour.x - particle.x) * 0.1;
      particle.vy -= (neighbour.y - particle.y) * 0.1;
    }
  }

  void gravity_rule (Particle neighbour) {
      float distance = dist(particle.x, particle.y, neighbour.x, neighbour.y);

      // if particle is too far from its neighbour, move closer
      if (distance < gravity_threshold)
      {
        particle.vx += ((neighbour.x - particle.x) / sq(distance)) * 10;
        particle.vy += ((neighbour.y - particle.y) / sq(distance)) * 10;
      }
  }

  void inertia () {
    // restrain movement
    particle.vx = inertia * particle.vx;
    particle.vy = inertia * particle.vy;
  }

  void constraint () {   
    // keep particles within 40 pixels of screen edge 
    // multiply by < 1 for less "bouncy" movement 
    if (particle.x < 40)
      particle.vx += 40 - particle.x;
    if (particle.x > width - 40)
      particle.vx -= particle.x - (width - 40);

    if (particle.y < 40)
      particle.vy += 40 - particle.y;
    if (particle.y > height - 40)
      particle.vy -= particle.y - (height - 40);
  }

  void velocity_clamp() {
    // limit velocity to keep stable movement
    particle.vel = sqrt(sq(particle.vx) + sq(particle.vy));
    if (particle.vel > max_velocity)
    {
      particle.vx = (max_velocity / particle.vel) * particle.vx;
      particle.vy = (max_velocity / particle.vel) * particle.vy;
    }
  }
}


