
ArrayList<Particle> myParticles;
ArrayList<Spring> mySprings;

void setup() {
  size(400, 400);
  myParticles = new ArrayList<Particle>(); 

  int nPoints = 60;
  float radius = 100; 
  for (int i=0; i<nPoints; i++) {
    float t = (float)i/nPoints * TWO_PI; 
    float rx = width/2 + radius * cos(t);
    float ry = width/2 + radius * sin(t);
    myParticles.add( new Particle(rx, ry));
  }


  // stitch the particles together into a blob. 
  mySprings = new ArrayList<Spring>();
  for (int i=0; i<(nPoints/2); i++) {
    Particle p = myParticles.get(i);
    Particle q = myParticles.get((i+1)%nPoints);
    Spring s0 = new Spring (p, q);
    mySprings.add (s0);
  }
 
  int connections[] = {2,3,5,7,11};
  for (int j=1; j<connections.length; j++) {
    for (int i=0; i<nPoints; i++) {
      Particle p = myParticles.get(i);
      Particle q = myParticles.get((i+ connections[j])%nPoints);
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

  float gravityForceX = 0; 
  float gravityForceY = 0.1;

  // update the particles
  for (int i=0; i<myParticles.size(); i++) {
    myParticles.get(i).bPeriodicBoundaries = false;
    myParticles.get(i).update(); // update all locations
  }

  if (mousePressed) {
    myParticles.get(whichPointIsGrabbed).px = mouseX;
    myParticles.get(whichPointIsGrabbed).py = mouseY;
  }
  for (int i=0; i<myParticles.size(); i++) {
    myParticles.get(i).addForce(gravityForceX, gravityForceY);
  }
  
  // update the springs
  for (int i=0; i<mySprings.size(); i++) {
    mySprings.get(i).update(); // draw all springs
  }
  

  // Render the springs and particles
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
      float maxSpeed = 6.0; 
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
      if (px+vx > width ) {
        vx = -vx;
        px = min(px, width);
      }
      if (px+vx < 0     ) {
        vx = -vx;
        px = max(px, 0);
      }
      if (py+vy > height) {
        vy = -vy;
        py = min(py, height);
      }
      if (py+vy < 0     ) {
        vy = -vy;
        py = max(py, 0);
      }
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
    springConstant = 0.1;
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
