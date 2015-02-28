
ArrayList<Boid> boids = new ArrayList<Boid>();
int NUM_BOIDS = 50;
final int SCREEN_SIZE = 273;
final int MAX_SPEED = 2;
//LOWER = STRONGER ATTRACT
final float ATTRACT_STR = 250;
//HIGHER = STRONGER REPEL
final float REPEL_STR = 0.5;
//LOWER = STRONGER CONFORM
final float CONFORM_STR = 50;
//LOWER = STRONGER MOUSE
final float MOUSE_STR = 250;
//HIGHER = STRONGER EDGE
final float EDGE_STR = 0.05;

void setup() {
  size(237, 207);
  for(int i = 0; i < NUM_BOIDS; i++) {
    PVector pos = new PVector(random(SCREEN_SIZE), random(SCREEN_SIZE), 0);
    PVector vel = new PVector(0, 0, 0);
    boids.add(new Boid(pos, vel));
    bg = loadImage("http://www.3wing.org/meinrad/images/keyback.jpg");
  }
}

void draw() {
  background(bg);
  PVector absCenter = getAbsCenter();
  PVector absAvgVel = getAbsAvgVel();
  PVector mousePos = new PVector(mouseX, mouseY, 0);
  for(Boid boid:boids) {
    PVector pos = boid.getPos();
    PVector vel = boid.getVel();
    //ellipse(pos.x, pos.y, 2, 2);
    render(pos, vel);
    PVector a, b, c, d, e;
    a = rule1(boid, absCenter);
    b = rule2(boid);
    c = rule3(boid, absAvgVel);
    d = rule4(boid, mousePos);
    e = rule5(boid);
    vel.set(vel.x + a.x + b.x + c.x + d.x + e.x, vel.y + a.y + b.y + c.y + d.y + e.y, 0);
    if (vel.mag() > MAX_SPEED) {
      /**
      vel.normalize();
      vel = PVector.mult(vel, MAX_SPEED);
      **/
      vel.mult(0.8);
    }
    vel.mult(random(0.99, 1.0));
    pos = PVector.add(pos, vel);
    boid.setPos(pos);
    boid.setVel(vel);
  }
}

void render(PVector pos, PVector vel) {
  pushMatrix();
  translate(pos.x, pos.y);
  rotate(atan2(vel.y, vel.x));
  beginShape();
  vertex(3, 0);
  vertex(-0.75, 1);
  vertex(-0.75, -1);
  vertex(3, 0);
  endShape();
  popMatrix();
}

void mouseClicked() {
  boids.add(new Boid(new PVector(mouseX, mouseY, 0), new PVector(0, 0, 0)));
  NUM_BOIDS++; 
}

//Attract
PVector rule1(Boid b, PVector absCenter) {
  PVector perCenter = PVector.sub(absCenter, b.getPos());
  perCenter.div(NUM_BOIDS - 1);
  PVector dis = PVector.sub(perCenter, b.getPos());
  if (dis.mag() > ATTRACT_STR / 10) {
    return PVector.div(dis, ATTRACT_STR);
  }
  return new PVector(0, 0, 0);
}

//Repel
PVector rule2(Boid b) {
  
  PVector vel = new PVector(0, 0, 0);
  for(Boid boid:boids) {
    PVector dis = PVector.sub(b.getPos(), boid.getPos());
    float mag = dis.mag();
    if (mag != 0) {
      mag = REPEL_STR / mag;
      dis.normalize();
      dis.mult(mag);
      vel.add(dis);
    }
  }
  return vel;
  
  /**
  PVector vel = new PVector(0, 0, 0);
  for(Boid boid:boids) {
    PVector dis = PVector.sub(b.getPos(), boid.getPos());
    if (dis.mag() < REPEL_STR * 10) {
      vel = PVector.add(vel, dis);
    }
  }
  return vel;
  **/
}

//Conform
PVector rule3(Boid b, PVector absAvgVel) {
  PVector perAvgVel = PVector.sub(absAvgVel, b.getVel());
  perAvgVel.div(NUM_BOIDS - 1);
  return PVector.div(perAvgVel, CONFORM_STR);
}

//Mouse
PVector rule4(Boid b, PVector mousePos) {
  PVector dis = PVector.sub(mousePos, b.getPos());
  if (dis.mag() < 50) {
    dis.mult(-1);
    return PVector.div(dis, MOUSE_STR);
  }
  return new PVector(0, 0, 0);
}

//Edge
PVector rule5(Boid b) {
  PVector pos = b.getPos();
  PVector force = new PVector(0, 0, 0);
  if (pos.x < SCREEN_SIZE * 0.05) {
    force.add(new PVector(EDGE_STR, 0, 0));
  }
  if (pos.x > SCREEN_SIZE * 0.95) {
    force.add(new PVector(-EDGE_STR, 0, 0)); 
  }
  if (pos.y < SCREEN_SIZE * 0.05) {
    force.add(new PVector(0, EDGE_STR, 0));
  }
  if (pos.y > SCREEN_SIZE * 0.95) {
    force.add(new PVector(0, -EDGE_STR, 0)); 
  }
  return force;
}

PVector getAbsCenter() {
  float sumX = 0;
  float sumY = 0;
  for(Boid boid:boids) {
    sumX += boid.getPos().x;
    sumY += boid.getPos().y;
  }
  return new PVector(sumX, sumY);
}

PVector getAbsAvgVel() {
  float sumX = 0;
  float sumY = 0;
  for(Boid boid:boids) {
    sumX += boid.getVel().x;
    sumY += boid.getVel().y;
  }
  return new PVector(sumX, sumY);
}
class Boid {
  
  PVector position;
  PVector velocity;
  
  Boid(PVector position, PVector velocity) {
    this.position = position;
    this.velocity = velocity;
  }
  
  PVector getPos() {return position;}
  PVector getVel() {return velocity;}
  void setPos(PVector position) {this.position = position;}
  void setVel(PVector velocity) {this.velocity = velocity;}
  
}

