
public class ParticleEngine {
  // a list to keep track of particles
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
    //public function to add a spring
    spring.setEngine(this);
    springs.add(spring);
  }


  public void update() {
    for (int i=0; i<springs.size(); i++) {
      Spring s = (Spring) springs.get(i);
      s.update();
    }
    for (int i=0; i<particles.size(); i++) {
      Particle p = (Particle) particles.get(i);
      p.update();
    }
  }

  public void removeAll() {
    particles.clear();
    springs.clear();
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

  public Particle particlePos(float x, float y) {
    int i = particles.size();
    while(i>0) {
      i--;
      Particle p = (Particle) particles.get(i);
      float dx = p.x - x;
      float dy = p.y - y;
      if (sqrt(sq(dx) + sq(dy)) < p.size/2 ) {
        return p;
      }
    }
    return null;
  }

  public Particle findParticle(int id) {
    int i = particles.size();
    while(i>0) {
      i--;
      Particle p = (Particle) particles.get(i);
      if (p.id == id) {
        return p;
      }
    }
    return null;
  }

  public void connectParticles(int id1, int id2) {
    Particle particle1 = findParticle(id1);
    Particle particle2 = findParticle(id2);
    if (particle1 != null && particle2 != null) {
      addSpring(new Spring(particle1, particle2, 175, 0.025));
    }
  }
}


