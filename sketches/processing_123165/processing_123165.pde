
import processing.pdf.*;

boolean record;

color circleColor = color(0);
int circleAlpha = 180;

Flock flock;

static float boidHeight = 10.0;
static float boidWidth = 10;

void setup() {
  size(640, 640);
  flock = new Flock();
  // Anzahl Boids
  for (int i = 0; i < 150; i++) {
    flock.addBoid(new Boid(width/2, height/2));
  }
}

void draw() {
  if (record) {
    beginRecord(PDF, "ficken-####.pdf");
  }
  background(255);
  flock.run();

  if (record) {
    endRecord();
    record = false;
  }
}

// Neuer Bpoid
void mousePressed() {
  flock.addBoid(new Boid(mouseX, mouseY));
}




class Flock {
  ArrayList<Boid> boids; // (alle boids)

  Flock() {
    boids = new ArrayList<Boid>();
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }
}


// Use a keypress so thousands of files aren't created
void keyPressed() {
  if (key == 'r') {
   record = true;
  }
}

class Boid {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // LENKEN
  float maxspeed;    // GESCHWINDIGKEIT

  Boid(float x, float y) {
    acceleration = new PVector(0, 0);

    // JS

    float angle = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle));

    location = new PVector(x, y);
    r = 2.0;
    maxspeed = 2;
    maxforce = 0.03;
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

  // drei Regeln:
  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    // Kräfte
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    // Beschleunigung
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }

  // Update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit Geschwindigkeit
    velocity.limit(maxspeed);
    location.add(velocity);

    acceleration.mult(0);
  }

  // Lenekn in eine bestimmte Richtung

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);  // Vector, der in die richtung zeigt
    // Vector Skaliert zu Geschwindigkeit
    desired.normalize();
    desired.mult(maxspeed);


    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  
    return steer;
  }

  void render() {
    // Zeichne den Boid
    float theta = velocity.heading2D() + radians(90);


    //fill(50, 255);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    //rotate(-(float)atan2(-velocity.y, velocity.x));
    ellipse(-boidHeight/1.0, boidWidth/1.0, boidHeight/1.0, -boidWidth/1.0);
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }

  // Separation
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // check alle boids auf distanz
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);

      if ((d > 0) && (d < desiredseparation)) {
        // errechne die neue richtung, weg vom boid
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // stärke mit Distanz
        steer.add(diff);
        count++;            // wie viele merken
      }
    }
    // durchschnitt
    if (count > 0) {
      steer.div((float)count);
    }

    // so lange größer als 0
    if (steer.mag() > 0) {


      //  Reynolds: Steering = Desired - Velocity   !!!!!
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);


      // Reynolds: Steering = Desired - Velocity   !!!!! 
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } 
    else {
      return new PVector(0, 0);
    }
  }

  // Cohesion

  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Beginne mit leerem Vector
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location); // Locatiion wissen
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // lenke zur Location
    } 
    else {
      return new PVector(0, 0);
    }
  }
}
