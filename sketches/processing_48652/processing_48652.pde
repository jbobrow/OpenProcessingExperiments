
ParticleSystem ps;

void setup() {
  size(640, 360);
  colorMode(RGB, 120, 130, 255, 100);
  ps = new ParticleSystem(1, new PVector(width/2, height/2, 0));
  smooth();
}

void draw() {
  background(0);
  ps.run();
  ps.addParticle(mouseX, mouseY);
}

