
ArrayList<Particle> myParticles;
ArrayList<Spring> mySprings;

void setup() {
  size(400, 400);
  myParticles = new ArrayList<Particle>(); 

  int nX = 10;
  int nY = 10; 
  for (int y=0; y<nY; y++) {
    for (int x=0; x<nX; x++) {
      float rx = 50 + x*30;
      float ry = 50 + y*30;
      myParticles.add( new Particle(rx, ry));
    }
  }

  // stitch the particles together into a mesh. 
  mySprings = new ArrayList<Spring>();
  for (int y=0; y<nY; y++) {
    for (int x=0; x<nX-1; x++) {
      Particle p = myParticles.get(y*nX + x);
      Particle q = myParticles.get(y*nX + x+1);
      Spring s0 = new Spring (p, q);
      mySprings.add (s0);
    }
  }
  for (int y=0; y<nY-1; y++) {
    for (int x=0; x<nX; x++) {
      Particle p = myParticles.get(y    *nX + x);
      Particle q = myParticles.get((y+1)*nX + x);
      Spring s0 = new Spring (p, q);
      mySprings.add (s0);
    }
  }
  for (int y=0; y<nY-1; y++) {
    for (int x=0; x<nX-1; x++) {
      Particle p = myParticles.get(y    *nX + x);
      Particle q = myParticles.get((y+1)*nX + x+1);
      Spring s0 = new Spring (p, q);
      mySprings.add (s0);
    }
  }
  for (int y=0; y<nY-1; y++) {
    for (int x=1; x<nX; x++) {
      Particle p = myParticles.get(y    *nX + x);
      Particle q = myParticles.get((y+1)*nX + x-1);
      Spring s0 = new Spring (p, q);
      mySprings.add (s0);
    }
  }
}

int whichPointIsGrabbed = -1; 
void mousePressed() {
  // find the closest particle
  float maxDist = 9999; 
  for (int i=0; i<myParticles.size(); i++) {
    float dx = mouseX - myParticles.get(i).px;
    float dy = mouseY - myParticles.get(i).py;
    float dh = sqrt(dx*dx + dy*dy); 
    if (dh < maxDist) {
      maxDist = dh;
      whichPointIsGrabbed = i;
    }
  }
}


void draw() {
  background (0);

  for (int i=0; i<myParticles.size(); i++) {
    myParticles.get(i).bPeriodicBoundaries = true;
    myParticles.get(i).update(); // update all locations
  }

  if (mousePressed) {
    myParticles.get(whichPointIsGrabbed).px = mouseX;
    myParticles.get(whichPointIsGrabbed).py = mouseY;
  }

  for (int i=0; i<mySprings.size(); i++) {
    mySprings.get(i).update(); // draw all springs
  }

  for (int i=0; i<mySprings.size(); i++) {
    mySprings.get(i).render(); // draw all springs
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
    damping = 0.93;
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


  void limitVelocities() {
    if (bLimitVelocities) {
      float speed = sqrt(vx*vx + vy*vy); 
      float maxSpeed = 10.0; 
      if (speed > maxSpeed) {
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


//==========================================================


class Spring {
  Particle p;
  Particle q; 
  float restLength;
  float springConstant; 

  Spring (Particle p1, Particle p2) {
    p = p1;
    q = p2;

    float dx = p.px - q.px; 
    float dy = p.py - q.py; 
    restLength = sqrt(dx*dx + dy*dy);
    springConstant = 0.08;
  }

  void update() {
    float dx = p.px - q.px; 
    float dy = p.py - q.py; 
    float dh = sqrt(dx*dx + dy*dy); 

    if (dh > 1) {
      float distention = dh - restLength; 
      float restorativeForce = springConstant * distention; // F = -kx
      float fx = (dx/dh) * restorativeForce;
      float fy = (dy/dh) * restorativeForce;
      p.addForce (-fx, -fy); 
      q.addForce ( fx, fy);
    }
  }

  void render() {
    stroke(255); 
    line(p.px, p.py, q.px, q.py);
  }
}
