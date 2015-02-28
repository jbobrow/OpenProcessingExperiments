
color[] fish = {#FFDAA2, #FFA42D, #FC3E26, #B04636};

class Fish {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float maxForce;
  float mass;
  float damping;
  boolean boundaries;
  
  Fish () {
    location = new PVector(random(-10,width+10),random(-10,height+10));
    velocity = new PVector(random(-1,1),random(-1,1));
    acceleration = new PVector(0,0);
    maxSpeed = 0.8;
    maxForce = 0.05;
    mass = random(2.5,6);
    damping = 0.92; 
    boundaries = true;
  }
  
  void run(ArrayList<Fish> fishies) {
    flock(fishies);
    update();
    render();
  }
  
  void addForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void flock(ArrayList<Fish> fishies) {
    PVector sep = separate(fishies);
    PVector ali = align(fishies);
    PVector coh = cohesion(fishies);
    
    sep.mult(0.8);
    ali.mult(0.8);
    coh.mult(0.5);
    
    addForce(sep);
    addForce(ali);
    addForce(coh);
  }
  
  void update() {
    handleBoundaries(boundaries);
    velocity.add(acceleration);
    velocity.mult(damping);
    velocity.limit(maxSpeed);
    location.add(velocity);
  }
  
  void handleBoundaries(boolean bound) {
    boundaries = bound;
    if(boundaries) {
      if (location.x>width) velocity.x = -velocity.x;
      if (location.x<0) velocity.x = -velocity.x;
      if (location.y>height) velocity.y = -velocity.y;
      if (location.y<0) velocity.y = -velocity.y;
    }
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxForce);
    return steer;
  }
  
  PVector separate (ArrayList<Fish> fishies) {
    float desiredSeparation = 100.0;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for (Fish other: fishies) {
      float d = PVector.dist(location, other.location);
      if ((d>0) && (d<desiredSeparation)) {
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }
    if(count>0) {
      steer.div((float)count);
    }
    if(steer.mag()>0) {
      steer.normalize();
      steer.mult(maxSpeed);
      steer.sub(velocity);
      steer.limit(maxForce);
    }
    return steer;
  }

  PVector align (ArrayList<Fish> fishies) {
    float friends = 50;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Fish other : fishies) {
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
  
  PVector cohesion (ArrayList<Fish> fishies) {
    float friends = 50;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Fish other : fishies) {
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
  
  void render() {
    float theta = velocity.heading2D() + HALF_PI;
    noStroke();
    
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    scale(0.07 * mass);
    
    if(mass>=4 && mass<4.5) {
      fill(fish[0],230);
    } else if (mass>=4.5 && mass<5) {
      fill(fish[1],230);
    } else if (mass>=5.0 && mass<5.5) {
      fill(fish[2],230);
    } else {
      fill(fish[3],230);
    }
    
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
    
    fill(20,100);
    ellipse(18,35,10,10);
    ellipse(35,18,10,10);
    popMatrix();
  }
}
color[] green = {#37DE6A, #63DC90, #A0FAA8};
PVector externalLilly = new PVector(-100,-100);
Lillypad externalLil = new Lillypad(externalLilly.x,externalLilly.y);

class Frog {
  Lillypad lils;
  
  PVector location;
  float mass;
  float theta;
  float angle;
  
  ArrayList<Lillypad> lillies;
  ArrayList<Frog> frogs;
  
  Frog(ArrayList<Lillypad> _lillies, ArrayList<Frog> _frogs) {
    lillies = _lillies;
    frogs = _frogs;
    
    lils = changeLils();
    for (Frog fg: frogs) {
      while(fg != this && fg.location==lils.location) {
        lils = changeLils();
      }
    }
    angle = lils.angle;
    
    location = lils.location;
    mass = random(3,6);
    theta = random(-TWO_PI,TWO_PI);
  }
  
  Lillypad changeLils() {
    if(lillies.size()<1) {
      return externalLil;
    }
    return lillies.get(int(random(lillies.size()-1)));
  }
  
  Lillypad validLilly() {
    Lillypad sampleLil = changeLils();
    if(lillies.size()<3) {
      sampleLil = new Lillypad(externalLilly.x,externalLilly.y);
    }
    else {
      for (Frog fg: frogs) {
        while(fg != this && fg.location==sampleLil.location) {
          sampleLil = changeLils();
        }
      }
    }
    return sampleLil;
  }
  
  void jump() {
    Lillypad val = validLilly();
    theta = random(-TWO_PI,TWO_PI);
    angle = val.angle;
    location = val.location;
  }
  
  void run() {
    render();
  }
  
  void render() {
    noStroke();
    if(mass>=3 && mass<4) {
      fill(green[0],250);
    } else if (mass>=4 && mass<5) {
      fill(green[1],250);
    } else if (mass>=5 && mass<6) {
      fill(green[2],250);
    }
    
    float a = map(sin(angle),-1,1,-3,3);
    float b = map(sin((sin(angle/2.5)*3)),-1,1,1,6);
    angle +=0.03;
    
    pushMatrix();
    translate(location.x,location.y+a);
    scale(0.2 * mass);
    rotate(theta);
    
    beginShape();
    curveVertex(0,-30);
    curveVertex(0,-30);
    curveVertex(10,-20);
    curveVertex(17,20);
    curveVertex(10,30);
    curveVertex(3,35);
    curveVertex(-3,35);
    curveVertex(-10,30);
    curveVertex(-17,20);
    curveVertex(-10,-20);
    curveVertex(0,-30);
    curveVertex(0,-30);
    endShape();
    beginShape();
    curveVertex(3,30);
    curveVertex(3,30);
    curveVertex(-5,20);
    curveVertex(-30,5);
    curveVertex(-35,7);
    curveVertex(-33,17);
    curveVertex(-15,30);
    curveVertex(-5,31);
    curveVertex(3,32);
    curveVertex(3,32);
    endShape();
    beginShape();
    curveVertex(-3,30);
    curveVertex(-3,30);
    curveVertex(5,30);
    curveVertex(30,5);
    curveVertex(35,7);
    curveVertex(33,17);
    curveVertex(15,30);
    curveVertex(5,31);
    curveVertex(-3,32);
    curveVertex(-3,32);
    endShape();
    
    fill(50);
    ellipse(-6,-20,6,b);
    ellipse(6,-20,6,b);
    popMatrix();
  }
}
class FrogSystem {
  ArrayList<Frog> frogs;
  
  FrogSystem(ArrayList<Lillypad> lillies) {
    frogs = new ArrayList<Frog>();
    for (int i=0; i<2; i++) {
      frogs.add(new Frog(lillies,frogs));
    }
  }
  
  void scare(boolean all) {
    for(Frog fg: frogs) {
      fg.jump();
    }
  }
  
  void scare(PVector _loc) {
    PVector loc = _loc;
    for (int i=0; i<frogs.size(); i++) {
      if (frogs.get(i).location==loc) {
        frogs.get(i).jump();
      }
    }
  }
  
  void run() {
    for (Frog fg: frogs) {
      fg.run();
    }
  }
}
class Lillypad {
  PVector location;
  float mass;
  float strength;
  float theta;
  float angle;
  
  Lillypad (float x, float y) {
    location = new PVector(x,y);
    mass = random(90,150);
    strength = (mass * mass)/10;
    theta = random(-TWO_PI,TWO_PI);
    angle = random(0,5);
  }
  
  void render() {
    float a = map(sin(angle),-1,1,-3,3);
    angle +=0.03;
    float r = mass/4.5;
    pushMatrix();
    translate(location.x,location.y+a);
    rotate(theta);
    
    strokeWeight(2);
    noFill();
    stroke(255,map(((millis()/3.0)%1000.0),0,999,175,0));
    ellipse(-5,-5, rippleR(0), rippleR(0));
    stroke(255,map((((millis()+300)/3.0)%1000.0),0,999,175,0));
    ellipse(-5,-5, rippleR(1), rippleR(1));
    stroke(255,map((((millis()+600)/3.0)%1000.0),0,999,175,0));
    ellipse(-5,-5, rippleR(2), rippleR(2));
    
    fill(#4C9977);
    noStroke();
    beginShape();
    for (float t=0; t<TWO_PI+1; t+=0.4) {
      curveVertex(r*(2*cos(t)-cos(2*t)),r*(2*sin(t) - sin(2*t)));
    }
    endShape();
    popMatrix();
  }
  
  float dist(Lillypad other) {
    return PVector.dist(location,other.location);
  }
  
  PVector attract(Fish p) {
    PVector dir = PVector.sub(location,p.location);
    float d = dir.mag();
    d = constrain(d,5,100);
    dir.normalize();
    float force = strength / (d * d);
    dir.mult(force);
    return dir;
  }
  
  float rippleR(int whichWave) {
    float rad = map((((millis() + 900 * whichWave)/3.0)%1000.0),0,999,50,190);
    return rad;
  }
}
class School {
  ArrayList<Fish> fishies;
  boolean boundaries;
  
  School() {
    fishies = new ArrayList<Fish>();
    for (int i=0; i<30; i++) {
      fishies.add(new Fish());
    }
    boundaries = true;
  }
  
  void run() {
    for (Fish p: fishies) {
      p.run(fishies);
    }
  }
  
  void addForce(PVector f) {
    for (Fish p: fishies) {
      p.addForce(f);
    }
  }
  
  void handleBoundaries(boolean bound) {
    for (Fish p: fishies) {
      boundaries = bound;
    }
  }
  
  void addAttraction(Lillypad r) {
    for (Fish p: fishies) {
      PVector force = r.attract(p);
      p.addForce(force);
    }
  }
}
// Michelle Ma
// Thanks to Daniel Schiffman for his flocking simulation on Processing!
// Thanks to Golan Levin for his gravity simulation!

import java.util.Iterator;

School fishies;
FrogSystem frogs;
ArrayList<Lillypad> lillies;

boolean addLillypad = true;

void setup() {
  size(500,500);
  
  fishies = new School();
  lillies = new ArrayList<Lillypad>();
  
  while (lillies.size()<6) {
    drawLillypad();
  }
  
  frogs = new FrogSystem(lillies);
}

void draw() {
  background(#88D1FE);
  
  for (Lillypad r: lillies) {
    fishies.addAttraction(r);
  }
  
  fishies.run();
  
  for (Lillypad r: lillies) {
    r.render();
  }
  
  frogs.run();
  
  if(lillies.size()==0) {
    fishies.handleBoundaries(false);
  }
}

void drawLillypad() {
  float rx = random(width);
  float ry = random(height);
  Lillypad sample = new Lillypad(rx,ry);
  for(Lillypad r: lillies) {
    if (sample.dist(r) < 200) {
      addLillypad = false;
    }
  }
  if(addLillypad) {
    lillies.add(sample);
  }
  addLillypad = true;
}

void keyPressed() {
  int lilliesLen = lillies.size();
  if (lillies.size()<6) {
    while (lillies.size()==lilliesLen) {
      drawLillypad();
      frogs.scare(true);
    }
  }
  fishies.handleBoundaries(true);
}

void mousePressed() {
  PVector test = new PVector(mouseX,mouseY);
  PVector loc = new PVector(0,0);
  Iterator<Lillypad> it = lillies.iterator();
  while (it.hasNext()) {
    Lillypad r = it.next();
    if (r.location.dist(test) < r.mass/1.5) {
      loc = r.location;
      it.remove();
      frogs.scare(loc);
    }
  }
  for (Lillypad r: lillies) {
    r.strength *= pow(r.mass,0.05);
  }
}


