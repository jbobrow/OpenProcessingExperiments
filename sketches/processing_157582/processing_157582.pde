
//Day 57 #create365

ArrayList<Object> objects;
ArrayList<Pole> poles;
int poleSep = 30;
int objNum = 25;


void setup() {
  size(640, 640);
  smooth();
  background(0);

  objects = new ArrayList<Object>();
  poles = new ArrayList<Pole>();

  for (int i = 0; i < width/poleSep; i++) {
    poles.add(new Pole(new PVector(0, i*poleSep), -1, 30.0));
    poles.add(new Pole(new PVector(i*poleSep, 0), -1, 30.0));
    poles.add(new Pole(new PVector(width, i*poleSep), -1, 30.0));
    poles.add(new Pole(new PVector(i*poleSep, height), -1, 30.0));
  }
  for (int i = 0; i < objNum; i++) {
    for (int j = 0; j < objNum; j++) {
      objects.add(new Object(new PVector(20 + i*width/(objNum+1), 20 + j*height/(objNum+1))));
    }
  }
}

void draw() {
  fill(0, 30);
  rect(0, 0, width, height);
  for (Object o : objects) {
    for (Pole p : poles) {
      PVector force = affect(p.position, o, 1, 30);
      o.applyForce(force);
    }
    PVector fMouse = affect(new PVector(mouseX, mouseY), o, -1, 150);
    o.applyForce(fMouse);
    o.update();
    o.display();
  }
  
}

class Object {

  PVector position;
  PVector velocity;
  PVector acceleration;


  Object(PVector pos) {
    position = pos.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(4);
    position.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void display() {
    float a = map(velocity.x, -4, 4, 0, 255);
    float b = map(velocity.y, -4, 4, 0, 255);
    noStroke();
    fill(a, b, a+b, 130);
    ellipse(position.x, position.y, 3, 3);
  }
}

class Pole {

  PVector position;
  int polarity;
  float C ;

  Pole(PVector pos, int p_, float c_) {
    polarity = p_;
    position = pos.get();
    C = c_;
  }

  PVector affect(Object o) {
    PVector force = PVector.sub(position, o.position);
    float distance = force.mag();
    distance = constrain(distance, 10, 400);
    force.normalize();
    float strength = (float) C/(distance*distance);
    force.mult(strength);
    force.mult(polarity);
    return force;
  }
}

PVector affect(PVector p, Object o, int polarity, float C) {
  PVector force = PVector.sub(p, o.position);
  float distance = force.mag();
  distance = constrain(distance, 10, 100);
  force.normalize();
  float strength = (float) C/(distance*distance);
  force.mult(strength);
  force.mult(polarity);
  return force;
}

