
ArrayList<Boid> flock = new ArrayList<Boid>();
ArrayList<Predator> pack = new ArrayList<Predator>();
int boidNum = 40;
int predNum = 8;

void setup() {
  size(800, 800);
  frameRate(60);

  smooth();
  background(255*.5);

  for (int i=0; i<boidNum; i++) {
    flock.add(new Boid(new PVector(random(width), random(height))));
  }  
  for (int i=0; i<predNum; i++) {
    pack.add(new Predator(new PVector(random(width), random(height))));
  }
}

void draw() {
  noStroke();
  fill(0, 255*.4);
  rect(0, 0, width, height);

  if (mousePressed && mouseButton == LEFT) flock.add(new Boid(new PVector(mouseX, mouseY)));
  if (mousePressed && mouseButton == RIGHT) pack.add(new Predator(new PVector(mouseX, mouseY)));

  for (Boid boid: flock) {
    for (Predator predator: pack) boid.repelForce(predator.getPos(), 80);
    boid.repelForce(new PVector(mouseX, mouseY), 80);
    boid.applyFlock(flock);
    boid.update();
    boid.display();
  }
  for (Predator predator: pack) {
    predator.repelForce(new PVector(mouseX, mouseY), 80);
    predator.applyFlock(flock);
    for (Predator friend: pack) {
      if (friend != predator) predator.repelForce(friend.getPos(), 20);
    }
    predator.update();
    predator.display();
  }
}

class Boid {
  PVector position, 
  velocity, 
  acceleration;
  float   mass, 
  forceScale, 
  affectRadius, 
  speedLimit;
  color c;

  Boid(PVector pos) {
    position = pos;
    velocity = new PVector(random(-1,1), random(-1,1));
    velocity.normalize();
    acceleration = new PVector();
    mass = random(3, 6);
    forceScale = 2;
    affectRadius = 40;
    speedLimit = 4;
    c = color(random(127), random(127, 255), random(127, 255));
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    velocity.limit(speedLimit);

    if (position.x<=0) {
      position.x = width;
    }
    if (position.x>width) {
      position.x = 0;
    }
    if (position.y<=0) {
      position.y = height;
    }
    if (position.y>height) {
      position.y = 0;
    }
  }

  void display() {
    stroke(c);
    strokeWeight(mass);
    line(position.x, position.y, position.x + velocity.x*2, position.y + velocity.y*2);
  }

  void applyForce(PVector force) {
    force.div(mass);
    acceleration.add(force);
  }

  void applyFlock(ArrayList<Boid> friends) {
    seperationForce(friends);
    alignmentForce(friends);
    cohesionForce(friends);
  }

  void seperationForce(ArrayList<Boid> friends) {
    PVector posSum = new PVector();
    PVector sepVec = new PVector();
    float n = 0, d = 0;
    for (Boid friend: friends) {
      d = PVector.sub(friend.getPos(), this.getPos()).mag();
      if (d!=0 && d<=affectRadius) {
        posSum.add(friend.getPos());
        n++;
      }
    }
    if (n!=0) {
      posSum.div(n);
      sepVec = PVector.sub(position, posSum);
      sepVec.limit(forceScale*2);
      applyForce(sepVec);
    }
  }

  void alignmentForce(ArrayList<Boid> friends) {
    PVector velSum = new PVector();
    PVector alignVec = new PVector();
    float n = 0, d = 0;
    for (Boid friend: friends) {
      d = PVector.sub(friend.getPos(), this.getPos()).mag();
      if (d!=0 && d<=affectRadius) {
        velSum.add(friend.getVel());
        n++;
      }
    }
    if (n!=0) {
      velSum.div(n);
      alignVec = velSum;
      alignVec.limit(forceScale);
      applyForce(alignVec);
    }
  }

  void cohesionForce(ArrayList<Boid> friends) {
    PVector posSum = new PVector();
    PVector cohVec = new PVector();
    float n = 0, d = 0;
    for (Boid friend: friends) {
      d = PVector.sub(friend.getPos(), this.getPos()).mag();
      if (d!=0 && d<=affectRadius) {
        posSum.add(friend.getPos());
        n++;
      }
    }
    if (n!=0) {
      posSum.div(n);
      cohVec = PVector.sub(posSum, position);
      cohVec.limit(forceScale);
      applyForce(cohVec);
    }
  }

  void repelForce(PVector source, float range) {
    PVector repVec = new PVector();
    float d = PVector.sub(source, position).mag();
    if (d!=0 && d<= range) {
      repVec = PVector.sub(position, source);
      repVec.normalize();
      repVec.mult(map(d, range, 0, 0, forceScale*150));
    }
    applyForce(repVec);
  }

  PVector getPos() {
    return position;
  }

  PVector getVel() {
    return velocity;
  }

  PVector getAcc() {
    return acceleration;
  }
}

class Predator extends Boid {
  Predator(PVector pos) {
    super(pos);
    velocity.mult(2.5);
    mass = random(7, 10);
    forceScale = 1;
    affectRadius = 120;
    speedLimit = 6;
    c = color(random(127, 255), random(127,255), 0);
  }
}

