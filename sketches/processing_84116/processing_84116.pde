
int numParticles = 80;
float particleDistance = 5;
float restLength = 5;
ArrayList<Particle> ptz = new ArrayList<Particle>();
ArrayList<Particle> beans = new ArrayList<Particle>();
PVector gravity = new PVector(0, 2);
float breakDist = 9;
void setup() {
  size(800, 600);
  noFill();
  for (int i = 0; i < numParticles; i++) {
    ptz.add(new Particle(ptz.size(),new PVector(width*0.5 - numParticles*particleDistance*0.5 + particleDistance*i, height*0.2), 5, 0.5));
    ptz.get(i).breakFactor = 1+ 0.5*abs(numParticles*0.5 - i);
  }
  ptz.get(0).fixed = true;
  ptz.get(ptz.size()-1).fixed = true;

  for (int i = 0; i < ptz.size();i++) {
    if (i == 0) ptz.get(i).setNeighbours(0, 1);
    else if (i == ptz.size()-1) ptz.get(i).setNeighbours(ptz.size()-2, ptz.size()-1);
    else ptz.get(i).setNeighbours(i-1, i+1);
  }
}
void draw() {
  background(255);
  //  for (int i = 0; i < ptz.size()-1; i++) {
  //    ptz.get(i).react(ptz.get(i+1).pos);
  //    ptz.get(i+1).react(ptz.get(i).pos);
  //  }
  for (int i = 0; i < ptz.size(); i++) {
    ptz.get(i).reactNeighbours();
  }
  for (int i = 0; i < ptz.size(); i++) {
    ptz.get(i).addForce(gravity);
  }
  for (int i = 0; i < ptz.size(); i++) {
    ptz.get(i).update();
  }
//  for (int i = 0; i < ptz.size()-1; i++) {
//    line(ptz.get(i).pos.x, ptz.get(i).pos.y, ptz.get(i+1).pos.x, ptz.get(i+1).pos.y);
//  }
  for (int i = 0; i < beans.size(); i++) {
    beans.get(i).addForce(gravity);
  }
  for (int i = 0; i < beans.size(); i++) {
    beans.get(i).addForce(gravity);
  }
  for (int i = 0; i < beans.size(); i++) {
    for (int j = 0; j < beans.size(); j++) {
      beans.get(i).reactDist(beans.get(j).pos, beans.get(j).sz);
      beans.get(j).reactDist(beans.get(i).pos, beans.get(i).sz);
    }
  }
  for (int i = 0; i < beans.size(); i++) {
    for (int j= 0; j < ptz.size(); j++) {
      beans.get(i).reactDist(ptz.get(j).pos, ptz.get(j).sz);
      ptz.get(j).reactDist(beans.get(i).pos, beans.get(i).sz);
    }
  }
  for (int i = 0; i < ptz.size(); i++) {
    ptz.get(i).move();
    ptz.get(i).drawNeighLine();
    ptz.get(i).draw();
  }
  for (int i = 0; i < beans.size(); i++) {
    beans.get(i).update();
    beans.get(i).move();
    beans.get(i).draw();
  }
}
class Particle {
  PVector newPos, pos, vel, force;
  boolean fixed = false;
  int n1, n2;
  float sz;
  float stiffness;
  float springForce = 21;
  int selfID;
  float breakFactor = 1;
  Particle(int id,PVector position, float saiz, float stfn) {
    pos = position.get();
    vel = new PVector(0, 0);
    force = new PVector(0, 0);
    newPos = pos.get();
    sz = saiz;
    stiffness = stfn;
    selfID = id;
  }
  void setNeighbours(int neighbour1, int neighbour2) {
    n1 = neighbour1;
    n2 = neighbour2;
  }
  void reactNeighbours() {
    react(ptz.get(n1).pos);
    react(ptz.get(n2).pos);
  }
  void neighbourCheck() {
    Particle p1 = ptz.get(n1);
    float distance = PVector.dist(pos,p1.pos);
    if(distance > breakDist*breakFactor && n1 != 0 && n1 != ptz.size()-2 && n1 != ptz.size()-3) {
      PVector mid = PVector.sub(p1.pos, pos);
        mid.normalize();
        mid.mult(distance*0.5);
        mid.add(pos);
      ptz.add(new Particle(ptz.size(),mid, 5, 0.5));
      n1 = ptz.size()-1;
      p1.n2 = ptz.size()-1;
      ptz.get(ptz.size()-1).setNeighbours(p1.selfID,selfID);
      ptz.get(ptz.size()-1).breakFactor = breakFactor*2;
    }
//    Particle p2 = ptz.get(n2);
//    if(PVector.dist(pos,p2.pos) > breakDist) {
//      ptz.add(new Particle(new PVector((pos.x+p2.pos.x)*0.5,(pos.y+p2.pos.y)*0.5), 5, 0.5));
//      n2 = ptz.size()-1;
//      p2.n1 = ptz.size()-1;
//    }
  }
  void reactDist(PVector other, float otherSZ) {
    PVector newForce = PVector.sub(other, pos);
    float distance = newForce.mag();
    if (distance < sz*0.5+otherSZ*0.5) {
      newForce.normalize();
      //      newForce.mult(distance - restLength);
      newForce.mult(-(sz*0.5+otherSZ*0.5) + distance);
      force.add(newForce);
    }
  }
  void react(PVector other) {
    PVector newForce = PVector.sub(other, pos);
    float distance = newForce.mag();
    newForce.normalize();
    newForce.mult(distance - restLength);
    newForce.mult(springForce);
    force.add(newForce);
  }
  void addForce(PVector external) {

    force.add(PVector.mult(external, stiffness));
  }
  void update() {
    if (!fixed) {
      force.mult(0.1*stiffness);
      vel.add(force);
      vel.mult(0.90);
      newPos.add(vel);
      force = new PVector(0, 0);
    }
    
  }
  void move() {
    pos = newPos.get();
    neighbourCheck();
  }
  void draw() {
    ellipse(pos.x, pos.y, sz, sz);
  }
  void drawNeighLine() {
    line(pos.x,pos.y,ptz.get(n1).pos.x,ptz.get(n1).pos.y);
  }
}
int counta = 5;
void mousePressed() {
 beans.add(new Particle(beans.size()-1,new PVector(width*0.5+random(-50, 50), 100), 60+random(-20,20), 1));
}
