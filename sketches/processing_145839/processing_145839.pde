
// A list of vehicles
ArrayList<Vehicle> vehicles;
ArrayList<Comida> comilongas;
float posx;
float posy;
float dragx;
float dragy;
float afex;
float afey;
boolean afegeix = false;

void setup() {
  size(550, 550);
  posx = width/2;
  posy = height/2;
  // We are now making random vehicles and storing them in an ArrayList
  vehicles = new ArrayList<Vehicle>();

  for (int i = 0; i < 200; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));
  }

  comilongas = new ArrayList<Comida>();
}

void draw() {
  background(255);

  for (Comida c : comilongas) {
    c.display();
  }
  for (Vehicle v : vehicles) {
    // Path following and separation are worked on in this function

    v.applyBehaviors(vehicles, posx, posy);

    for (Comida c : comilongas) {
      //v.applyForce( c.atraccion(v.location) );

      if ((round(c.location.x) == round(v.location.x)) && (round(c.location.y) == round(v.location.y)) && c.vivo) {
        c.muere();
        afegeix = true;
        afex = v.location.x;
        afey = v.location.y;
      }

      if (c.vivo == true) {
        posx = (c.location.x);
        posy = (c.location.y);
      }
      else {
        posx = width/2;
        posy = height/2;
      }
    }

    // Call the generic run method (update, borders, display, etc.)
    v.update();
    v.display();
  }
  if (afegeix == true) {

    vehicles.add(new Vehicle(afex, afey));

    afegeix = false;
  }
}


void mouseReleased() {
  comilongas.add(new Comida(mouseX, mouseY));
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
    r = 7;
    maxspeed = 3;
    maxforce = 0.1;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  void applyBehaviors(ArrayList<Vehicle> vehicles, float rusticx, float rusticy) {
    PVector separateForce = separate(vehicles);
    PVector seekForce = seek(new PVector(rusticx, rusticy));
    separateForce.mult(2);
    seekForce.mult(1);
    applyForce(separateForce);
    applyForce(seekForce);
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force

      return steer;
  }

  // Separation
  // Method checks for nearby vehicles and steers away
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
    fill(0, 255, 0);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, r, r);
    popMatrix();
  }
}




class Comida {
  PVector location;
  float r = random(30,100);
  float x = 0;
  float y = 0;
  float z = 0;
  boolean vivo = true;

  
  
  Comida(float x, float y) {
    location = new PVector(x, y);
  }

  // Method to update location
  void update() {
  }

  PVector atraccion(PVector USForceMiami) {
    PVector dir = PVector.sub(location, USForceMiami);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d, 5, 30);
    float force = 1 / d;
    dir.mult(force);
    return dir;
  }

  void display() {
    background(255);
    fill(x, y, z);
    noStroke();
    ellipse(location.x, location.y, r, r);
  }
  
  void muere(){
    
    x+=1;
    y+=1;
    z+=1;
    if(x >= 255){
      vivo = false;
    }
    
  }
}



