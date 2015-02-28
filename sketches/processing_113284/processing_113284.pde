
ArrayList<Particle> myParticles;


//==========================================================
void setup() {
  size(400, 400);
  myParticles = new ArrayList<Particle>(); 

  for (int i=0; i<500; i++) {
    float rx = random(width); 
    float ry = random(height); 
    myParticles.add( new Particle(rx, ry));
  }
}


//==========================================================
void draw() {
  background (200);

  float gravityForcex = 0; 
  float gravityForcey = 0.02;
  float mutualRepulsionAmount = (mousePressed)? 1.0 : -1.0; // attraction


  for (int i=0; i<myParticles.size(); i++) {
    Particle ithParticle = myParticles.get(i);
    float px = ithParticle.px;
    float py = ithParticle.py;


    for (int j=0; j<i; j++) {
      Particle jthParticle = myParticles.get(j);
      float qx = jthParticle.px;
      float qy = jthParticle.py;

      float dx = px - qx; 
      float dy = py - qy; 
      float dh = sqrt(dx*dx + dy*dy); 
      if (dh > 1.0) {
        
        float componentInX = dx/dh;
        float componentInY = dy/dh;
        float proportionToDistanceSquared = 1.0/(dh*dh);
        
        float repulsionForcex = mutualRepulsionAmount * componentInX * proportionToDistanceSquared;
        float repulsionForcey = mutualRepulsionAmount * componentInY * proportionToDistanceSquared;

        ithParticle.addForce( repulsionForcex,  repulsionForcey); // add in forces
        jthParticle.addForce(-repulsionForcex, -repulsionForcey); // add in forces
      }
    }
  }

  for (int i=0; i<myParticles.size(); i++) {
    myParticles.get(i).bPeriodicBoundaries = false;
    myParticles.get(i).update(); // update all locations
  }

  for (int i=0; i<myParticles.size(); i++) {
    myParticles.get(i).render(); // draw all particles
  }
}

//==========================================================
class Particle {
  float px; 
  float py; 
  float vx; 
  float vy; 
  float damping;
  float mass; 
  boolean bLimitVelocities = true;
  boolean bPeriodicBoundaries = false;

  // Constructor for the Particle
  Particle (float x, float y) {
    px = x; 
    py = y; 
    vx = vy = 0; 
    damping = 0.96;
    mass = 1.0;
  }
  
  // Add a force in. One step of Euler integration.
  void addForce (float fx, float fy) {
    float ax = fx / mass; 
    float ay = fy / mass; 
    vx += ax; 
    vy += ay;
  }

  // Update the position. Another step of Euler integration.
  void update() {
    vx *= damping; 
    vy *= damping;
    limitVelocities();
    handleBoundaries();
    px += vx; 
    py += vy;
  }
  
  
  void limitVelocities(){
    if (bLimitVelocities){
      float speed = sqrt(vx*vx + vy*vy); 
      float maxSpeed = 10; 
      if (speed > maxSpeed){
        vx *= maxSpeed/speed;
        vy *= maxSpeed/speed;
      }
    }
  }

  void handleBoundaries() {
    if (bPeriodicBoundaries) {
      if (px > width ) px -= width;
      if (px < 0     ) px += width;
      if (py > height) py -= height;
      if (py < 0     ) py += height;
    } 
    else {
      if (px > width ) vx = -vx;
      if (px < 0     ) vx = -vx;
      if (py > height) vy = -vy;
      if (py < 0     ) vy = -vy;
    }
  }

  void render() {
    ellipse(px, py, 7, 7);
  }
}
