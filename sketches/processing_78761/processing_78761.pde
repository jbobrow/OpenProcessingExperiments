
// simple football

boolean[] keys = new boolean[256];

PVector[] loc = new PVector[10];
PVector[] vel = new PVector[10];
PVector[] zon = new PVector[10];

PVector ball = new PVector();
PVector ballVel = new PVector();

ArrayList<PVector> footprint = new ArrayList<PVector>();

float speed = 1;
int hasBall = 1;
int oldHasBall = 0;
int count = 0;

float h = 0.0;
float vy = 0.0;

//
void setup() {
  //
  size(440, 440);
  smooth();
  rectMode(CENTER);
  for(int i = 0; i < 10; i++) {
    loc[i] = new PVector();
    vel[i] = new PVector();
  }  
  loc[0] = new PVector(width*0.75, height/2+20);
  loc[1] = new PVector(width*0.25, height/2-20);
}

//
void draw() {
  //
  background(255);
  //
  for(int i = footprint.size()-1; i >= 0; i--) {
    PVector f = footprint.get(i);
    fill(0,f.z);
    rect(f.x, f.y, 3.0, 3.0);
    f.z -= 0.1;
    if(f.z <= 1.0) footprint.remove(i);
  }  
  //
  count++;
  fill(0); noStroke();
  for(int i = 0; i < 2; i++) {
    //
    rect(loc[i].x, loc[i].y, 10.0, 10.0);
    if(count > 10 && vel[i].mag()>0) {
      PVector f = loc[i].get();
      f.x += random(-3,3);
      f.y += random(-3,3);      
      f.z = 40.0;
      footprint.add(f);
      vel[i] = new PVector();
    }
  }
  if(count > 10) count = 0;
  //
  if(hasBall != -1) ball = loc[hasBall].get();
  fill(0,50);
  rect(ball.x, ball.y, 5.0, 5.0);
  fill(0);
  rect(ball.x, ball.y - h, 5.0, 5.0);
  //
  float dx = 0.0; float dy = 0.0;
  if(keys[37]) {dx = -1; dy = 0;}
  if(keys[39]) {dx = 1; dy = 0;}
  if(keys[38]) {dx = 0; dy = -1;}
  if(keys[40]) {dx = 0; dy = 1;}
  //if(hasBall != -1) {loc[1-hasBall].x += dx*speed; loc[1-hasBall].y += dy*speed;}
  //loc[1-hasBall].x += dx*speed; loc[1-hasBall].y += dy*speed;
  loc[oldHasBall].x += dx*speed; loc[oldHasBall].y += dy*speed;
  if(abs(dx + dy) > 0) vel[oldHasBall].x = 1;
  dx = 0; dy = 0;
  if(keys[65]) {dx = -1; dy = 0;}
  if(keys[68]) {dx = 1; dy = 0;}
  if(keys[87]) {dx = 0; dy = -1;}
  if(keys[83]) {dx = 0; dy = 1;}  
  loc[1].x += dx*speed; loc[1].y += dy*speed;
  if(keys[32] && hasBall != -1) {
    ballVel = loc[1-hasBall].get();
    ballVel.sub(loc[hasBall]);
    ballVel.normalize();
    ballVel.mult(15.0);
    //ball = loc[hasBall].get();
    ball.add(ballVel);
    ballVel.normalize();
    ballVel.mult(3.0);   
    vy = 0.01*loc[hasBall].dist(loc[1-hasBall]);    
    oldHasBall = hasBall;
    hasBall = -1;     
  }
  //
  ball.add(ballVel);
  vy -= 0.1;
  h+=vy;
  if(h<0) {h = 0; vy *= -0.7;}
  ballVel.mult(0.99);
  if(loc[0].dist(ball) < 7 && hasBall == -1) hasBall = 0;
  if(loc[1].dist(ball) < 7 && hasBall == -1) hasBall = 1;
}

//
void keyPressed() {
  if(keyCode < 256) keys[keyCode] = true;
}

void keyReleased() {
  if(keyCode < 256) keys[keyCode] = false;
}
