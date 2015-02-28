
// All learned from Daniel Shiffman's coding tutorials
// and his simulation on flocking

class Tadpole {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxForce;
  float maxSpeed;
  float mass;
  
  Tadpole(PVector tLocation) {
    float a       = random(TWO_PI);
    float b       = random(1.0,2.5);
    acceleration  = new PVector(0,0);
    velocity      = new PVector(cos(a),sin(a));
    location      = tLocation.get();
    mass          = b;
    maxSpeed      = 1.5;
    maxForce      = 0.05;
  }
  
  void run(ArrayList<Tadpole> tads) {
    flock(tads);
    update();
    display();
  }
 
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void flock(ArrayList<Tadpole> tads) {
    PVector sep = separate(tads);
    PVector ali = align(tads);
    PVector coh = cohesion(tads);
    
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    return steer;
  }
  
  void display() {
    float theta = velocity.heading2D() + HALF_PI;
    stroke(0);
    fill(0);
//    fill(30);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    scale(mass*0.2);
    beginShape();
    curveVertex(95,95);
    curveVertex(90,90);
    curveVertex(80,65);
    curveVertex(55,25);
    curveVertex(10,10);
    curveVertex(25,55);
    curveVertex(65,80);
    curveVertex(90,90);
    curveVertex(95,95);
    endShape();
//    rect(0,0,16,16);
    
    popMatrix();
  }
  
  PVector separate (ArrayList<Tadpole> tads) {
    float desiredSeparation = 100.0;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for (Tadpole other : tads) {
      float d = PVector.dist(location, other.location);
      if ((d>0) && (d<desiredSeparation)) {
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }
    if (count>0) {
      steer.div((float)count);
    }
    if (steer.mag()>0) {
      steer.normalize();
      steer.mult(maxSpeed);
      steer.sub(velocity);
      steer.limit(maxForce);
    }
    return steer;
  }
  
  PVector align (ArrayList<Tadpole> tads) {
    float friends = 50;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Tadpole other : tads) {
      float d = PVector.dist(location, other.location);
      if ((d>0) && (d<friends)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if(count>0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxSpeed);
      PVector steer = PVector.sub(sum,velocity);
      steer.limit(maxForce);
      return steer;
    }
    else {
      return new PVector(0,0);
    }
  }
  
  PVector cohesion (ArrayList<Tadpole> tads) {
    float friends = 50;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Tadpole other : tads) {
      float d = PVector.dist(location, other.location);
      if((d>0) && (d<friends)) {
        sum.add(other.location);
        count++;
      }
    }
    if (count>0) {
      sum.div(count);
      return seek(sum);
    }
    else {
      return new PVector(0,0);
    }
  }
  
  boolean isDead() {
    if (location.x<-50 || location.x>width+50 || location.x<-50 || location.y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
class Attractor {
  float strength = 500;
  PVector location;
  float r = 10;
  
  Attractor(float x, float y) {
    location = new PVector(x,y);
  }
  
  void display() {
    stroke(0);
    fill(0);
    ellipse(location.x,location.y,r*2,r*2);
  }
    
  PVector attract(Tadpole t) {
    PVector dir = PVector.sub(location,t.location);
    float d = dir.mag();
    d = constrain(d,5,100);
    dir.normalize();
    float force = strength / (d * d);
    dir.mult(force);
    return dir;
  }
}
class Repeller {
  float strength = 20;
  PVector location;
  float r = 10;
  
  Repeller(float x, float y) {
    location = new PVector(x,y);
  }
  
  void display() {
    stroke(0);
    fill(0);
    ellipse(location.x,location.y,r*2,r*2);
  }
    
  PVector repel(Tadpole t) {
    PVector dir = PVector.sub(location,t.location);
    float d = dir.mag();
    d = constrain(d,5,100);
    dir.normalize();
    float force = -1 * strength / (d * d);
    dir.mult(force);
    return dir;
  }
}
import java.util.Iterator;

class TadpoleSchool {
  ArrayList<Tadpole> tads;
  PVector   origin;
  float     lifespan;

  TadpoleSchool(PVector location) {
    origin    = location.get();
    tads = new ArrayList<Tadpole>();
    lifespan  = 200;
  }

  void addTadpole() {
    if (lifespan>50) {
      tads.add(new Tadpole(origin));
    }
  }

  void run() {
    Iterator<Tadpole> it = tads.iterator();
    while (it.hasNext()) {
      Tadpole t = it.next();
      t.run(tads);
      if (t.isDead()) {
        it.remove();
        lifespan -= 1;
      }
    }
  }
  
  void applyForce(PVector f) {
    for (Tadpole t: tads) {
      t.applyForce(f);
    }
  }
  
  void applyAttractor(Attractor r) {
    for (Tadpole t: tads) {
      PVector force = r.attract(t);
      t.applyForce(force);
    }
  }
  
  void applyRepeller(Repeller r) {
    for (Tadpole t: tads) {
      PVector force = r.repel(t);
      t.applyForce(force);
    }
  }
  
  boolean isDead() {
    if (lifespan < 0.0 && tads.size()==0) {
      return true;
    } else {
      return false;
    }
  }
}
import processing.pdf.*;

boolean record;

ArrayList<TadpoleSchool> schools;

void setup() {
  size(600,600);
  schools = new ArrayList<TadpoleSchool>();
}

void mousePressed() {
  schools.add(new TadpoleSchool(new PVector(mouseX,mouseY)));
}

void draw() {
  if (record) {
    beginRecord(PDF, "frame-####.pdf");
  }
  
  background(255);
  
  for(TadpoleSchool tps: schools) {
    tps.run();
    tps.addTadpole();
  }
  
  Iterator<TadpoleSchool> it = schools.iterator();
  while (it.hasNext()) {
    TadpoleSchool tps = it.next();
    tps.run();
    if (tps.isDead()) {
      it.remove();
    }
  }
  
  if (record) {
    endRecord();
    record = false;
  }
}

void keyPressed() {
  record = true;
}


