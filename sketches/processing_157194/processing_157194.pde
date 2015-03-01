

/* Created by Trevor Phillips. While you are free to copy, paste, and edit
this code however you want, I'd appreciate if you gave my name an honorable mention! */

int numDots = 1500;
ArrayList<ColorDot> cdList;
float radius = .7;
float frictionScalar = -.1;
float deltaF = -.0005;
PseudoMouse pseudoM;
float timer = 0;

void setup() {
  size(600, 600);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  pseudoM = new PseudoMouse();
  cdList = new ArrayList<ColorDot>();
  for (int i = 0; i < numDots; i++) {
    cdList.add(new ColorDot(random(width), random(100), radius));
  }
}

void draw() {
  background(0);
  pseudoM.run();
  timer += .12;
  if (timer > 500) {
    reset();
    timer = 0;
  }
  changeFriction();
  for (int i = 0; i < numDots; i++) {
    ColorDot cd = cdList.get(i);
    cd.run();
    PVector grav = new PVector(0, .2);
    cd.applyForce(grav);
    PVector friction = PVector.mult(cd.vel, frictionScalar);
    cd.applyForce(friction);

    if (cd.checkOutOfBounds() == true) {
      cdList.remove(i);
      cdList.add(new ColorDot(random(width), random(100), radius));
    }

    if (pseudoM.isClicked == true) {
      PVector mVector = new PVector(pseudoM.x, pseudoM.y);
      PVector difference = PVector.sub(mVector, cd.pos);
      difference.normalize();
      difference.mult(.3);
      cd.accel = difference;
    }
  }
}
void changeFriction() {
  frictionScalar += deltaF;
  if (frictionScalar > -.1) {
    deltaF *= -1;
  }
  if (frictionScalar < -.8) {
    deltaF *= -1;
  }
}
void reset() {
  cdList.clear();
  for (int i = 0; i < numDots; i++) {
    cdList.add(new ColorDot(random(width), random(100), radius));
  }
}

class ColorDot {
  PVector accel = new PVector();
  PVector vel = new PVector();
  PVector pos = new PVector();
  float mass;
  float r;
  float h;
  float s;
  float b;
  color myColor;

  ColorDot(float x, float y, float r) {
    pos.x = x;
    pos.y = y;
    this.r = r;
    init();
  } 

  void run() {
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
    fill(myColor);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
  void applyForce(PVector force) {
    force.div(mass);
    accel.add(force);
  }
  boolean checkOutOfBounds() {
    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
      return true;
    }  
    else {
      return false;
    }
  }
  void init() {
    mass = random(1, 10);
    h = map(mass, 1, 10, 0, 360);
    s = map(mass, 1, 10, 0, 100);
    b = map(mass, 1, 10, 0, 100);
    myColor = color(h, s, b);
  }
}

class PseudoMouse {

  float x;
  float y;
  float xoff = 200;
  float yoff = 200;
  float xScale = .009;
  float yScale = .007;
  float q;
  float qoff = 200;
  float qScale = .003;
  boolean isClicked;

  PseudoMouse() {
  }

  void run() {
    xoff += xScale;
    yoff += yScale;
    x = noise(xoff)*width;
    y = noise(yoff)*height;
    if (xoff > 1000) {
      xoff = 0;
    }
    if (yoff > 1000) {
      yoff = 0;
    }
    qoff += qScale;
    q = noise(qoff)*width;
    if (qoff > 1000) {
      qoff = 0;
    }
    if (q % 7 > 1 && q % 7 < 15) {
      isClicked = true;
    }
    else {
      isClicked = false;
    }
  }
}



