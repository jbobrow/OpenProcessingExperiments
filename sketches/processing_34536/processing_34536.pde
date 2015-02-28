
// Trying to give a more fluid sensation than with a noise based movement
// It is a physics based simulation of particles, with a random force added to them (which changes often),
//  and a spring wich limit the distance they can get from the initial position.
class Particle
{
  final float friction = 0.25;  // Limit the velocity
  PVector pos, // The position we want to change
  pos0,        // Initial position
  posS,        // Spring attach position
  vel,         // Velocity
  acc,         // Acceleration
  force;       // Force
  float radius;  // Approximately the maximum distance from the initial position
  Particle(PVector p, float r) {
    radius = r;
    pos = p; pos0 = p.get(); posS = new PVector();
    vel = new PVector(random(-radius, radius), random(-radius, radius));  // Give a non zero initial velocity
    acc = new PVector(); force = new PVector();
    changeDirection();
  }
  
  void reset() {  // Used when user move the point with the mouse
    pos0.set(pos); posS.set(pos);
    //vel.set(0, 0, 0); acc.set(0, 0, 0); force.set(0, 0, 0);
  }

  void changeDirection() {  // Change random force
    force.set(random(-radius, radius), random(-radius, radius), 0);
    posS.set(pos0.x + random(-radius/2, radius/2), pos0.y + random(-radius/2, radius/2), 0);
  }

  void update(float dt) {  // Time integration
    float dt2 = dt*dt;
    float sx = posS.x - pos.x, sy = posS.y - pos.y; // We simulate a spring to the initial position
    pos.x += vel.x*dt + 0.5*acc.x*dt2; pos.y += vel.y*dt + 0.5*acc.y*dt2;
    acc.x = force.x - vel.x * friction + sx; acc.y = force.y - vel.y * friction + sy;
    vel.x += 0.5*acc.x*dt; vel.y += 0.5*acc.y*dt;
  }
}

// Gestion of all the particles
class PointsMovement
{
  float time = 0;  // Time since sketch start
  float tempo;     // How many times per second will a new random force be computed ?
  int lastTime;    // Last frame timestep
  Vector<Particle> particles;
  
  PointsMovement(float t) {
    tempo = t;
    lastTime = millis();
    particles = new Vector<Particle>();
  }
  
  void clear() { particles.clear(); }
  
  void add(PVector p, float r) { particles.add(new Particle(p, r)); }
  
  void reset(PVector p) { // To be called when the particle is moved by the user
    for(Particle pe : particles) {
      if(pe.pos == p) {
        pe.reset();
        return;
      }
    }
  }
  
  void update() {
    int newTime = millis();
    float dt = (newTime - lastTime) / 1000.0;
    lastTime = newTime;
    if(pause) return;
    
    // Is it time to choose new random forces ?
    if(floor(time * tempo) != floor( (time + dt) * tempo))
      for(Particle pe : particles)
        pe.changeDirection();
    
    for(Particle pe : particles)
      pe.update(dt);
    time += dt;
  }
}

