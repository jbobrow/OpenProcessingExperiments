
Pea[] peas = new Pea[100];
PVector center;
public float noiseScale = 0.002;

void setup() {
  size(500, 500);
  smooth();
  colorMode(HSB, 255);
  center = new PVector(width * 0.5, height * 0.5);
  for (int i = 0; i < peas.length; i++) {
    peas[i] = new Pea(random(width), random(height));
  }
}

void draw() {
  background(255);
  center.set(mouseX, mouseY);
  for (int i = 0; i < peas.length; i++) {
    peas[i].move(center);
    peas[i].setHue();
    peas[i].displayTail(center);
  }
}

class Pea {
  
  PVector loc, vel, acc; // Location, velocity, acceleration
  float velLimit = 8.0; // Maximum velocity
  float accMult = 0.1; // Rate of acceleration
  int numTails = 5; // Number of tails
  float spacing = 20.0; // In degrees
  int hue; // Hue
  
  Pea(float _x, float _y) {
    loc = new PVector(_x, _y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    setHue();
  }
  
  void move(PVector _c) {
    acc = PVector.sub(_c, loc);
    acc.normalize();
    acc.mult(accMult);
    vel.add(acc);
    vel.limit(velLimit);
    loc.add(vel);
  }
  
  void displayTail(PVector _c) {
    float d = loc.dist(_c);
    PVector tail = PVector.sub(loc, _c);
    tail.normalize();
    tail.mult(0.1);
    
    spacing = map(vel.mag(), 0, velLimit, 180 / numTails, 1);
    strokeWeight(1);
    stroke(hue, 200, 200);
    
    for (int i = 0; i < numTails; i++) {
      float offset = -0.5 * numTails + i;
      offset = radians(offset * spacing);
      pushMatrix();
      translate(loc.x, loc.y);
      rotate(offset);
      line(tail.x, tail.y, 0, 0);
      popMatrix();
    }
  }
  
  void setHue() {
    float noiseVal = noise(loc.x * noiseScale, loc.y * noiseScale);
    hue = int(noiseVal * 255);
  }
  
}


