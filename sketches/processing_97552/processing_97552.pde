
//NOTE TO SELF: DL code off openprocessing when you decide to
//continue this project from where you left off.
ArrayList<Boid> boids = new ArrayList<Boid>();
int NUM_BOIDS = 56;
final int SCREEN_SIZE = 550;
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
boolean special, special2;
//Values of finals should be OK for 50 boids, shoot for 40-50 boids
float[] d1x = {
  50, 50, 50, 50, 50, 50, 75, 100, 125, 150, //l
  200, 200, 200, 200, 200, 200, //i
  350, 325, 300, 275, 250, 250, 250, 275, 300, 325, 350, 350, 350, 350, 325, 300, 275, 250, //s
  400, 425, 450, 475, 500, 400, 425, 450, 475, 500, 400, 400, 400, 400, 500, 500, 500, 500, //a
  530, 530, 530, 520 //,
};
float[] d1y = {
  50, 80, 110, 140, 170, 200, 200, 200, 200, 200, //10
  50, 80, 110, 140, 170, 200, //6
  50, 50, 50, 50, 50, 80, 110, 110, 110, 110, 110, 140, 170, 200, 200, 200, 200, 200, //18
  50, 50, 50, 50, 50, 110, 110, 110, 110, 110, 80, 140, 170, 200, 80, 140, 170, 200, //18
  200, 210, 220, 230
};

float[] d2x = {
  470, 500, 530, 530, 530, 500, 500, 500, 505, 495, //?
  350, 350, 350, 350, 370, 390, 390, 390, 390, 410, 430, 430, 430, 430, //m
  250, 250, 250, 250, 270, 290, 310, 310, 310, 310, 290, 270, //o
  150, 150, 150, 150, 170, 190, 210, //r
  50, 50, 50, 50, 50, 50, 70, 90, 110, 110, 110, 90, 70 //p
};

float [] d2y = {
  250, 250, 250, 280, 310, 310, 340, 390, 400, 400, //6
  400, 370, 340, 310, 310, 310, 340, 370, 400, 310, 310, 340, 370, 400, //14
  310, 340, 370, 400, 400, 400, 400, 370, 340, 310, 310, 310, //12
  400, 370, 340, 310, 310, 310, 310, //7
  250, 280, 310, 340, 370, 400, 250, 250, 250, 280, 310, 310, 310 //15
};
void setup() {
  size(550, 550);
  int count = 0;
  for (int i = 0; i < NUM_BOIDS; i++) {
    PVector pos = new PVector(random(SCREEN_SIZE), random(SCREEN_SIZE), 0);
    PVector vel = new PVector(0, 0, 0);
    PVector dest1 = new PVector(d1x[count]-5, d1y[count]+150, 0);
    PVector dest2 = new PVector(d2x[count] - 15, d2y[count]-50, 0);
    count++;
    boids.add(new Boid(pos, vel, dest1, dest2));
  }
  special = false;
  special2 = false;
}

void draw() {
  background(200);
  PVector absCenter = getAbsCenter();
  PVector absAvgVel = getAbsAvgVel();
  PVector mousePos = new PVector(mouseX, mouseY, 0);
  for (Boid boid:boids) {
    PVector pos = boid.getPos();
    PVector vel = boid.getVel();
    //ellipse(pos.x, pos.y, 2, 2);
    render(pos, vel);
    if (!special) {
      PVector a, b, c, d, e;
      a = rule1(boid, absCenter);
      b = rule2(boid);
      c = rule3(boid, absAvgVel);
      d = rule4(boid, mousePos);
      e = rule5(boid);
      vel.set(vel.x + a.x + b.x + c.x + d.x + e.x, vel.y + a.y + b.y + c.y + d.y + e.y, 0);
    }
    else {
      PVector z;
      z = rule6(boid);
      vel.set(vel.x + z.x, vel.y + z.y, 0);
    }
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
  ellipse(0, 0, 6, 6);
  beginShape();
  vertex(6, 0);
  vertex(-2, 2);
  vertex(-2, -2);
  vertex(6, 0);
  endShape();
  popMatrix();
}
/**
 void mouseClicked() {
 boids.add(new Boid(new PVector(mouseX, mouseY, 0), new PVector(0, 0, 0), new PVector(0, 0, 0), new PVector(0, 0, 0)));
 NUM_BOIDS++;
 }
 **/
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
  for (Boid boid:boids) {
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

PVector rule6(Boid b) {
  PVector d = special2 ? b.getDest2() : b.getDest1();
  PVector disp = PVector.sub(d, b.getPos());
  return PVector.mult(disp, 0.025);
  //return disp;
}

PVector getAbsCenter() {
  float sumX = 0;
  float sumY = 0;
  for (Boid boid:boids) {
    sumX += boid.getPos().x;
    sumY += boid.getPos().y;
  }
  return new PVector(sumX, sumY);
}

PVector getAbsAvgVel() {
  float sumX = 0;
  float sumY = 0;
  for (Boid boid:boids) {
    sumX += boid.getVel().x;
    sumY += boid.getVel().y;
  }
  return new PVector(sumX, sumY);
}

void keyPressed() {
  if (key == 'a') {
    special = !special;
  }
  if (key == 's' && special) {
    special2 = !special2;
  }
}

class Boid {
  
  PVector position;
  PVector velocity;
  PVector dest1, dest2; //special
  
  Boid(PVector position, PVector velocity, PVector dest1, PVector dest2) {
    this.position = position;
    this.velocity = velocity;
    this.dest1 = dest1;
    this.dest2 = dest2;
  }
  
  PVector getPos() {return position;}
  PVector getVel() {return velocity;}
  PVector getDest1() {return dest1;}
  PVector getDest2() {return dest2;}
  void setPos(PVector position) {this.position = position;}
  void setVel(PVector velocity) {this.velocity = velocity;}
  
}


