
/*
Dogs - a Processing sketch by Chris Mealing
January 5, 2013

A program based on the PVector tutorial at http://processing.org/learning/pvector/

Left mouse to start and stop movement.
Right mouse to target the mouse, or return to the initial locations
*/


int numChasers = 12;
boolean active = false;
boolean mouse = true;
PVector tgt;

Chaser[] chasers;  // array to hold the dogs

void setup() {
  size(1200, 800);
  chasers = new Chaser[numChasers]; 
  for (int i = 0; i < numChasers; i++) {
    chasers[i] = new Chaser(random(width), random(height), 0, 0);
  }
}


void draw() {
  background(255);
  noStroke();
  tgt = new PVector(mouseX, mouseY);  // mouse location
  for (int i = 0; i < numChasers; i++) {
    if (!mouse) {
      tgt = chasers[i].origin;
    }
    chasers[i].track(tgt);
    if (active == true) {
      chasers[i].move();
    }
    chasers[i].display();
  }
}


void mousePressed() {
  // LEFT button toggle simulation active
  if (mouseButton == LEFT) {
    if (active) {
      active = false;
    } else {
      active = true;
    }
  }
  // RIGHT button toggle between target as mouse or initial point
  if (mouseButton == RIGHT) {
    if (mouse) {
      mouse = false;
    } else {
      mouse = true;
    }
  }
}
class Chaser {
  // class variables
  float dia = 16;
  float closingRadius = 5 * dia;
  float rebound = 0.75;
  float nomMaxSpd = 10;
  float nomMaxAcc = 0.3;
  float nomBrakingRate = 0.10;  // percentage of velocity to scrub
  float variance = 0.20;
  // object parameters
  PVector origin, position, velocity, acceleration, facing;
  float maxSpd, maxAcc, brakingRate;
  float tgtDist;
  color clr;
    
  
  Chaser (float x_, float y_, float vx_, float vy_) {
    origin = new PVector(x_, y_);  // retain the original position
    position = origin.get();
    velocity = new PVector(vx_, vy_);
    acceleration = new PVector(0, 0);
    facing = new PVector(1,0);
    maxSpd = nomMaxSpd * random(1 - variance, 1+ variance);
    maxAcc = nomMaxAcc * random(1 - variance, 1+ variance);
    brakingRate = nomBrakingRate * random(1 - variance, 1+ variance);
    clr = color(0,random(128),random(255));
  }
  
  
  /*
  method to track target and calculate appropriate acceleration */
  void track(PVector target){
    /*
    find target */
    PVector targetDir = PVector.sub(target, position);  // direction to mouse
    targetDir.normalize();  // unitize direction vector
    tgtDist = PVector.dist(target, position);
    float tgtAngle = PVector.angleBetween(velocity, acceleration);
    /*
    adjust facing 
    Chaser looks towards target, even if its velocity isn't in the targets direction 
        Could use: 
          float facingAngle = targetDir.heading() - facing.heading();
          facing.rotate(facingAngle);
        but processing.js implementation of PVector doesn't recognize .heading() or .rotate()
        so I wrote heading() and rotateV()
    */
    float facingAngle = heading(targetDir) - heading(facing);
    rotateV(facing, facingAngle);
    /*
    calculate desired acceleration towards target */
    acceleration = targetDir.get();  // set acceleration vector towards mouse
    acceleration.mult(maxAcc);  // set nominal acceleration magnitude
    /*
    check braking - if target is close, or behid, start slowing down by scrubbing velocity */
    if ((tgtDist < closingRadius) || (abs(tgtAngle) > PI/2)) {
      PVector braking = velocity.get();  // need to use .get() to return a copy!
      braking.normalize();  // now a vector representing current velocity direction
      braking.mult(-brakingRate * velocity.mag());
      acceleration.add(braking);
    }
  }
    
    
  void move(){
    /* 
    update velocity */
    velocity.add(acceleration);  // change velocity
    velocity.limit(maxSpd);  // limit velocity
    /*
    but... if at object, then stop */
    if ((tgtDist < 0.10 * dia) && (velocity.mag() < 0.10 * maxSpd)) {
      velocity.mult(0);
    }
    // calculate new position and check edges
    position.add(velocity);  
    edges();
  }
 
 
  void edges() {
    if ((position.x < 0) || (position.x > width)) {
      velocity.x *= -rebound;
    }
    if ((position.y < 0) || (position.y > height)) {
      velocity.y *= -rebound;
    }
  }
  
  void display() {
    fill(clr);
    pushMatrix();
    translate(position.x, position.y);
    rotate(heading(facing));
    triangle(dia, 0, 0, dia / 4, 0, -dia/4);
    ellipse(0, 0, dia, dia);
    popMatrix();
  }
  

  // function to accomplish PVector.heading() [not avaiable in Processing.js]  
  float heading(PVector vector) {
    return atan2(vector.y, vector.x);
  }
  
  // function to accomplish PVector.rotate() [not avaiable in Processing.js]
  void rotateV(PVector vector, float ang) {
    float oldAng = heading(vector);
    float newAng = oldAng + ang;
    float r = vector.mag();
    float x = r * cos(newAng);
    float y = r * sin(newAng);
    vector.set(x, y, 0);
  }
  
}


