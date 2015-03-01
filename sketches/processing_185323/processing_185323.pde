
PVector acc, vel, pos;
void setup() {
  size(400, 400);
  acc = new PVector(0, 0);
  vel = new PVector(0, 0);
  pos = new PVector(200, 200);
}
void draw() {
  background(200);
  vel.add(acc);
  vel.mult(.92); //friction
  pos.add(vel);
  
  ellipse(pos.x, pos.y, 20, 20);
  
  wrapScreen();
  acc.set(0, 0);
}

void keyPressed() {
  acc.add( new PVector(10, 10));
//  vel.add(acc);
}

void wrapScreen() {
  if (pos.x > width) {
    pos.set(0, pos.y);
  } else if (pos.x < 0) {
    pos.set(width, pos.y);
  }
  if (pos.y > height) {
    pos.set(pos.x, 0);
  } else if (pos.y < 0) {
    pos.set(pos.y, height);
  }
}
