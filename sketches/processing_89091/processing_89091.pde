
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Walker[] w;

int total = 0;

void setup() {
  size(600, 400);

  w = new Walker[10];
  for (int i = 0; i < w.length; i++) {
    w[i] = new Walker();
  }
}

void draw() {
  background(255);
  int o = int(map(mouseX,0,width,1,8));
  noiseDetail(o,0.3);

  if (frameCount % 30 == 0) {
    total = total + 1;
    if (total > w.length-1) {
      total = w.length-1;
    }
  }

  for (int i = 0; i < total; i++) {
    w[i].walk();
    w[i].display();
  }
}

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A random walker class!

class Walker {
  PVector location;

  PVector noff;

  Walker() {
    location = new PVector(width/2, height/2);
    noff = new PVector(random(1000),random(1000));
  }

  void display() {
    strokeWeight(2);
    fill(127);
    stroke(0);
    ellipse(location.x, location.y, 48, 48);
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    
    location.x = map(noise(noff.x),0,1,0,width);
    location.y = map(noise(noff.y),0,1,0,height);
    
    noff.x += 0.01;
    noff.y += 0.01;
  }
}
