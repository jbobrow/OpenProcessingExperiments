
/* Boundary Repulsion (Spring 2014, Nature of Code, Wk2 Assignment)
 * by Jaewoong Hwang
 *   Drag and release the ball to sling it  
 *   Invisible force keeps the ball touch edges of the screen
 */


Disk disk;
PVector preMouse;
boolean picked = false;


void setup() {
  size(400, 400);
  disk = new Disk(new PVector(width*0.5, height*0.5));
}


void draw() {
  background(255);

  //text
  fill(0, 127);
  text("Drag and release the ball to sling it", 10, 20);

  //sling line
  if(picked) {
    stroke(0, 255, 255); strokeWeight(2);
    line(preMouse.x, preMouse.y, mouseX, mouseY);
  }

  //main behaviour
  disk.run();
}

void mousePressed() {
  if(disk.isPicked(mouseX, mouseY)) {
    preMouse = new PVector(mouseX, mouseY);
    picked = true;
  } else picked = false;
}

void mouseReleased() {
  if(!picked) return;
  picked = false;
  PVector sling = PVector.sub(new PVector(mouseX, mouseY), preMouse);
  sling.mult(0.1);
  disk.applyForce(sling);
}


class Disk {
  PVector pos;         //position
  PVector vel;         //velocity
  PVector acc;         //acceleration
  float d;             //diameter
  float friction;      //general movement friction
  float repulsionMax;  //maximum repulsive force
  
  Disk(PVector _pos) {
    pos = _pos.get();
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    d = 20;
    friction = 0.9;
    repulsionMax = 100;
  }
  
  void run() {
    update();
    display();
  }
  
  void display() {
    noStroke(); fill(0);
    ellipse(pos.x, pos.y, d, d);
  }
  
  void update() {
    boundaryRepulsion();  //apply repulsive force from boundary
    vel.add(acc);         //apply acceleration
    pos.add(vel);         //apply velocity
    acc.mult(0);          //reset accelaration
    vel.mult(friction);   //apply friction
  }
  
  void boundaryRepulsion() {
    //the repulsive force from boundaries shapes a sort of y=x^17 graph
    float x = map(pos.x, 0, width, 1, -1);
    float y = map(pos.y, 0, height, 1, -1);
    PVector repulse = new PVector(map(pow(x, 17), -1, 1, -repulsionMax, repulsionMax), map(pow(y, 17), -1, 1, -repulsionMax, repulsionMax));
    applyForce(repulse);
  }
  
  void applyForce(PVector force) {  //consider the mass is always 1
    PVector f = force.get();
    acc.add(f);
  }
  
  boolean isPicked(float x, float y) {
    return dist(pos.x, pos.y, x, y) <= d;
  }
}
