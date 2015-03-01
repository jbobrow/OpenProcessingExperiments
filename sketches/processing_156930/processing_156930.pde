
ArrayList<Object> objects;
ArrayList<Pole> poles;
PVector center;

int numObj = 50;
int num = 1;

void setup() {
  size(640, 640);
  smooth();
  background(0);
 
  center = new PVector(width/2, height/2);
  
  objects = new ArrayList<Object>();
  poles = new ArrayList<Pole>();
  
  for (int i = 0; i < numObj; i++) {
    for (int j = 0; j < numObj; j++) {
    objects.add(new Object(new PVector(i*width/numObj, j*height/numObj)));
  }
  }
  poles.add(new Pole(new PVector(width/2, height/4), 1));
  poles.add(new Pole(new PVector(width/2, 3*height/4), 1));
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);
  
    
  for (Object o : objects) {
    for (Pole p : poles) {
      PVector force = p.affect(o);
      o.applyForce(force);
    }
    o.update();
    o.display();
  }
  
  
}

class Object {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector dist;
  float c;
  
  
  Object(PVector pos) {
    position = pos.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    dist = PVector.sub(position, center);
    c = dist.mag();
    
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void display() {
    noStroke();
    float a = map(position.x, 0, width, 50, 158);
    float d = map(c, 0, 1.4*300, 150, 0);
    
    fill(200, a, 158-a, d);
    //fill(255, 100);
    ellipse(position.x, position.y, 2, 2);
  }
  
}

class Pole {
  
  PVector position;
  int polarity;
  float C = 100;
  
  Pole(PVector pos, int p_) {
    polarity = p_;
    position = pos.get();
    
  }
  
  PVector affect(Object o) {
    PVector force = PVector.sub(position, o.position);
    float distance = force.mag();
    distance = constrain(distance, 10, 50);
    force.normalize();
    float strength = (float) C/(distance*distance);
    force.mult(strength);
    force.mult(polarity);
    return force;
  }
  
  
}

void mouseClicked() {
   objects = new ArrayList<Object>();
  poles = new ArrayList<Pole>();
  
  for (int i = 0; i < numObj; i++) {
    for (int j = 0; j < numObj; j++) {
    objects.add(new Object(new PVector(i*width/numObj, j*height/numObj)));
  }
  }
  switch(num) {
    case 0:
    poles.add(new Pole(new PVector(width/2, height/4), 1));
    poles.add(new Pole(new PVector(width/2, 3*height/4), 1));
    break;
    case 1:
    poles.add(new Pole(new PVector(width/2, height/3), 1));
    poles.add(new Pole(new PVector((float) width/2 + height/3/sqrt(3), 2*height/3), 1));
    poles.add(new Pole(new PVector((float) width/2 - height/3/sqrt(3), 2*height/3), 1));
    break;
    case 2:
    poles.add(new Pole(new PVector(width/2, height/4), 1));
  poles.add(new Pole(new PVector(width/2, 3*height/4), 1));
  poles.add(new Pole(new PVector(width/4, height/2), 1));
  poles.add(new Pole(new PVector(3*width/4, height/2), 1));
    break;
  }
    num++;
    if (num > 2) {
      num = 0;
    }
}
  
