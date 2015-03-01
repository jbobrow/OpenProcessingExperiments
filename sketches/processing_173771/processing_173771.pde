
class Body {
  int SIZE;
  int C = int(random(0, 255));
  PVector loc = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  float mass = int(random(10, 24));
  float gravity = 0.25;
  float angle = 0;
  float angVel = 0.00;
  float angAccel = 0.0001;


  Body() {
    loc.x = random(0, width);
    loc.y = random(0, height);
    SIZE = int(mass);
  }

  void boundryCheck() {
    if (loc.x >= width || loc.x <= 0) {
      vel.x = -vel.x/2;
    }
    if (loc.y >= height || loc.y <= 0) {
      vel.y = -vel.y/2;
    }
  }
  void updateC() {
    if (C <= 254) {
    C += 1;
    }else{
      C=0;
    }
  }
  
  void update() {
    angle += angVel;
    angVel += angAccel;
    angVel = acc.x/2 + vel.y/12 - acc.y/2;
    boundryCheck();
    vel.add(acc);
    loc.add(vel);
    acc.mult(0); // reset acceleration
    updateC();
  }

  PVector attract(Body mover) {
    PVector force = PVector.sub(loc, mover.loc);
    float dist = force.mag();
    dist = constrain(dist, 5, 25);
    force.normalize();
    float strength = (gravity * mass * mover.mass) / (dist * dist); 
    force.mult(strength);
    return force;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void render() {
    colorMode(HSB);
    fill(C, 255, 255);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    rect(0, 0, SIZE, SIZE, 2);
    popMatrix();
  }
}


Body b;
int AMT = 14;
int OLD_AMT = AMT;
int T = 0;
boolean PAUSED = false;
Body[] bodies = new Body[AMT];

void setup() {
  size(800, 400);
  smooth();
  background(0);
  //frameRate(200);
  noStroke();

  b = new Body();
  for (int i=0; i<AMT; i++) {
    bodies[i] = new Body();
  }
  mouseX = width/2;
  mouseY = width/2;
}

void draw() {
  filter(GRAY);
  //filter(BLUR, 1);
  fill(0, 4);
  rect(0,0,width,height);
  for (int i=0; i<AMT; i++) {
    for (int j=0; j<AMT; j++) {
      //PVector Gravity = new PVector(0, 0.024);
      //Gravity.mult(bodies[i].mass);
      //bodies[i].applyForce(Gravity);
      if (i != j) {
        PVector force = bodies[i].attract(bodies[j]);
        bodies[j].applyForce(force);
      }
      bodies[i].update();
      bodies[i].render();
    }
  }
  T += 1;
}

void mousePressed() {
  if (!PAUSED) {
    PAUSED = true;
    noLoop();
  } else {
    PAUSED = false;
    loop();
  }
}
