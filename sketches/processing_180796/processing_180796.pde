
Observation[] knownObs = new Observation[10];
PImage img;

void setup() {
  // noLoop();
  size(400, 400);
  img = createImage(width, height, RGB);
  newObs();
}

void draw() {
  background(255);
  smooth();
  stroke(0, 0, 0);
  interpolate();
  for (int i = 0; i < knownObs.length; i++) {
    //knownObs[i].display();
    knownObs[i].move();
  }
}

void interpolate() {
  img.loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      PVector origin = new PVector(i, j);
      float val = 0.0;
      float totalIDWdistance = 0.0;
      for (int k = 0; k < knownObs.length; k++) {
        float IDWdistance = 1/(pow(PVector.dist(origin, knownObs[k].origin), 8));
        val += knownObs[k].val * IDWdistance;
        totalIDWdistance += IDWdistance;
      }
      val = val/totalIDWdistance;

      color myColor = color(val, val, val);
      img.pixels[j*width+i] = myColor;
    }
  }
  img.updatePixels();
  image(img, 0, 0);
}

void newObs() {
  int border = 50;
  for (int i = 0; i < knownObs.length; i++) {
    PVector origin = new PVector(random(0 + border, width - border), random(0 + border, height - border));
    float val = random(0, 255);
    knownObs[i] = new Observation(origin, val);
  }
}

void mouseClicked() {
  newObs();
}

class Observation {
  PVector origin;
  Float val, yMove, xMove;

  Observation(PVector tempOrigin, Float tempVal) {
    origin = tempOrigin;
    val = tempVal;
    xMove = random(-1, 1);
    yMove = random(-1, 1);
  }

  void display() {
    pushMatrix();
    translate(origin.x, origin.y);
    fill(val);
    ellipse(0, 0, 5, 5);
    popMatrix();
  }

  void move() {
    xMove += random(-0.01, 0.01);
    yMove += random(-0.01, 0.01);
    origin.x += min(xMove, 1);
    origin.y += min(yMove, 1);
    origin.x += max(xMove, -1);
    origin.y += max(yMove, -1);
    if (origin.x >= width || origin.x <= 0) {
      xMove = xMove * -1;
    }
    if (origin.y >= height || origin.y <= 0) {
      yMove = yMove * -1;
    }


    origin.x = min(origin.x, width);
    origin.x = max(origin.x, 0);
    origin.y = min(origin.y, height);
    origin.y = max(origin.y, 0);
  }
}

