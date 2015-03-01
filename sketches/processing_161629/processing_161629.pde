
ArrayList<Vehicle> vehicles;

void setup() {
  background(0);
  size(400,400);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 100; i++) {
    vehicles.add(new Vehicle(random(width),random(height)));
  }
}

void draw() {
  //background(255);
  
  for (Vehicle v : vehicles) {
    v.applyBehaviors(vehicles);
    v.display();
    v.update();
  }
  
}

void mouseDragged() {
  vehicles.add(new Vehicle(mouseX,mouseY));
}

class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;
  
  Vehicle(float x, float y) {
    location = new PVector(x, y);
    r = 10;
    maxspeed = 3;
    maxforce = 0.5;
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void applyBehaviors(ArrayList<Vehicle> vehicles) {
    PVector separateForce = separate(vehicles);
    PVector seekForce = seek(new PVector(mouseX, mouseY));
    separateForce.mult(2);
    seekForce.mult(1);
    applyForce(separateForce);
    applyForce(seekForce);
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    
    return steer;
  }
  
  PVector separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = r*2;
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      sum.sub(velocity);
      sum.limit(maxforce);
    }
    return sum;
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(random(255), random(25),random(200));
    pushMatrix();
    translate(location.x,location.y);
    ellipse(0,0,r,r);
    popMatrix();
  }
}
    


