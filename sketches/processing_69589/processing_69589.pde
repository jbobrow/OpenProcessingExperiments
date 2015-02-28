
class ParticleSystem {
  ArrayList<Particle> particles;
  
  ParticleSystem(float x, float y) {
    particles = new ArrayList<Particle>();
  }

// Add particle
  void addParticle() {
      particles.add(new Particle(random(width), random(height)));
  }

    void run() {
      Iterator<Particle> it = particles.iterator();
      while (it.hasNext ()) {
        Particle p = it.next();
        p.run();
      }
    }
  }


