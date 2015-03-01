
Observation[] knownObs = new Observation[10];

void setup() {
  size(400, 400);
  int border = 50;
  for (int i = 0; i < knownObs.length; i++) {
    PVector origin = new PVector(random(0 + border, width - border), random(0 + border, height - border));
    PVector wind = new PVector(random(-50, 50), random(-50, 50));
    knownObs[i] = new Observation(origin, wind);
  }
}

void draw() {
  background(255);
  smooth();
  strokeWeight(2);
  for (int i = 0; i < knownObs.length; i++) {
    knownObs[i].display();
  }
  interpolate(mouseX, mouseY);
}

void interpolate(int x, int y) {
  PVector origin = new PVector(x, y);
  PVector wind = new PVector(0, 0);
  float totalIDWdistance = 0.0;
  for (int i = 0; i < knownObs.length; i++) {
    float IDWdistance = 1/(pow(PVector.dist(origin, knownObs[i].origin), 2));
    wind.x += knownObs[i].wind.x * IDWdistance;
    wind.y += knownObs[i].wind.y * IDWdistance;
    totalIDWdistance += IDWdistance;
  }
  wind.x = wind.x/totalIDWdistance;
  wind.y = wind.y/totalIDWdistance;

  stroke(0, 0, 255);
  pushMatrix();
  translate(origin.x, origin.y);
  ellipse(0, 0, 5, 5);
  line(0, 0, wind.x, wind.y);
  translate(wind.x, wind.y);
  rotate(atan2(wind.y, wind.x));
  triangle(0, 0, -2, -2, -2, 2);
  popMatrix();
}

class Observation {
  PVector origin;
  PVector wind;

  Observation(PVector tempOrigin, PVector tempWind) {
    origin = tempOrigin;
    wind = tempWind;
  }

  void display() {
    stroke(0, 0, 0);
    pushMatrix();
    translate(origin.x, origin.y);
    ellipse(0, 0, 5, 5);
    line(0, 0, wind.x, wind.y);
    translate(wind.x, wind.y);
    rotate(atan2(wind.y, wind.x));
    triangle(0, 0, -2, -2, -2, 2);
    popMatrix();
  }
}



