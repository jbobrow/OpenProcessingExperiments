
Vehicle wanderer;
boolean debug = true;

void setup() {
  size(400,400);
  wanderer = new Vehicle(width/2,height/2);
  background(0);
}

void draw() {
  //background(0);
  wanderer.wander();
  wanderer.run();
}

void mousePressed() {
  debug = !debug;
}
class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float wandertheta;
  float maxforce;
  float maxspeed;
  
  Vehicle(float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    r = 6;
    wandertheta = 0;
    maxspeed = 2;
    maxforce = 0.05;
  }
  
  void run() {
    update();
    borders();
    display();
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void wander() {
    float wanderR = 25;
    float wanderD = 80;
    float change = 0.3;
    wandertheta += random(-change,change);
    
    PVector circleloc = velocity.get();
    circleloc.normalize();
    circleloc.mult(wanderD);
    circleloc.add(location);
    
    float h = velocity.heading2D();
    
    PVector circle0ffSet = new PVector(wanderR*cos(wandertheta+h),wanderR*sin(wandertheta+h));
    PVector target = PVector.add(circleloc,circle0ffSet);
    seek(target);
    
    if (debug) drawWanderStuff(location,circleloc,target,wanderR);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void display() {
    
    float theta = velocity.heading2D() + radians(90);
    stroke(255,0,0,100);
    //stroke(255);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    /*beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();*/
    rect(0,0,10,10);
    popMatrix();
  }
void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}



void drawWanderStuff(PVector location, PVector circle, PVector target, float rad) {
  stroke(255,100); 
  noFill();
  //ellipseMode(CENTER);
  //ellipse(circle.x,circle.y,rad*2,rad*2);
  rect(target.x,target.y,20,20);
  ellipse(target.x,target.y,4,4);
  line(target.x,target.y,10,10);
  line(target.x,target.y,390,10);
  line(target.x,target.y,10,390);
  line(target.x,target.y,390,390);
  line(location.x,location.y,circle.x,circle.y);
  line(circle.x,circle.y,target.x,target.y);
  
}
  
    


