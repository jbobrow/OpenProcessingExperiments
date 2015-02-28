
// SPECIAL THANKS TO mitchell whitelaw 
// http://openprocessing.org/visuals/?visualID=2615

import traer.physics.*;

int numPart = 20, strokeValue=55;
float gravity=0.2;
ParticleSystem MyParticleSystem = new ParticleSystem(0.0, 0.5);

Particle[] MyParticles = new Particle[numPart];
Spring[] MySprings = new Spring[numPart*2];

void setup() {
  size(900, 450);
  background(255);
  smooth();
  for (int i=0;i<numPart;i++) {
    MyParticles[int(i)] = MyParticleSystem.makeParticle(1.0, (width/numPart)*i, random(height), 10);
  }
  for (int i=0;i<numPart;i++) {
    MySprings[int(i)] = MyParticleSystem.makeSpring(MyParticles[int(i)], MyParticles[int(random(10))], 0.001, 0.1, 0.1);
  }
}

void draw() {
  MyParticleSystem.tick();
  stroke(0, strokeValue);
  fill(255);
  beginShape();
  for (int p=0; p<numPart; p++) {
    curveVertex(MyParticles[p].position().x(), MyParticles[p].position().y());
  }
  endShape(CLOSE);
  if (frameCount%40==0) {
    MyParticleSystem.setGravity(gravity*-1, gravity*-1, 0);
     gravity *= -1;
     strokeValue = (int)random(30,155);
  }

  // now shorten the springs
  for (int s=0; s<numPart; s++) {
    int spr = int(random(numPart)); // note we only shorten half the springs (the first half)
    MySprings[spr].setRestLength(MySprings[spr].restLength() - random(0, 1));
  }
}

void mousePressed()  {setup();}


