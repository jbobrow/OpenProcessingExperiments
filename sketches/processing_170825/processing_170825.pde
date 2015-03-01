
// From Daniel Shiffman's "Nature of Code".
// Add an animated rocket to Craig Reynolds' seeking 
// behaviour described in Ch6

Vehicle rocket; 
Satellite sputnik ;

void setup() {
  size(800, 500, P2D);
  rocket = new Vehicle(width/2,height/2);
  sputnik = new Satellite(width/2, height/2);
}

void draw() {
  background(#320D8B);
  sputnik.run();
  rocket.chase(sputnik);
}

class Vehicle {
  DrawRocket rocket;
  PVector pos, accel, vel;
  float maxSpeed, maxForce, angle, dist, m;

  Vehicle(float x, float y) {
    rocket = new DrawRocket();
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    maxSpeed = 1;
    maxForce = 0.01;
  } 

  void applyForce(PVector f) {
    accel.add(f);
  }
  
  //  the desired  dxdy  = target position - current position
  void chase(Satellite sputnik) {
    PVector desired = PVector.sub(sputnik.pos, pos);  // vec  from vehicle  pos to  target pos
    dist = desired.mag(); //measure how far away we are
    desired.normalize();  
    if (dist < 100) { // slow down
      m = map(dist, 0, 100, 0, maxSpeed);
      desired.mult(m);
    } else {
      desired.mult(maxSpeed); // continue at maxSpeed
    }
    // steer = desired velocity  - current velocity  (include vehicles vel in calcs)
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);  // limit to only a  gradual change in heading
    applyForce(steer); // add steer to vel
    update();
    display(); 
  }

  void update() {
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
  }

  void display() {
    angle = vel.heading2D() + HALF_PI;
    translate(pos.x, pos.y);
    rotate(angle);
    rocket.display();
  }
}



// keep the rocket drawing separate from the movement sums
class DrawRocket {  
  int posX, posY; 
  float  trailG, trailA;
  color trail1Col, trail2Col;

  DrawRocket() { 
    posX = 0;
    posY = 0;
  }

  void drawBody() {
    stroke(0); 
    strokeWeight(1.3); 
    fill(color(#FF1A35));
    arc( posX, posY+20, 40, 30, radians(135), radians(405)); // tail
    ellipse( posX, posY, 20, 40); // fuselage
    fill(color(210));
    arc( posX, posY-26, 12, 10, radians(135), radians(410)); // window
    fill(color(90));
    quad( posX+13, posY+31, posX-13, posY+31, posX-9, posY+40, posX+9, posY+40); // exhaust 
    line( posX, posY+20, posX, posY-36); // line down middle
  }

  // animate the exhaust trail
  void trailFlashDisplay() {
    noStroke();
    trailG = random (157, 255); 
    trailA = random (255);
    trail1Col = color(20, trailG, 255, trailA);
    fill(trail1Col);
    triangle(posX+8, posY+41, posX-8, posY+41, posX, posY+200);
    trail2Col = color(255, 200, 0, trailA);
    fill(trail2Col);
    triangle( posX+4, posY+41, posX-4, posY+41, posX, posY+150);
    stroke(#FA0D20);
    strokeWeight(0.6);
    line( posX, posY+41, posX, posY+70);
  }

  void display() {
    drawBody();
    trailFlashDisplay();
  }
}

class Satellite {
  PVector pos;
  PVector vel;
  int rad, x, y, randNum, alpha;
  float angle;


  Satellite(int x, int y) {
    pos = new PVector(x, y); 
    vel = new PVector(random(-3, 3), random(-3, 3));
    rad = 10;
    randNum = int(random(300, 500));
    alpha = 255;
  }

  void update() {
    pos.add(vel);
  }

  void display() {
    pushMatrix();
    angle = vel.heading2D() + HALF_PI;
    translate(pos.x, pos.y);
    rotate(angle);
    beginShape();
    stroke(200);
    line(-rad, 0, -rad*2, rad*2);
    line(rad, 0, rad*2, rad*2);
    ellipseMode(RADIUS);
    noStroke();
    ellipse(0, 0, rad, rad);
    endShape();
    popMatrix();
  }

  void changeColour() {
    alpha -= 10;
    if (alpha <= 0) {
      alpha = 255;
    }
    fill(200, alpha);
  }

  void directionChangeRandom() {
    if (frameCount % randNum == 0) {
      vel.set(random(-4, 4), random(-4, 4));
    }
  }

  void boundsCheck() {
    if ((pos.x > width - rad) || (pos.x < 0 + rad)) {
      vel.x = vel.x * -1;
    }
    if ((pos.y > height - rad) || (pos.y < 0 + rad)) {
      vel.y = vel.y * -1;
    }
  }

  void run() {
    update();
    boundsCheck();
    directionChangeRandom();
    changeColour();
    display();
  }
}



