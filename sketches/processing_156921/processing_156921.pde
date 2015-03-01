
ArrayList<Object> objects;
color c1 = color(102, 224, 207);
color c2 = color(245, 233, 101);
color c3 = color(183, 175, 98);
float theta = 0;
float forceMax = 0.01;


int num = 200;
void setup() {
  size(600, 600);
  
  objects = new ArrayList<Object>();
  for (int i = 0; i < num; i++) {
    objects.add(new Object(height, c3));
    objects.add(new Object(2*height/3, c1));
    objects.add(new Object(height/3, c2));
  }
}

void draw() {
  background(229, 252, 255);
  strokeWeight(2);
  
  
  float mx = map(mouseX, 0, width, -forceMax, forceMax);
  PVector force = new PVector(mx, 0);
  
  for (Object o : objects) {
    o.applyForce(force);
    o.update();
    o.display();
    
  }
  theta += 0.001;
}

class Object {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float anchorX;
  int yinit;
  color c;
  float shift;
  float dy;
  int sW;
  
  Object(int yinit_, color c_) {
    anchorX = random(width);
    yinit = yinit_;
    location = new PVector(anchorX, yinit - height/3 - 50);
    c = c_;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    shift = random(TWO_PI);
    dy = random(-20, 20);
    sW = random(255);

  }
  
  void display() {
    stroke(c, sW);
    strokeWeight(2);
    line(anchorX, yinit, location.x  + 50*sin(theta + shift), location.y + dy);
    shift+=0.01;
}

void applyForce(PVector force) {
  acceleration.add(force);
}

void update() {
  velocity.add(acceleration);
  location.add(velocity);
  velocity.limit(0.5);
  acceleration.mult(0);
}
}
