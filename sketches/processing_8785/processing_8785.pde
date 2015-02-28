
import toxi.physics.*;
import toxi.geom.*;

VerletPhysics physics;
int SIZE = 10;
int drawingMethod = 0;

boolean cumulative = true;
boolean controlIt = true;

boolean freeze = false;

void setup() {
  size(800, 600, P3D);
  background(255);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);

  initPhysics();
}

void draw() {
  physics.update();
  physics.particles.get(0).x = mouseX;
  physics.particles.get(0).y = mouseY;
  drawParticles();
}

void drawParticles() {

  if(cumulative) {
    stroke(0,10);
    for (int i=2; i<physics.particles.size(); i++) {
      VerletParticle p1 = physics.particles.get(i-1);
      VerletParticle p2 = physics.particles.get(i);
      line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);  
    }
  }
  else {
    background(255);
    fill(200);
    for (int i=0; i<physics.particles.size(); i++) {
      ellipse(physics.particles.get(i).x, physics.particles.get(i).y, SIZE, SIZE);  
    }
  }
}

void initPhysics() {

  float restLength = 20;
  float strength = 0.0002f;

  float minRestLength = 50;
  float repulsionStrength = 0.001f;

  int nbParticles = 20;

  physics = new VerletPhysics();

  AABB aabb = new AABB(new Vec3D(width*.5, height*.5, 0), new Vec3D(width*.4, height*.4, 0));
  physics.setWorldBounds(aabb);

  for (int i=0; i<nbParticles; i++) {
    physics.addParticle(new VerletParticle(random(width*.3, width*.33), random(height*.5, height*.55), 0));
  }

  for (int i=2; i<physics.particles.size(); i++) {
    physics.addSpring(new VerletSpring(physics.particles.get(i-1), physics.particles.get(i), restLength, strength));
  }
  if (physics.particles.size() >=3) {
    physics.addSpring(new VerletSpring(physics.particles.get(1), physics.particles.get(physics.particles.size()-1), restLength, strength));
  }

  for (int i=1; i<physics.particles.size(); i++) {
    physics.addSpring(new VerletMinDistanceSpring(physics.particles.get(0), physics.particles.get(i), minRestLength, repulsionStrength));
  }
}


void keyPressed() {

  if (key == ' ') {
    cumulative = !cumulative;
    background(255); 
  }
}



