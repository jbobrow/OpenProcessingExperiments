
class Body {
  int SIZE;
  PVector loc = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  float mass = int(random(3, 9));
  float gravity = 0.25;
 
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
 
  void update() {
    boundryCheck();
    vel.add(acc);
    loc.add(vel);
    acc.mult(0); // reset acceleration
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
    // TODO: Change these based on velocity, attraction, or time.
    float mcx = map(mouseX, 0, width, 0, 255);  // mouse color x
    float mcy = map(mouseY, 0, height, 0, 255);  // mouse color y
    //fill(255, 150, 50);
    fill(mcx, 255, 100/mcy);
    rect(loc.x, loc.y+SIZE, SIZE/4, SIZE/2);
    //fill(0, 255, 255);
    fill(mcx/mcy, -mcy, mcx/mcy*12);
    rect(loc.x, loc.y-SIZE/2, SIZE, SIZE/2);
    fill(0);
    ellipse(loc.x + SIZE/2, loc.y + SIZE/2, SIZE*2, SIZE*2);
    fill(#396409);
    ellipse(loc.x + SIZE/2, loc.y + SIZE/2, SIZE, SIZE);
  }
}
 
 
 
 
Body b;
int AMT = 20;
int OLD_AMT = AMT;
int T = 0;
boolean PAUSED = false;
Body[] bodies = new Body[AMT];
 
void setup() {
  size(800, 480);
  smooth();
  background(255);
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
  float mY = map(mouseY, 0, height, 0, 255);
  //float mX = map(mouseX, 0, width, 255, 0);
  //fill(255-mY, 15+mX, 255+mX, 1);
  fill(255-mY, 0, 255,0);
  rect(0, 0, width, height);
  fill(0, 100, 255);
  fill(0);
  for (int i=0; i<AMT; i++) {
    for (int j=0; j<AMT; j++) {
      PVector Gravity = new PVector(0, 0.024);
      Gravity.mult(bodies[i].mass);
      //bodies[i].applyForce(Gravity);
      if (i != j) {
 
        PVector force = bodies[i].attract(bodies[j]);
        float mouse_ctrl = map(mouseY, 0, height, -2, 12);
        mouse_ctrl = constrain(mouse_ctrl, -2, 3);
        force.mult(mouse_ctrl);
 
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

