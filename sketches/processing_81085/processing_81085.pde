
ArrayList<Particle> particles;
float x, y; 

void setup() {
  size (600, 600);

  particles = new ArrayList<Particle>();

  //  for (int i = 0; i < 500; i++) {
  //    Particle p = new Particle();
  //    particles.add(p);
  //  }
  
  noCursor();
  
}

void draw() {
  //  background(210, 240, 230);
  fill(210, 240, 230, 128);
  rect(0, 0, width, height);
  
  x = mouseX;
  y = mouseY;
  
  pushMatrix();
  stroke(3);
  translate(x, y);
  line(0,0,-5,-5);
  line(0,0,5,-5);
  popMatrix();
  
  
  Particle newParticle = new Particle(x, y);
  particles.add(newParticle);

  /* Simulate and draw */
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.simulate();
    p.draw();
  }

  /* Kill! */
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    if (!p.isAlive()) {
      particles.remove(i);
    }
  }

  text("Particles alive: " + particles.size(), 20, 20);
  text("Framerate: " + frameRate, 20, 35);
}


void mouseClicked() {
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.reset();
  }
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;

  float mass = 3;
  float damping = 0.8;

  int age;

  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-8, 1));
    acceleration = new PVector(0, 0.1);
  }

  boolean isAlive() {
    if (age < 2000) {
      return true;
    }
    return false;
  }

  void simulate() {
    velocity.add(acceleration);
    position.add(velocity);

    age++;

    if (position.x > width - (mass/2) || position.x < 0 + (mass/2)) {
      velocity.x = velocity.x * -1 * damping;
      position.x = map(position.x, 0, width, 1, width-1);
    }
    if (position.y > height - (mass/2) || position.y < 0 + (mass/2)) {
      velocity.y = velocity.y * -1 * damping;
      position.y = map(position.y, 0, height, 1, height-1);
    }
  }

  void draw() {
    noStroke();

    if (isAlive()) {
      fill(120, 115, 105, 128);
    }
    else {
      fill(255, 0, 0, 128);
    }
    
    ellipse(position.x, position.y, mass, mass);
  }

  void reset() {
//    position.x = width/2;
//    position.y = height/2;

    velocity.x = random(-1, 1);
    velocity.y = random(-8, -1);
  }
}



