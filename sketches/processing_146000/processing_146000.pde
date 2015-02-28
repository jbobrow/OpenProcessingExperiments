
Circle[] circles = new Circle[90];

void setup() {
  size(600, 440);
  smooth();

  for (int i = 0; i < circles.length; i++) {
    //float w = random(250);
    circles[i] = new Circle(20, 20);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < circles.length; i++) {
    circles[i].update();
    circles[i].display();
    circles[i].edges();
  }
}

class Circle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float w, h;
  float r = random(200);
  color c = color(44, 144, 243);
  
  Circle(float w_, float h_) {
    location = new PVector(r*3, random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    w = w_;
    h = h_;
  }
  
  void update() {
    //acceleration = PVector.random2D();
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(location);
    mouse.setMag(0.5);
    acceleration = mouse;
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(10);
  }
  
  void display() { 
    fill(c, 40);
    stroke(255);
    ellipse(location.x, location.y, w, h);
  }
  
  void edges() {
    if (location.x > width || location.x < 0)  velocity.x *= -1;
  }
}


