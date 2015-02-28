
ParticleEngine particleEngine;

void setup() {
  size(1024, 768);
  noStroke();
  smooth();
  particleEngine = new ParticleEngine();
}

void draw() {  
  background(0,0,0,255);
  particleEngine.draw();
}

void mousePressed(){
  particleEngine.explode(mouseX,  mouseY);
}

