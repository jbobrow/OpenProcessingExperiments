
class Body {

  int SIZE;
  PVector loc = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  float mass = int(random(1,5));

  Body() {
    loc.x = random(0, width);
    loc.y = random(0, height);
    SIZE = int(mass);
  }

  void boundryCheck() {
    if (loc.x >= width || loc.x <= 0) {
      vel.x = -vel.x;
    }
    if (loc.y >= height || loc.y <= 0) {
      vel.y = -vel.y;
    }
  }

  void update() {
    boundryCheck();
    vel.add(acc);
    loc.add(vel);
    acc.mult(0); // reset acceleration
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void render() {
    strokeWeight(1.8);
    fill(0, 255, 255);
    ellipse(loc.x + SIZE/2, loc.y + SIZE/2, SIZE*2, SIZE*2);
    fill(255, 255, 0);
    strokeWeight(0.2);
    rect(loc.x, loc.y, SIZE, SIZE);
    //fill(random(0, 255), random(0, 255), random(0,255));
    //rect(loc.x, loc.y, SIZE, SIZE);
  }
}


Body b;
int AMT = 555;
int OLD_AMT = AMT;
int T = 0;
Body[] bodies = new Body[AMT];

void setup() {
  size(800, 400);
  //smooth();
  background(0);

  b = new Body();
  frameRate(200);
  for (int i=0; i<AMT; i++) {
    bodies[i] = new Body();
  }
  mouseX = width/2;
  mouseY = width/2;
}

void draw() {
  //background(255);

  fill(0, 10);
  rect(0, 0, width, height);

  for (int i=0; i<AMT; i++) {

    PVector Gravity = new PVector(0, 0.024);
    Gravity.mult(bodies[i].mass);
    bodies[i].applyForce(Gravity);

    PVector Mouse = new PVector(
    map(mouseX, 0, width, -0.014, 0.014), 
    map(mouseY, 0, height, -0.014, 0.014));
    bodies[i].applyForce(Mouse);

    bodies[i].update();
    bodies[i].render();
  }

  fill(0, 140);
  rect(0, height-30, 140, height);

  fill(255);
  textSize(14);
  text("Click to Reduce", 20, height-10);
  T += 1;
  // if (T % 2 == 0 && AMT >= 0) AMT -= 10;
}

void mousePressed() {
  // Click to reduce ball-count
  AMT -= int(AMT/4+1);
  if (AMT <= 0) {
    AMT = OLD_AMT;
    setup();
  }
}
