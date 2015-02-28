
// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles

class ParticleSystem {
  ArrayList particles;
  int strokeDist = 85;
  
  void __construct() {
    particles = new ArrayList();
  }

  ParticleSystem(int num, PVector spawnLoc) {
    __construct();
    addParticles(num, spawnLoc);
  }
  ParticleSystem(int num) { 
    __construct();
    for (int i = 0; i < num; i++) {
      this.addParticle(random(0,width),random(0,height));   // Add "num" amount of particles to the arraylist
    }
  }
  ParticleSystem() {
    __construct();
  }

  void run() {
    int i;
    for (i = particles.size()-1; i >= 0; i--) {
      Dims p = (Dims) particles.get(i);
      p.run();
      if (p.dead()) {
        particles.remove(i);
      }
    }
    
    render();
  }
  
  void render() {
    stroke(255,0.15);
    int c = particles.size();
    int j;
    int i;
    for (i = 0; i < c-1; i++) {
      Dims p1 = (Dims) particles.get(i);
      for (j = i+1; j < c; j++) {
        Dims p2 = (Dims) particles.get(j);
        if (p1.loc.dist(p2.loc) < strokeDist) {
          line(p1.loc.x, p1.loc.y, p2.loc.x, p2.loc.y);  
        }
      } 
    }  
  }

  void addParticles(int num, PVector spawnLoc) {
    Dims p;
    for (int i = 0; i < num; i++) {
      float v = 0.2;
      p = new Dims(spawnLoc, new PVector(random(-v,v),random(-v,v)));
      this.addParticle(p);   // Add "num" amount of particles to the arraylist
    }
  }

  void addParticle(PVector l) {
    // add particle med en vektor
    // proxy for addParticle(Particle p)
    Dims p = new Dims(l, new PVector());
    addParticle(p);
  }

  void addParticle(PVector l, PVector v) {
    // add particle med en vektor
    // proxy for addParticle(Particle p)
    Dims p = new Dims(l, v);
    addParticle(p);
  }

  void addParticle(float x, float y) {
    // add particle med x og y
    // proxy for addParticle(Particle p)
    float v = 8;
    Dims p = new Dims(new PVector(x,y), new PVector(random(-v,v),random(-v,v) ));
    addParticle(p);
  }

  void addParticle(Dims p) {
    particles.add(p);
  }

}


