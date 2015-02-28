
// Seek_Arrive
// Daniel Shiffman <http://www.shiffman.net>

// The "Vehicle" class

class Vehicle {
  
  ArrayList<PVector> history = new ArrayList<PVector>();

  PVector location;
  PVector prev_loc;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  color myColor;

  Vehicle(float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    prev_loc = new PVector(x,y);
    // println(prev);
    r = 3.0;
    maxspeed = 50;
    maxforce = 0.5;
    myColor = color((int)random(64, 191), (int)random(0, 64), (int)random(191, 255));
  }
  
  Vehicle(float x, float y, float _ms, float _mf) {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    prev_loc = new PVector(x,y);
    r = 3.0;
    maxspeed = _ms;
    maxforce = _mf;
//    maxspeed = 50;
//    maxforce = 0.5;
    myColor = color((int)random(64, 191), (int)random(0, 64), (int)random(191, 255));
  }

  // Method to update location
  void update(float _r, float _ms, float _mf) {
    r = _r;
    maxspeed = _ms;
    maxforce = _mf;
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);
    
//    history.add(location.get());
//    if (history.size() > 10) {
//      history.remove(0);
//    }
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void seek(PVector target) {
    PVector desired = PVector.sub(target,location);  // A vector pointing from the location to the target
    
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    
    applyForce(steer);
  }
  
  void display(int _ds) {
    switch(_ds) {
      case 0:
        fill(myColor);
        ellipse(location.x, location.y, r, r);
        break;
      case 1:
        noFill();
        stroke(myColor);
        strokeWeight(r/4);
        ellipse(location.x, location.y, r, r);
        break;
      case 2: 
        stroke(myColor);
        strokeWeight(r*0.5);
        line(prev_loc.x, prev_loc.y, location.x, location.y);
        prev_loc.set(location); 
        break;  
      case 3:
        // Draw a triangle rotated in the direction of velocity
        float theta = velocity.heading2D() + PI/2;
        fill(myColor);
        pushMatrix();
        translate(location.x,location.y);
        rotate(theta);
        beginShape();
        vertex(0, 0);
        vertex(-r, r*4);
        vertex(r, r*4);
        endShape();
        popMatrix();
        break;      
    }  
  }
  
  void display() {
    
//    beginShape();
//    noStroke();
//    fill(255, 0, 0);
//    for(PVector v: history) {
//      vertex(v.x,v.y);
//    }
//    endShape();
    
    // Draw a triangle rotated in the direction of velocity
//    float theta = velocity.heading2D() + PI/2;
//    fill(175);
//    stroke(0);
//    pushMatrix();
//    translate(location.x,location.y);
//    rotate(theta);
//    beginShape();
//    vertex(0, -r*3);
//    vertex(-r, r*2);
//    vertex(r, r*4);
//    endShape();
//    popMatrix();
    fill(myColor);
    ellipse(location.x, location.y, r, r);

    
  }
  
  void displayLine() {
    stroke(myColor);
    strokeWeight(r*0.5);
    line(prev_loc.x, prev_loc.y, location.x, location.y);
    prev_loc.set(location);  
  }
}

