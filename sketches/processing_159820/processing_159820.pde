
Vehicle v;

void setup() {
  size(400,400);
  v = new Vehicle(width/2,height/2);
  background(0);
}

void draw() {
  //background(0);
  
  PVector mouse = new PVector(mouseX,mouseY);
  fill(0);
  noStroke();
  ellipse(mouse.x,mouse.y,1,1);
  
  v.seek(mouse);
  v.update();
  v.display();
}

class Vehicle {
  ArrayList<PVector> history = new ArrayList<PVector>();
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;
  
  Vehicle(float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(10,-20);
    location = new PVector(x,y);
    r = 50;
    maxspeed = 4;
    maxforce = 0.9;
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
    
    history.add(location.get());
    if (history.size() > 100) {
      history.remove(0);
    }
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
    /*float theta = velocity.heading2D() + PI/2;
    noFill();
    stroke(255);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    vertex(0,0);
    vertex(r/2,-r/2);
    ellipse(r/2,-r/2,10,10);
    fill(255,0,0,120);
    ellipse(r/2,-r/2,r/2,r/2);
    noFill();
    vertex(r,0);
    vertex(0, r);
    vertex(r,r);
    vertex(0,0);
    line(r/2,-r/2,r/2,r+r/2);
    fill(0,0,255,100);
    ellipse(r/2,r+r/2,10,10);
    endShape(CLOSE);
    popMatrix();*/
    
    beginShape();
    stroke(255);
    noFill();
    for(PVector v: history) {
      vertex(v.x,v.y);
    }
    endShape();
    
    float theta = velocity.heading2D() + PI/2;
    noFill();
    stroke(255);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    vertex(0,0);
    vertex(r/2,-r/2);
    ellipse(r/2,-r/2,10,10);
    fill(255,0,0,120);
    ellipse(r/2,-r/2,r/2,r/2);
    noFill();
    vertex(r,0);
    vertex(0, r);
    vertex(r,r);
    vertex(0,0);
    line(r/2,-r/2,r/2,r+r/2);
    fill(0,0,255,100);
    ellipse(r/2,r+r/2,10,10);
    endShape(CLOSE);
    popMatrix();
    
  }
}


