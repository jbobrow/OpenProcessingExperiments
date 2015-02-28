
public class ParticleEngine {
  // alist to keep track of particles
  private ArrayList particles;
  
  //the class constructor
  public ParticleEngine() {
    //create the list
    particles = new ArrayList();
  }
  
  public void addParticle(Particle particle) {
    //public function to add a particle
    particle.setEngine(this);
    particles.add(particle);
  }
  
  //update function to update all particles
  public void update() {
    //use a while loop to check all particles
    int i = 0;
    while (i<particles.size()) {
      //update it
      Particle p = (Particle) particles.get(i);
      p.update();
      if (p.isAlive()) {
        //if the particle is still alive, update it
        i++;
      } else {
        //if the particle is not remove it from the list
        particles.remove(i);
      }
    }
  }
  
  //draw all particles
  public void draw() {
    for (int i=0; i<particles.size(); i++) {
      Particle p = (Particle) particles.get(i);
      p.draw();
    }
  }
  
  //create a simple explosion
  public void createExplosion(float x, float y) {
    println("boom");
    for (int i=0; i<25; i++) {
      Particle p = new Particle();
      p.setPos(x, y, random(-5, 5), random(-5, 5));
      addParticle(p);
      
    }
  }
}

