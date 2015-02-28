
//import sms.*;

ParticleSystem ps;
boolean showVectors = false;

void setup(){
  size(600, 600, P3D);
  ps = new ParticleSystem(1, new PVector(width/2, height/2,0));
  //smooth();
}

void draw(){
  background(255);
  
  PVector G = new PVector(mouseX - width/2,mouseY - height/2);
  //PVector G = new PVector(-Unimotion.getSMSX(),Unimotion.getSMSZ());
  G.normalize();
  
  ps.gravity = G.get();
  ps.run();
  ps.addParticle();
}

void keyPressed() {
  showVectors = !showVectors;
}

