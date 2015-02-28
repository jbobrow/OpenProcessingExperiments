
import traer.physics.*;

ParticleSystem physics;
Particle attractor;
Particle[] tentacles;


void setup() {

  size(800, 600);
  background(255);
  frameRate(30);
  smooth();
  ellipseMode(CENTER);

  setupParticles();
}

void setupParticles() {

  physics = new ParticleSystem(0.0f, 0.03f);
  attractor = physics.makeParticle(1.0f, width / 2, height / 2, 0);
  attractor.setVelocity(random(-10, 10), random(-15, 15), 0);

  tentacles = new Particle[25];
  for (int i = 0; i < tentacles.length; i++) {
    float theta = random(1) * TWO_PI;
    float length = random(100, 300);
    float ax = cos(theta) * length;
    float ay = sin(theta) * length;
    float x = attractor.position().x() + ax;
    float y = attractor.position().y() + ay;

    tentacles[i] = physics.makeParticle(1.0f, x, y, 0);
    tentacles[i].setVelocity(random(-5, 5), random(-5, 5), 0);
    physics.makeAttraction(attractor, tentacles[i], 1000, 50);
  }
}

void keyPressed() {
  if ( key == ' ' ) {
    background(255);
    setupParticles();
  }
}

void draw() {

  physics.tick();
  fill(255);
  for (int i = 0; i < tentacles.length; i++) {
    Particle p = tentacles[i];
    float fillColor = min(p.velocity().length() * 100, 150);
    stroke(fillColor, 80);
    float distance = p.position().distanceTo(attractor.position());
    float diam = 40 - map(distance, 0, 300, 5, 40);
    ellipse(p.position().x(), p.position().y(), diam, diam);
  }
}


