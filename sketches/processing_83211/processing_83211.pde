
import traer.physics.*;

Particle attractor;
Particle [] others;
ParticleSystem physics;

void setup(){
  size (1000,600);
  frameRate(20);
  //cursor(MOVE);
  smooth();
  fill(0);
  noStroke();
  ellipseMode(CENTER);
  noCursor();
  
  physics = new ParticleSystem(0,0.05);
  attractor = physics.makeParticle();
  attractor.makeFixed();
  
  others = new Particle[7000];
  for (int i=0; i<others.length; i++){
    others[i] = physics.makeParticle(1.0, random(0,width), random(0,height),0);
    physics.makeAttraction(attractor, others[i], 12000, 70);
  }
}

void draw(){
  attractor.position().set(mouseX,mouseY,0);
  physics.tick();
  background(255);
  //fill(255,20);
  //rect(0,0,width,height);
  for (int i=0; i<others.length; i++){
    Particle p = others[i];
    fill(0,70);
    
    ellipse(p.position().x(), p.position().y(), 4, 4);
  }
  fill(149,38,38);
  ellipse(mouseX, mouseY,15,15);
}




