
Flock flock;

void setup() {
  size(400,400);
  flock = new Flock();
  for (int i = 0; i < 200; i++) {
    Boid b = new Boid(width/2,height/2);
    flock.addBoid(b);
  }
}

void draw() {
  background(255);
  fill(0);
  rect(0,0,400,20);
  rect(0,40,400,20);
  rect(0,80,400,20);
  rect(0,120,400,20);
  rect(0,160,400,20);
  rect(0,200,400,20);
  rect(0,240,400,20);
  rect(0,280,400,20);
  rect(0,320,400,20);
  rect(0,360,400,20);
  flock.run();
  
}

void mouseDragged() {
  flock.addBoid(new Boid(mouseX, mouseY));
}
  
class Boid {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;
  
  Boid(float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1), random(-1,1));
    location = new PVector(x,y);
    r = 3.0;
    maxspeed = 3;
    maxforce = 0.05;
  }
  
  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    render();
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);
    PVector ali = align(boids);
    PVector coh = cohesion(boids);
    sep.mult(1);
    ali.mult(1);
    coh.mult(2);
    
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    return steer;
  }
  
  void render() {
    float theta = velocity.heading2D() + radians(30);
    fill(255);
    stroke(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*20);
    vertex(-r, r*60);
    vertex(r, r*20);
    endShape();
    popMatrix();
  }
void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
  
  //method for checking and steering
  
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location,other.location);
      if ((d < 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(location,other.location);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }
    if (count < 0) {
      steer.div((float)count);
    }
    if (steer.mag() > 0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location,other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum,velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0,0);
    }
  }
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0,0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location,other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the location
    } else {
      return new PVector(0,0);
    }
  }
}
    
    
class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

}


