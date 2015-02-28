
public class ParticleEngine {
  // alist to keep track of particles
  private ArrayList particles;
  private ArrayList springs;
  
  //the class constructor
  public ParticleEngine() {
    //create the list
    particles = new ArrayList();
    springs = new ArrayList();
  }
  
  public void addParticle(Particle particle) {
    //public function to add a particle
    particle.setEngine(this);
    particles.add(particle);
  }
  
  public void addSpring(Spring spring) {
    //public function to add a particle
    spring.setEngine(this);
    springs.add(spring);
  }
  
  //update function to update all springs and particles
  public void update() {
    //use a while loop to check all springs
    int i = 0;
    while (i<springs.size()) {
      //update it
      Spring s = (Spring) springs.get(i);
      s.update();
      if (!s.destroyed) {
        //if the particle is still alive, update it
        i++;
      } else {
        //if the particle is not remove it from the list
        springs.remove(i);
      }
    }
    
    i = 0;
    while (i<particles.size()) {
      //update it
      Particle p = (Particle) particles.get(i);
      p.update();
      if (!p.destroyed) {
        //if the particle is still alive, update it
        i++;
      } else {
        //if the particle is not remove it from the list
        particles.remove(i);
      }
    }

    interact();    
  }
  
  public void interact() {
    
    for (int i = 0; i < particles.size(); i++) {
      for (int j = 0; j < particles.size(); j++) {
        // bounce
  
        Particle a = (Particle)particles.get(i);
        Particle b = (Particle)particles.get(j);

      }
     
    }

  }

  
  //draw all particles
  public void draw() {
    for (int i=0; i<springs.size(); i++) {
      Spring s = (Spring) springs.get(i);
      s.draw();
    }
    for (int i=0; i<particles.size(); i++) {
      Particle p = (Particle) particles.get(i);
      p.draw();
    }
  }
  
  public Particle particleAt(float x, float y) {
    int i = particles.size();
    while(i>0) {
      i--;
      Particle p = (Particle) particles.get(i);
      float dx = p.x - x;
      float dy = p.y - y;
      if (dx * dx + dy * dy < p.radius * p.radius) {
        return p;
      }
    }
    return null;
  }
  
  public Particle findParticle(String label) {
    int i = particles.size();
    while(i>0) {
      i--;
      Particle p = (Particle) particles.get(i);
      if (p.label == label) {
        return p;
      }
    }
    return null;
  }
  
  public void connectParticles(String label1, String label2, float longness, float strength, boolean visible) {
    Particle particle1 = findParticle(label1);
    Particle particle2 = findParticle(label2);
    if (particle1 != null && particle2 != null) {
      addSpring(new Spring(particle1, particle2, longness, strength, visible));
    }
  }
  
}

