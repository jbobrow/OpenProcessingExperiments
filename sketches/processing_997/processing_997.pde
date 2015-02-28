
class BlackHole extends Particle {

  GravityFlock parent;
  public static final float G = 100.0f;
  public static final float TRAPPED_DISTANCE = 5.0f;
  public static final float MAX_GRAV_DISTANCE = 200.0f;
  public static final int MAX_AGE = 10000;

  private int birth = 0;
  private float _strength = 0.6f; 

  public BlackHole(ParticleSystem ps, GravityFlock p, PVector l) {
    this(ps, p, l, 1.0f);
  }

  public BlackHole(ParticleSystem ps, GravityFlock p, PVector l, float strength_mod) {
    super(ps, new PVector(), new PVector(), l);
    _strength = strength_mod;
    parent = p;
    birth = parent.millis();
  }

  void applyForceTo(Particle p) {
    if ( this != p ) {
      // calculate direction of force
      PVector dir = PVector.sub(p.loc, loc);

      // distance between objects
      float d = dir.mag();

      if ( d <= MAX_GRAV_DISTANCE ) {
        d = PApplet.constrain(dir.mag(), 0.1f, 100.0f);

        // normalize vector (distance doesn't matter here, we just want this vector for direction)
        dir.normalize();

        // calculate gravitational force magnitude
        float force = strength() * (G * getMass() * p.getMass()) / (d * d);

        // get force vector --> magnitude * direction
        dir.mult(force);

        p.acc.sub(dir);			  
      }
    }
  }

  public int age() {
    return parent.millis() - birth;
  }

  public float strength() {
    return _strength;
  }

  float getMass() {
    return 2.0f;
  }

  void run() {
    Iterator it = parent.black_holes.getParticles().iterator();  
    while (it.hasNext()) {
      Particle hole = (Particle)it.next();  

      Iterator boids = parent.flock.getParticles().iterator();  
      while (boids.hasNext()) {
        Particle boid = (Particle)boids.next();
        ((BlackHole)hole).applyForceTo(boid);
      }

    }
    render();
  }

  void render() {
    parent.fill(255 * strength(), 0, 0);
    //    parent.stroke(255 * strength() );
    parent.ellipse(loc.x,loc.y, 20, 20);
  }
}


