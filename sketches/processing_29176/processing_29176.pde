
import traer.physics.*;

ParticleSystem physics;
Particle bob, tom, mouse;

void setup() {
  size(500, 500);
  physics = new ParticleSystem(.1, 0.01);
  bob = physics.makeParticle();
  tom = physics.makeParticle(2, 200, 100, 0);
  mouse = physics.makeParticle();
  tom.makeFixed();
  physics.makeSpring( bob, tom, .01, .01, 100.0 );
  physics.makeAttraction( bob, mouse, -500.0, 1.0);
}

void draw() {
  background(150);
  physics.tick();
  ellipse(bob.position().x(), bob.position().y(), 50, 50);
  ellipse(tom.position().x(), tom.position().y(), 50, 50);
  mouse.position().set(mouseX, mouseY, 0);
}

