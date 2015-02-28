
import traer.physics.*;

Particle earth, b, c;
ParticleSystem physics;
Spring s, p;

float pXposB, pYposB, pXposC, pYposC;

void setup() {
  size(600, 600);
  background(0);

  physics = new ParticleSystem(0, 0);
  earth = physics.makeParticle();
  b = physics.makeParticle();
  //b.position().set( width, height, 0 );

  c = physics.makeParticle();

  s = physics.makeSpring(earth, b, .05, .05, 4);

  p = physics.makeSpring(earth, c, .035, .035, 2);
}

void draw() {
   fill(0, 0, 0, 4);
  stroke(0, 0, 0, 4);
  rect( 0, 0, width, height);


  earth.position().set( mouseX, mouseY, 0 );


  if (mousePressed) {



    pXposB = b.position().x();
    pYposB = b.position().y();

    pXposC = c.position().x();
    pYposC = c.position().y();

    physics.tick(1);

    strokeWeight(1);
    stroke( 255, 0, 0 );
    line(pXposB, pYposB, b.position().x(), b.position().y());


    stroke(0, 0, 255);
    line(pXposC, pYposC, c.position().x(), c.position().y());
    
    
  }
}


