
// stylised fish  animation
// Nature of Code.
// Ch 1 & Ch6 vector movement 
// Ch 3 oscillation
// Ch 4 particle systems

Vehicle[] vehicles;
RippleGenerator  ripples;
int numFish;

void setup() {
  size(1000, 500);
  ripples = new RippleGenerator(width+250, height/2);
  numFish = 10;
  vehicles = new Vehicle[numFish];
  for (int i = 0; i < numFish; i++) {
    vehicles[i] = new Vehicle(random(100,width), random(100,height));
  }
}

void draw() {
  frameRate(30);
  background(#200A89);
  for ( Vehicle v : vehicles) {
    v.run();
  }
  ripples.run();
}

class Fish {  
  int numSegs; 
  float angle, size, amplitude, period, y, y2, xWdth;
  PVector[] segPositions; 
  Vector2D vec; 
  PVector dxdy;

  Fish() {
    xWdth = 2;
    size = 8;
    numSegs = 20;
    vec = new Vector2D();
    segPositions = new PVector[numSegs];
    for (int i = 0; i < numSegs; i++) {
      segPositions[i] = new PVector(0, 0);
    }
  }

  void display( PVector pos, float speed) {
    moveAndDisplaySegs(0, pos, speed);
    for (int i = 0; i < numSegs-1; i++) {
      moveAndDisplaySegs(i+1, segPositions[i], speed);
    }
  }

  // this approach to vector projection from John Resig's
  //    'Snake' on the Processing.js 'Learning' page
  void moveAndDisplaySegs(int i, PVector pos, float speed) {
    dxdy = PVector.sub(pos, segPositions[i]);
    angle = dxdy.heading2D(); 
    segPositions[i] = PVector.sub(pos, vec.radDist(angle, size));

    pushMatrix();
    translate(segPositions[i].x, segPositions[i].y);
    rotate(angle);
    period = map(speed, .5, 7, 80, 5);

    fill(255);
    stroke(255);
    strokeWeight(1);
    rectMode(CENTER);
    ellipseMode(CENTER);

    switch(i) {
    case 0: 
      arc(-4, 0, 45, 20, radians(-70), radians(70));
      fill(#200A89);
      ellipse(6, -5, 7, 5);
      ellipse(6, 5, 7, 5);
      break;
    case 1: 
      line(0, 0, size, 0);
      rect(0, 0, xWdth, 22); 
      break;
    case 2: 
      line(0, 0, size, 0);
      rect(0, 0, xWdth, 25);
      break;
    case 3: 
      line(0, 0, size, 0);
      rect(0, 0, xWdth, 27);
      break;
    case 4: 
      line(0, 0, size, 0);
      rect(0, 0, xWdth, 27);
      break;
    case 5:
      line(0, 0, size, 0); 
      rect(0, 0, xWdth, 26);
      break;
    case 6: 
      line(0, 0, size, 0);
      rect(0, 0, xWdth, 24);
      break;
    case 7: 
      line(0, 0, size, 0);
      rect(0, 0, xWdth, 22);
      break;
    case 8: 
      line(0, 0, size, 0);
      rect(0, 0, xWdth, 20);
      break;
    case 9: 
      line(0, 0, size, 0);
      rect(0, 0, xWdth, 18 );
      break;
      // increase the amplitude,
      // and increment the oscillation cycle position,
      // as we move along the tail   
    case 10: 
      amplitude =  .5;
      //            or  sin(someIncrementingNumber)
      y = amplitude * sin(TWO_PI * (frameCount/period));
      line(0, y, size, 0);
      rect(0, y, xWdth, 16 );
      break;
    case 11: 
      amplitude =   1;
      y2 = amplitude * sin(TWO_PI * (0.01 + (frameCount/period)));
      line(0, y2, size, y);
      rect(0, y2, xWdth, 14 );
      break;
    case 12: 
      amplitude =  2;
      y = amplitude * sin(TWO_PI * (0.02 + (frameCount/period)));
      line(0, y, size, y2);
      rect(0, y, xWdth, 12 );
      break;
    case 13: 
      amplitude =  3;
      y2 = amplitude * sin(TWO_PI * (0.03 + (frameCount/period)));
      line(0, y2, size, y);
      rect(0, y2, xWdth, 10);
      break;
    case 14: 
      amplitude =  4;
      y = amplitude * sin(TWO_PI * (0.04 + (frameCount/period)));
      line(0, y, size, y2);
      rect(0, y, xWdth, 8);
      break;
    case 15: 
      amplitude =   5;
      y2 = amplitude * sin(TWO_PI * (0.05 + (frameCount/period)));
      line(0, y2, size, y);
      rect(0, y2, xWdth, 6);
      break;
    case 16: 
      amplitude =  6;
      y = amplitude * sin(TWO_PI * (0.06 + (frameCount/period)));
      line(0, y, size, y2);
      rect(0, y, xWdth, 4 );
      break;
    case 17: 
      amplitude =  7;
      y2 = amplitude * sin(TWO_PI * (0.07 + (frameCount/period)));
      line(0, y2, size, y);
      rect(0, y2, xWdth, 3);
      break;
    case 18: 
      amplitude =   8;
      y = amplitude * sin(TWO_PI *(0.08 + (frameCount/period)));
      line(0, y, size, y2);
      rect(0, y, xWdth, 2);
      break;
    case 19: 
      stroke(255);
      strokeWeight(1);
      amplitude =  14 ;
      y2 = amplitude * sin(TWO_PI * (0.09 + (frameCount/period)));
      line(-12, y2, 8, y);
      break;
    }
    popMatrix();
  }
}

class RippleGenerator {
  ArrayList<Particle> particles;
  PVector pos;

  RippleGenerator(float x, float y) {
    pos = new PVector(x,y);
    particles = new ArrayList<Particle>();
  }

  void run() {
    // limit particle generation frequency
    if (frameCount % 100 == 0) {
      particles.add(new Particle(pos));
    }
    for (int i = particles.size ()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

class Particle {
  PVector pos;
  PVector vel;
  PVector accel;
  float lifespan;
  color c;
  float diam;

  Particle(PVector l) {
    accel = new PVector();
    vel = new PVector();

    pos = l.get();
    lifespan = 255.0;
    c = color(#E1F6F7);
    diam = 500;
  }

  void run() {
    move();
    display();
  }

  void move() {
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
    lifespan -= .2;
    diam += 1;
  }

  void display() {
    noFill();
    stroke(c,lifespan);
    strokeWeight(1);
    ellipse(pos.x,pos.y,diam,diam);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}


// polar implementation for use in Js mode

static class Vector2D {
  static PVector degDist(float angDeg, float distance) {
    float theta = radians(angDeg);
    float dx = distance * cos(theta);
    float dy = distance * sin(theta);
    PVector v = new PVector(dx, dy);
    return v;
  }
  static PVector radDist(float angRad, float distance) {
    float dx = distance * cos(angRad);
    float dy = distance * sin(angRad);
    PVector v = new PVector(dx, dy);
    return v;
  }
}

class Vehicle {
  Vector2D   vec;
  Fish fish;
  PVector vel, pos;
  int randNum;
  float speed;

  Vehicle(float x, float y) {
    vec = new Vector2D();
    fish = new Fish();
    pos = new PVector(x, y); 
    vel = vec.degDist(random(-20, 20), random(.5, 7));
  }


  void dirChangeRandom() {
    randNum = int(random(50, 200));
    if (frameCount % randNum == 0) {
      vel.y = random(-3, 3);
      vel.normalize();
      if (speed < 3.5) vel.mult(random(.3, 7));
      else vel.mult(random(1.5, 7));
    }
  }

  void update() {
    speed = vel.mag();
    pos.add(vel);
  }

  void display() {
    fish.display(pos, speed);
  }

  void boundsCheck() {
    if (pos.x > width +220) {
      pos.x = -250;
      if (vel.y == 0) vel.y = .1; // stop fish swimming backwards
    }
    if (pos.y > height+200 ) { 
      vel.y = -1;
    }
    if (pos.y < -200 ) {
      vel.y = 1;
    }
  }

  void run() {
    update();
    boundsCheck();
    dirChangeRandom();
    display();
  }
}



