
//import processing.serial.*;
//import cc.arduino.*;
//
//Arduino arduino;




Flock flock;

PShape bot;

//  0 to 200
float lineDistance = 100;
float targetLineDistance = 100;

//  0 to 50
float lineAlpha = 0.0;
float targetLineAlpha = 0.0;

//  100 to 0
float separation = 0.0;
float targetSeparation = 0.0;

// timer vars
float timeStamp;

int triggerDistance = 75;
int triggerDistance2 = 400;

void setup() {
  size(700, 550);

//  println(Arduino.list());
  //arduino = new Arduino(this, Arduino.list()[4], 57600);

  flock = new Flock(width/2, height/2, true);
  // Add an initial set of boids into the system
  float boidTotal = 25;
  for (float i = 0; i < boidTotal; i++) {

    float radian = (i/boidTotal)* TWO_PI;
    println("radian:"+ i + ":"+ radian);

    flock.addBoid(new Boid(new PVector(cos(radian)*100, sin(radian)*100), 10.0, 0.05));
  }


}

void draw() {
  background(100);
  flock.run();

  // int distance = arduino.analogRead(1);
  int distance = mouseX;
  

  println(abs(targetLineDistance - lineDistance));


if(distance < triggerDistance || distance>triggerDistance2)
//  if (distance < triggerDistance)
                            {

    if (flock.atEase == true) {
      // do this thing one time only
      flock.x=width/2 + random(-width*.3, width*.3);
      flock.y=height/2 + random(-height*.2, height*.2);
    }

    bringFlockHome();
  } 
  else {
    makeFlockAtEase();
  }

  // line alpha chaser
  lineAlpha += (targetLineAlpha - lineAlpha) * .005;

  // separation chaser .01 is very slow. .3 is extremely fast
  separation += (targetSeparation - separation) * .005;

  // lineDistance chaser 
  lineDistance += (targetLineDistance - lineDistance) * .002;
  
  // when to scare the flock
  if (abs(targetLineDistance - lineDistance) < 35 && flock.atEase == false) {
     scareFlock(); 
  }
  
  
//  draw the box that shows lineDistance
//  fill(255, 0, 0);
//  ellipse(lineDistance, 100, 5, 5);

  // connect the boids
  if (lineAlpha > 1) {
    connectBoids();
  }
  
  
  // check the timer
  if (flock.hide == true) {
      if (millis() - timeStamp > 5000) {
         // 5 seconds have passed
         if (distance > triggerDistance) {
           flock.hide = false; 
         }
      }
    
  }
  
  
}


void makeFlockAtEase () {
  flock.atEase=true;
  targetLineAlpha = 0;
  targetSeparation = 100.0;
  separation = 100.0; // hard reset of separation
  targetLineDistance = 0;
  lineDistance = 100; // hard reset of lineDistance
}

void bringFlockHome () {
  flock.atEase = false;
  targetLineAlpha = 50;
  targetSeparation = 0.0;
  targetLineDistance = 200;
}

void scareFlock () {
  flock.hide = true;
  makeFlockAtEase();
  timeStamp = millis();
}


// Add a new boid into the System
void mousePressed() {
  //flock.hide = !flock.hide;
}

void connectBoids() {


  for (int i = flock.boids.size()-1; i >=0; i--) {
    Boid b = (Boid) flock.boids.get(i);

    for (int j = flock.boids.size()-1; j >=0; j--) {
      Boid bb = (Boid) flock.boids.get(j);

      if (b != bb) {
        if (b.loc.dist(bb.loc) < lineDistance) {
    // color of line
          stroke(255, lineAlpha);
          noFill();
          line(b.loc.x, b.loc.y, bb.loc.x, bb.loc.y);
        }
      }
    }
  }
}

// The Boid class

class Boid {


  PVector loc;
  PVector vel;
  PVector acc;
  PVector myHome;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float maxspeedMod;  // mod for max speed
  float currentMaxspeed;
  float size;



  Boid(PVector initialHome, float ms, float mf) {
    acc = new PVector(0, 0);
    vel = new PVector(random(-1, 1), random(-1, 1));
    loc = new PVector(random(800), random(600));
    myHome = new PVector(initialHome.x, initialHome.y);
    r = 5.0;
    maxspeedMod = 1;
    maxspeed = ms;
    maxforce = mf;
    size = random(1,10);
   
  }

  void run(ArrayList boids) {

    flock(boids);
    update();
    borders();

    render();
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    PVector home = findHome(boids);  // Home
    // Arbitrarily weight these forces

      if (flock.hide == false) {
      // not hiding. do one or the other of these
      if (flock.atEase) {
        sep.mult(1.0);
        ali.mult(0.1);
        coh.mult(1.0);
        home.mult(0.0);
      } 
      else {
        sep.mult(separation);
        ali.mult(0.01);
        coh.mult(20.0);
        home.mult(20.0);
      }
    } 
    else {
      // run and hide
      sep.mult(500);
      ali.mult(0.01);
      coh.mult(20.0);
      home.mult(0.0);
    }
    // Add the force vectors to acceleration

    acc.add(sep);
    acc.add(ali);
    acc.add(coh);
    acc.add(home);
  }

  // Method to update location
  void update() {

    // Update velocity
    vel.add(acc);
    // Limit speed
    if (flock.atEase) {
      if (maxspeedMod < 20) {
        maxspeedMod+=.1;
      }
    } 
    else {
      maxspeedMod = 1;
      PVector homeVector = new PVector(flock.x, flock.y);
      if ( loc.dist(homeVector) <10) {
        maxspeedMod=5;
      };
    }



    vel.limit(maxspeed/maxspeedMod);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void seek(PVector target) {
    acc.add(steer(target, false));
  }

  void arrive(PVector target) {
    acc.add(steer(target, true));
  }

  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown) {
    PVector steer;  // The steering vector
    PVector desired = target.sub(target, loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0)) desired.mult(maxspeed*(d/100.0)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = target.sub(desired, vel);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0, 0);
    }
    return steer;
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + PI/2;

    pushMatrix();

    // move and rotate
    translate(loc.x, loc.y);
    rotate(theta);

    // draw
    //shape(bot, 0, 0);
    fill(255, 100);
    ellipse(0, 0, size, size);


    popMatrix();
  }

  // Wraparound
  void borders() {
    if (flock.hide == false) {
      if (loc.x < -r) loc.x = width+r;
      if (loc.y < -r) loc.y = height+r;
      if (loc.x > width+r) loc.x = -r;
      if (loc.y > height+r) loc.y = -r;
    }
  }


  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList boids) {
    float desiredseparation = 40.0;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc, other.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc, other.loc);
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
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList boids) {
    float neighbordist = 25.0;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc, other.loc);
      if ((d > 0) && (d < neighbordist)) {
        steer.add(other.vel);
        count++;
      }
    }
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList boids) {
    float neighbordist = 25.0;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = loc.dist(other.loc);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.loc); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      return steer(sum, false);  // Steer towards the location
    }
    return sum;
  }

  // Home
  // Calculate steering vector towards home
  PVector findHome (ArrayList boids) {
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    PVector homeVector = new PVector(flock.x + myHome.x, flock.y + myHome.y);
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = loc.dist(homeVector);
      if (d > 0) {
        sum.add(homeVector.get()); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      return steer(sum, false);  // Steer towards the location
    }
    return sum;
  }
}

// The Flock (a list of Boid objects)

class Flock {
  ArrayList boids; // An arraylist for all the boids

  float x;
  float y;
  boolean atEase;
  boolean hide;

  Flock (float startX, float startY, boolean startEase) {
    x = startX;
    y = startY;
    atEase = startEase;
    boids = new ArrayList(); // Initialize the arraylist
  }

  void run() {
    for (int i = 0; i < boids.size(); i++) {
      Boid b = (Boid) boids.get(i);  
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
    
    // draw a circle in the middle of the flock
//    fill(255);
//    ellipse(x, y, 10, 10);
    
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

}









