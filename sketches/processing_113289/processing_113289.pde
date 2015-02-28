
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


void mousePressed(){
   for (int i=0; i<500; i++) {
    myParticles.get(i).px = random(width); 
    myParticles.get(i).py = random(height); 
  }
}

//==========================================================
void draw() {
  background (200);

  float noiseFieldStrength = 0.15;
 
  // noise field force; see noisefield sketch. 
  for (int i=0; i<myParticles.size(); i++) {
    float px = myParticles.get(i).px;
    float py = myParticles.get(i).py;

    float nx = 0.020*px              ; 
    float ny = 0.020*py              ;
    float mx = 0.021*px + 1.2345678  ;
    float my = 0.021*py + 2.3456789  ; 

    float noiseForcex = noiseFieldStrength * map(noise (nx, ny), 0, 1, -1, 1);
    float noiseForcey = noiseFieldStrength * map(noise (mx, my), 0, 1, -1, 1);
    
    myParticles.get(i).addForce (noiseForcex, noiseForcey); // add in forces
  }

  for (int i=0; i<myParticles.size(); i++) {
    myParticles.get(i).bPeriodicBoundaries = true;
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


  void limitVelocities() {
    if (bLimitVelocities) {
      float speed = sqrt(vx*vx + vy*vy); 
      float maxSpeed = 10; 
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
