

float a = 0;
float w;
float h;
float d;
int numDots = 200;
ArrayList<ColorDot> cdList;
float radius = 5;
float frictionScalar = -.1;
float deltaF = -.0005;
float timer = 0;
PseudoMouse pseudoM;

void setup() {
  size(600, 600, P3D);
  w = width;
  h = height;
  d = 800;
  colorMode(HSB, 360, 100, 100);
  pseudoM = new PseudoMouse(w, h, d);
  cdList = new ArrayList<ColorDot>();
  for (int i = 0; i < numDots; i++) {
    cdList.add(new ColorDot(random(-w/2, w/2), random(-h/2, h/2), random(100, d/2), radius, w, h, d));
  }
}

void draw() {
  background(0);
  lights();
  timer += .12;
  if (timer > 500) {
    reset();
    timer = 0;
  }
  changeFriction();
  a += .001;
  if (a > 100*TWO_PI) {
    a = 0;
  }
  pseudoM.go();
  for (int i = 0; i < numDots; i++) {
    ColorDot cd = cdList.get(i);
    pushMatrix();
    translate(width/2, height/2, -400);
    rotateZ(PI/4);
    rotateY(1.9);
    rotateX(2.44);
    rotateZ(a);
    if (i == 0) {
      stroke(255);
      noFill();
      box(w, h, d);
      noStroke();
    }
    cd.display();
    popMatrix();
    PVector grav = new PVector(0, .2, 0);
    cd.applyForce(grav);
    PVector friction = PVector.mult(cd.vel, frictionScalar);
    cd.applyForce(friction);

    if (pseudoM.isClicked == true) {
      PVector mVector = new PVector(pseudoM.x - w/2, pseudoM.y - h/2, pseudoM.z - d/2);
      PVector difference = PVector.sub(mVector, cd.pos);
      difference.normalize();
      difference.mult(.3);
      cd.accel = difference;
    }
  }
}
void changeFriction() {
  frictionScalar += deltaF;
  if (frictionScalar > -.1 || frictionScalar < -.8) {
    deltaF *= -1;
  }
}
void reset() {
  cdList.clear();
  for (int i = 0; i < numDots; i++) {
    cdList.add(new ColorDot(random(-w/2, w/2), random(-h/2, h/2), random(100, d/2), radius, w, h, d));
  }
}

class ColorDot {
  PVector accel = new PVector();
  PVector vel = new PVector();
  PVector pos = new PVector();
  float mass;
  float r;
  float hue;
  float sat;
  float bri;
  color myColor;
  float w;
  float h;
  float d;

  ColorDot(float x, float y, float z, float r, float w, float h, float d) {
    pos.x = x;
    pos.y = y;
    pos.z = z;
    this.r = r;
    init();
    this.w = w;
    this.h = h;
    this.d = d;
  } 

  void display() {
    checkOutOfBounds();
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
    fill(myColor);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphere(2*r);
    //ellipse(0, 0, r*2, r*2);
    popMatrix();
  }
  void applyForce(PVector force) {
    force.div(mass);
    accel.add(force);
  }
  void checkOutOfBounds() {
    if (pos.x < -w/2 || pos.x > w/2) {
      vel.x *= -1;
    } 
    if (pos.y < -h/2 || pos.y > h/2) {
      vel.y *= -1;
    } 
    if (pos.z < -d/2 || pos.z > d/2) {
      vel.z *= -1;
    }
  }
  void init() {
    mass = random(1, 10);
    hue = map(mass, 1, 10, 0, 360);
    sat = map(mass, 1, 10, 0, 100);
    bri = map(mass, 1, 10, 0, 100);
    myColor = color(hue, sat, bri);
  }
}

class PseudoMouse {

  float x;
  float y;
  float z;
  float xoff = 200;
  float yoff = 200;
  float zoff = 200;
  float xScale = .009;
  float yScale = .007;
  float zScale = .008;
  float q;
  float qoff = 200;
  float qScale = .003;
  boolean isClicked;
  float w;
  float h;
  float d;

  PseudoMouse(float w, float h, float d) {
    this.w = w;
    this.h = h;
    this.d = d;
  }

  void go() {
    xoff += xScale;
    yoff += yScale;
    zoff += zScale;
    x = noise(xoff)*w;
    y = noise(yoff)*h;
    z = noise(zoff)*d;
    if (xoff > 1000) {
      xoff = 0;
    }
    if (yoff > 1000) {
      yoff = 0;
    }
    if (zoff > 1000) {
      zoff = 0;
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



