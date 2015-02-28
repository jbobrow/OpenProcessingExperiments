
ArrayList<Body> bodies = new ArrayList<Body>();
boolean goHome = true;
float wanderWeight = 0;
float seperateWeight = 0;
float seekWeight = 3;
float gridSize;

void setup() {
  size(640, 640);
  colorMode(HSB);
  rectMode(CENTER);
  gridSize = width / 20;

  for (float x = gridSize/2; x < width; x += gridSize) {
    for (float y = gridSize/2; y < height; y += gridSize) {
      Body b = new Body(x, y, gridSize * .5);
      bodies.add(b);
    }
  }
}

void draw() {
  background(255);
  for (int i = bodies.size() - 1; i >= 0; i--) {
    Body b = bodies.get(i);
    b.run();
  }

  if (mousePressed) { 
    goHome = false;
  }
  else { 
    goHome = true;
  }
}

class Body {
  PVector location, velocity, acceleration, initialLocation;
  PVector wanderVector, seekVector, obstacleVector, hsb;
  float r, maxforce, maxspeed, initialR;
  float wandertheta = 0;
  color c;


  Body(float x, float y, float _r) {
    r = _r;
    initialR = _r;
    location = new PVector(x, y);
    initialLocation = new PVector(x, y);
    maxspeed = 5;//random(1, 2);
    maxforce = .5;//.1;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    hsb = new PVector(random(255), 255, 0);
    c = color(0);
  }

  void update() {

    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    borders();
    acceleration.mult(0);
    float d = location.dist(initialLocation);
    float d2 = location.dist(new PVector(mouseX, mouseY));
    r = map(d, 0, width/2, 2, initialR*2);
    
    hsb.z = map(d, 0, width/2, 0, 255);
    c = color(hsb.x, hsb.y, hsb.z, map(hsb.z, 0, 255, 255, 1));
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    if (velocity.mag() > .01) {
      rotate(velocity.heading2D());
    }
    noStroke();
    fill(c);
    rect(0, 0, r, r);

    popMatrix();
  }

  void run() {
    applyBehaviors();
    update();
    display();
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  void applyBehaviors() {

    wanderVector = wander();
    wanderVector.mult(wanderWeight);
    applyForce(wanderVector);

    PVector sep = separate();
    sep.mult(seperateWeight);
    applyForce(sep);

    if (goHome) {
      arrive(initialLocation);
    } 
    else {
      seekVector = seek(new PVector(mouseX, mouseY));
      seekVector.mult(seekWeight);
      applyForce(seekVector);
    }
  }

  PVector steer(PVector desired) {

    desired.normalize();
    desired.mult(maxspeed);
    PVector steerV = PVector.sub(desired, velocity);
    steerV.limit(maxforce);
    return steerV;
  }


  PVector seekFarthest() {
    float longestDistance = 0;
    Body target = bodies.get(0);
    for (Body b : bodies) {
      if (b != this) {
        float d = location.dist(b.location);
        if (d > longestDistance) { 
          longestDistance = d;
          target = b;
        }
      }
    }
    return seek(target.location);
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    return steer(desired);
  }

  void arrive(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target
    float d = desired.mag();
    // Scale with arbitrary damping within 100 pixels
    if (d < 100) {
      float m = map(d, 0, 100, 0, maxspeed);
      desired.mult(m/2);
    } 
    else {
      desired.mult(maxspeed);
    }

    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
  }

  PVector wander() {
    float wanderR = 30;         // Radius for our "wander circle"
    float wanderD = 80;         // Distance for our "wander circle"
    float change = 0.3;
    wandertheta += random(-change, change); // Randomly change wander theta

    // Now we have to calculate the new location to steer towards on the wander circle
    PVector circleloc = velocity.get();    // Start with velocity
    circleloc.normalize();                 // Normalize to get heading
    circleloc.mult(wanderD);               // Multiply by distance
    circleloc.add(location);               // Make it relative to boid's location
    float h = velocity.heading2D();        // We need to know the heading to offset wandertheta

    PVector circleOffSet = new PVector(wanderR * cos(wandertheta + h), wanderR * sin(wandertheta + h));
    PVector target = PVector.add(circleloc, circleOffSet);
    return seek(target);
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate () {
    float desiredseparation = 25.0f;
    PVector steerV = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Body other : bodies) {
      float d = PVector.dist(location, other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steerV.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steerV.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steerV.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steerV.normalize();
      steerV.mult(maxspeed);
      steerV.sub(velocity);
      steerV.limit(maxforce);
    }
    return steerV;
  }

  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}



