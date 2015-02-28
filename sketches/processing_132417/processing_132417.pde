
float noiseScale = 0.002;
PVector loc;
float tailLimit = 40.0;
int numTails = 20;
float spacing = 20.0;
int hue;

void setup() {
  size(400, 400);
  smooth();
  colorMode(HSB, 255);
  
  loc = new PVector(width * 0.5, height * 0.5);
  
  // Run once
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);
  setHue(mouse);
  displayTail(mouse);
  displayBody();
}

void draw() {
  if (mouseX != pmouseX || mouseY != pmouseY) {
    background(255);
    PVector mouse = new PVector(mouseX, mouseY);
    setHue(mouse);
    displayTail(mouse);
    displayBody();
  }
}

void displayTail(PVector _m) {
  float d = loc.dist(_m); // Distance to mouse
  PVector tail = PVector.sub(loc, _m);
  tail.normalize();
  tail.mult(d * 1.5);
  
  spacing = map(d, 0, width * 0.5, 360 / numTails, 1);
  strokeWeight(3);
  stroke(hue, 200, 200);
  
  for (int i = 0; i < numTails; i++) {
    float offset = -0.5 * numTails + i;
    offset = radians(offset * spacing);
    tail.mult(map(offset, 0, numTails * 0.5, 1, 0.4));
    
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(offset);
    line(tail.x, tail.y, 0, 0);
    popMatrix();
  }
}

void displayBody() {
  noStroke();
  fill(hue, 255, 200);
  ellipse(loc.x, loc.y, 20, 20);
}

void setHue(PVector _m) {
  float noiseVal = noise(_m.x * noiseScale, _m.y * noiseScale);
  hue = int(noiseVal * 255);
}
