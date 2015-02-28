
ArrayList<Boid> boids = new ArrayList<Boid>();
final int NUM_BOIDS = 50;
final int SCREEN_SIZE = 500;
final int MAX_SPEED = 2;
//LOWER = STRONGER ATTRACT
final float ATTRACT_STR = 200;
//HIGHER = STRONGER REPEL
final float REPEL_STR = 0.5;
//LOWER = STRONGER CONFORM
final float CONFORM_STR = 20;
//LOWER = STRONGER MOUSE
final float MOUSE_STR = 300;

void setup() {
  size(500, 500);
  for(int i = 0; i < NUM_BOIDS; i++) {
    PVector pos = new PVector(random(SCREEN_SIZE), random(SCREEN_SIZE), 0);
    PVector vel = new PVector(0, 0, 0);
    boids.add(new Boid(pos, vel));
  }
}

void draw() {
  background(200);
  PVector absCenter = getAbsCenter();
  PVector absAvgVel = getAbsAvgVel();
  PVector mousePos = new PVector(mouseX, mouseY, 0);
  for(Boid boid:boids) {
    PVector pos, vel;
    pos = boid.getPos();
    vel = boid.getVel();
    ellipse(pos.x, pos.y, 2, 2);
    PVector a, b, c, d;
    a = rule1(boid, absCenter);
    b = rule2(boid);
    c = rule3(boid, absAvgVel);
    d = rule4(boid, mousePos);
    vel.set(vel.x + a.x + b.x + c.x + d.x, vel.y + a.y + b.y + c.y + d.y, 0);
    if (vel.mag() > MAX_SPEED) {
      vel.normalize();
      vel = PVector.mult(vel, MAX_SPEED);
    }
    pos = PVector.add(pos, vel);
    boid.setPos(pos);
    boid.setVel(vel);
  }
}

//Attract
PVector rule1(Boid b, PVector absCenter) {
  PVector perCenter = PVector.sub(absCenter, b.getPos());
  perCenter = PVector.div(perCenter, NUM_BOIDS - 1);
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
      PVector rep = PVector.mult(dis, mag);
      vel = PVector.add(vel, rep);
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
  perAvgVel = PVector.div(perAvgVel, NUM_BOIDS - 1);
  return PVector.div(perAvgVel, CONFORM_STR);
}

//Mouse
PVector rule4(Boid b, PVector mousePos) {
  PVector dis = PVector.sub(mousePos, b.getPos());
  if (dis.mag() > 100) {
    return PVector.div(dis, MOUSE_STR);
  }
  return new PVector(0, 0, 0);
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


