
import controlP5.*;

color circleColor = color(0);
int circleAlpha = 180;

Flock flock;

ControlP5 cp5;
Slider DESIREDSEPARATION;

static float boidHeight = 10.0;
static float boidWidth = 10;

int lastObj = 0;

void setup() {
  size(600, 600);
  flock = new Flock();
  // Anzahl Boids
  for (int i = 0; i < 200; i++) {
    flock.addBoid(new Boid(width/2, height/2));
  }
    gui();
}

void draw() {

  background(255);
  flock.run();

}

// Neuer Bpoid
void mousePressed() {
  flock.addBoid(new Boid(mouseX, mouseY));
}
  
 int nextY(int offset) {
  lastObj+=offset;
  return lastObj;
}
   
  void gui() {
  cp5 = new ControlP5(this);
 
  cp5.setColorLabel(color(0));
  
  int sliderLength = 150;
  
  DESIREDSEPARATION = cp5.addSlider("desired separation")
    .setPosition(10,nextY(15))
    .setSize(sliderLength,10)
    .setRange(5,100)
    .setValue(50);
    
  }
class Boid {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // LENKEN
  float maxspeed;    // GESCHWINDIGKEIT

  float desiredSeparation = 300.0;


  Boid(float x, float y) {
    acceleration = new PVector(0, 0);

    // JS

    float angle = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle));

    location = new PVector(x, y);
    r = 2.0;
    maxspeed = 1;
    maxforce = 0.03;
  }

  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    render();
  }

  void parameters() {
    desiredSeparation = DESIREDSEPARATION.getValue();
  }

  void applyForce(PVector force) {

    acceleration.add(force);
  }

  // drei Regeln:
  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    PVector avd = avoidWalls(); // Borders
    // Kräfte
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    avd.mult(10);
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
    if (location.x < -2*r) location.x = width+2*r;
    if (location.y < -2*r) location.y = height+2*r;
    if (location.x > width+2*r) location.x = -2*r;
    if (location.y > height+2*r) location.y = -2*r;
  }

  // Separation
  PVector separate (ArrayList<Boid> boids) {

    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      PVector relative = PVector.sub(location, other.location);
      float distance = relative.mag();
      if ((d > 0) && (d < desiredSeparation)) {
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

    // raynalds steering = desired - vel
    if (steer.mag()>0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }



  PVector avoidWalls() {
    PVector steer = new PVector(0, 0, 0);
 
    float desiredOffset = 20;

    if (location.x < desiredOffset) steer.x = 1;
    if (location.x > width-desiredOffset) steer.x = -1;
    if (location.y < desiredOffset) steer.y = 1;
    if (location.y > height-desiredOffset) steer.y = -1;

    if (steer.mag()>0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown) {
    PVector steer;  // The steering vector
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0f)) desired.mult(maxspeed*(d/100.0f)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0, 0);
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



