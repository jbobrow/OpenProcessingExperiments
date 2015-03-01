
// Winter Storm
// JP Yepez

Dropper[] tears;
Floater[] grains;

int globalDepth;      // ground level
int numTears = 4000;   // number of Droppers
int numGrains = 500;    // number of Floaters

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100);
  globalDepth = height-height/5;  // set ground level

  // create Droppers
  tears = new Dropper[numTears];
  for (int i = 0; i < numTears; i++) {
    tears[i] = new Dropper(color(random(180,215), random(100), 100), int(random(2)));
  }

  // create Floaters
  grains = new Floater[numGrains];
  for (int i = 0; i < numGrains; i++) {
    grains[i] = new Floater(color(215, random(0,8), random(95,100), 160), int(random(1.5,3)));
  }
}

void draw() {
  // background and supporting elements
  fill(215, 100, 0, 150);
  rect(0, 0, width, height);
  strokeWeight(2);
  stroke(215, 0, 255, 150);
  fill(215, 5, 100);
  rect(0, globalDepth, width, height - globalDepth);  

  // Call Dropper functions
  for (int i = 0; i < numTears; i++) {
    tears[i].update();
    tears[i].display();
  }

  // Call Floater functions
  for (int i = 0; i < numGrains; i++) {
    grains[i].update();
    grains[i].display();
  }
}

// Full Screen
boolean sketchFullScreen() {
  return true;
}

class Dropper {
  PVector location, velocity, acceleration;
  color c;
  int radius;

  // Constructor arguments: color, radius
  Dropper(color c_, int radius_) {
    c = c_;
    radius = radius_;
    location = new PVector(random(width), random(globalDepth));  // random x,y
    velocity = new PVector(0, 0);
    velocity.limit(10);
  }

  void update() {
    // call mouse detection/collision function
    mouseDetection();
    
    // motion and acceleration
    acceleration = new PVector(random(-1, 1), .08);
    acceleration.normalize();
    acceleration.mult(random(.2));
    velocity.add(acceleration);
    location.add(velocity);
    
    // call check screen edges function
    checkEdges();
  }

  void display() {
    // draw ellipse
    noStroke();
    fill(c); 
    ellipse(location.x, location.y, radius*2, radius*2);
  }

  // check screen edges function
  void checkEdges() {
    if (location.x > width + radius) {
      location.x = -radius;
    }
    if (location.x < 0 - radius) {
      location.x = width + radius;
    }
    if (location.y > globalDepth - radius) {
      location.y = -radius;
      velocity = new PVector(velocity.x, random(velocity.y));
    }
  }

  // mouse detection/collision function
  void mouseDetection() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector prox = PVector.sub(location, mouse);
    if (prox.mag() <= 5) {
      velocity.y = -velocity.y; 
      velocity.x = -velocity.x;
    }
  }
}

class Floater {
  PVector location, velocity, acceleration;
  color c;
  int radius;

  // Constructor arguments: color, radius
  Floater(color c_, int radius_) {
    c = c_;
    radius = radius_;
    location = new PVector(random(width), random(globalDepth, height));  // random x,y
    velocity = new PVector(0, 0);
    velocity.limit(2);
  }

  void update() {
    // motion and acceleration
    acceleration = new PVector(random(-1, 1), random(-1, 1));
    acceleration.normalize();
    acceleration.mult(noise(.02));
    velocity.add(acceleration);
    location.add(velocity);
    
    // call check screen edges function
    checkEdges();
  }

  void display() {
    // draw ellipse 
    noStroke();
    fill(c); 
    ellipse(location.x, location.y, radius*2, radius*2);
  }

  // check screen edges function
  void checkEdges() {
    if (location.x <= radius) {
      velocity = new PVector(-velocity.x/4, random(velocity.y));
    }
    if (location.x >= width - radius) {
      velocity = new PVector(-velocity.x/4, random(velocity.y));
    }
    if (location.y <= globalDepth + radius) {
      velocity = new PVector(random(velocity.x), -velocity.y/2);
      acceleration = new PVector(acceleration.x, -acceleration.y);
    }
    if (location.y >= height - radius) {
      velocity = new PVector(random(velocity.x), -velocity.y/2);
      acceleration = new PVector(acceleration.x, -acceleration.y);
    }
    if (location.y < globalDepth - radius) {
      location.y = height - radius;
    }
  }
}



