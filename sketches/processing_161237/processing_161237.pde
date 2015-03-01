
ArrayList<Vehicle> vehicles;

void setup() {
  size(400,400);
  background(255);
  // We are now making random vehicles and storing them in an ArrayList
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 20; i++) {
    vehicles.add(new Vehicle(random(width),random(height)));
  }
}

void draw() {
  //background(255);

  for (Vehicle v : vehicles) {
    // Path following and separation are worked on in this function
    v.applyBehaviors(vehicles);
    // Call the generic run method (update, borders, display, etc.)
    v.update();
    v.display();
  }

}


void mouseDragged() {
  vehicles.add(new Vehicle(mouseX,mouseY));
}

class Vehicle {

  // All the usual stuff
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

    // Constructor initialize all values
  Vehicle(float x, float y) {
    location = new PVector(x, y);
    r = 30;
    maxspeed = 2;
    maxforce = 0.02;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // Separation
  // Method checks for nearby vehicles and steers away
  void applyBehaviors (ArrayList<Vehicle> vehicles) {
    PVector separateForce = separate(vehicles);
    PVector seekForce = seek(new PVector(mouseX,mouseY));
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
    // For every boid in the system, check if it's too close
    for (Vehicle other : vehicles) {
      float d = PVector.dist(location, other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxspeed);
      // Implement Reynolds: Steering = Desired - Velocity
      sum.sub(velocity);
      sum.limit(maxforce);
    }
    return sum;
  }


  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  void display() {
    stroke(255,150);
    fill(random(40),random(0),random(40),50);
    pushMatrix();
    translate(location.x, location.y);
    //quad(38, 10, 86, 20, 69, 63, 30, 76);
    beginShape(TRIANGLE_FAN);
vertex(5.5, 50);
vertex(57.5, 15); 
vertex(92, 50); 
vertex(57.5, 85); 
vertex(25, 50); 
vertex(57.5, 15); 
endShape();
    popMatrix();
  }

}


