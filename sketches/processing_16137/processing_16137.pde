
ParticleEngine engine;

void setup() {
  size(400, 400);
  background (#446dad);
  engine = new ParticleEngine();
  smooth();
}

void draw() {
  engine.update();
  background (#446dad);
  engine.draw();
  stroke(255);
  strokeWeight(5);
  noFill();
  ellipse(mouseX, mouseY, 20, 20);
  line(mouseX, mouseY+10, mouseX, mouseY+50);
}

void mousePressed() {
  engine.createBubbles(mouseX, mouseY);
}


