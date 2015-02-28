
/* A faster particle which doesn't last as long */
class FastParticle extends Particle { // May as well reuse what we wrote earlier

  FastParticle(PVector input) {
    super(input); // Run the normal one
    life /= 2;    // But with less life
    version = 2; // set version
  } 

  void update(PVector force, Boolean die) {
    super.update(force, die); 
    vel.mult(1.03);  //faster
  }

  // Override the draw so we can tell them apart better
  void draw() {
    ellipseMode(CENTER); // Just in case
    fill(0, 255, 255, 127);   // Different colour to the basic
    ellipse(loc.x, loc.y, 2*rad/3, 2*rad/3);// Draw, 2/3rds size
  }
}


