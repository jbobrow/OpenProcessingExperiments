
/**
 * Flocking  
 * 
 * 
 * Click the mouse to add a new boid.
 */
import processing.video.*;
Movie water;
//Movie whale;
PImage cave;
PImage tuna;
Flock flock;
PImage[][] imgs = new PImage[2][5];

void setup() {
  size(640, 480);

  tuna = loadImage("fish00.png");
  cave = loadImage("cave.jpg");
  loadImages();
  water = new Movie(this, "underwater.mp4");
  water.loop();

  
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 50; i++) {
    flock.addBoid(new Boid(width/2,height/2,new Fish(imgs)));
  }
}

void draw() {  
  noTint();
  background(101, 248, 252);
  image(water, 0, 0);
  tint(255, 120);
  image(cave, 0, 0);
  noTint();
  tint(41, 171, 226);
  flock.run();
  
   
}

void loadImages() {
  String prefix = new String("fish");
  for(int i = 0; i < 2; i++) {
    for(int n = 0; n < 5; n++) {
      imgs[i][n] = loadImage(prefix + nf(i,1) + nf(n,1) + ".png");
    }
  }
}
  
// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

// Add a new boid into the System
//void mousePressed() {
//  flock.addBoid(new Boid(mouseX,mouseY));
//}
// The Boid class
int imgIdx; // images index, which one to draw from in the array
PImage [] imgArr; // array of images

class Boid {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed    Boid(float x, float y) {
  Fish fish;

  Boid(float x, float y, Fish f) {
    fish = f;
    acceleration = new PVector(0, 0);
    
    // This is a new PVector method not yet implemented in JS
    // velocity = PVector.random2D();

    // Leaving the code temporarily this way so that this example runs in JS
    float angle = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle));

    location = new PVector(x, y);
    r = 2.0;
    maxspeed = 3;
    maxforce = 0.03;
  }

  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    render();
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    PVector mou = mouseCohesion();
    
    // Arbitrarily weight these forces
    sep.mult(1.8);
    ali.mult(1.0);
    coh.mult(1.2);
    mou.mult(1.4);
    
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
    applyForce(mou);
  }
  
  void limitAngle(PVector v) {
    // What's the magnitude?
    float m = v.mag();
    // What's the angle?
    float a = v.heading2D();
    
    
    // Change the angle
    if (a > 0.2 && a < HALF_PI) {
      a = 0.2;
    } else if (a >= HALF_PI && a < 2.9) {
      a = 2.9;
    } else if (a < -0.2 && a > -(HALF_PI)) {
      a = -0.2;
    } else if (a <= -(HALF_PI) && a > -2.9) {
      a = -2.9;
    }
    //println(a);
  
    // Polar to cartesian for the new xy components
    v.x = m * cos(a);
    v.y = m * sin(a);
  }

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    limitAngle(velocity);
    location.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target
    // Scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);

    // Above two lines of code below could be condensed with new PVector setMag() method
    // Not using this method until Processing.js catches up
    // desired.setMag(maxspeed);

    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float ang = degrees(velocity.heading2D()) - 90;
    if (ang < 0) ang += 360;
    if (ang < 180) ang = 180 + ang;
    //println(ang);
    
    fill(200, 100);
    stroke(255);
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(ang));
    fish.display(velocity);
    
//    beginShape(TRIANGLES);
//    vertex(0, -2);
//    vertex(-r, rdShape();
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
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 40.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // First two lines of code below could be condensed with new PVector setMag() method
      // Not using this method until Processing.js catches up
      // steer.setMag(maxspeed);

      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
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
      // First two lines of code below could be condensed with new PVector setMag() method
      // Not using this method until Processing.js catches up
      // sum.setMag(maxspeed);

      // Implement Reynolds: Steering = Desired - Velocity
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

  PVector mouseCohesion() {
    if (mousePressed) {
      return seek(new PVector(mouseX, mouseY));
    } else {
      return new PVector(0,0);
    }
  }
  
  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the location
    } 
    else {
      return new PVector(0, 0);
    }
  }
}

class Fish {
  PImage[][] images;
  int frame;
  int direction, newDirection;
  int fc;
  
  final int LEFT = 0;
  final int RIGHT = 1;
  
  float x;
  float y;
  
  Fish(PImage[][] imgs) {
    images = imgs;
    x = -getWidth()/2;
    y = -getHeight()/2;
    direction = 0;
    frame = 0;
  }

  void display(PVector velocity) {
    if (velocity.x < 0) {
      newDirection = LEFT;
    } else {
      newDirection = RIGHT;
    }
    
    if (newDirection != direction || frame != 0) {
      frame += 1;
    }
    
    if (frame > 12) {
      frame = 0;
      direction = newDirection;
    }
    
    image(images[direction][frame/3], x, y);
  }
  
  int getWidth() {
    return images[0][0].width;
  }
  
  int getHeight() {
    return images[0][0].height;
  }
}
// The Flock (a list of Boid objects)

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



