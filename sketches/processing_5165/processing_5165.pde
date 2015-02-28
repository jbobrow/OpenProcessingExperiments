
PVector pos;
PVector vel;

final int LENGTH = 150;
final PVector GRAVITY = new PVector(0,1);
final float ELASTICITY = .01;
final float FRICTION = .99;

final int DIAM = 50;

void setup() {
  size(800,600);
  smooth();
  pos = new PVector(width/2,height/2);
  vel = new PVector(0,0);
}

void draw() {
  background(255);
  updateBall();
  drawString();
  drawBall();
}

PVector elasticity() {
  float theta = atan2(ydiff(),xdiff());
  float force = force();
  return new PVector(force*cos(theta),force*sin(theta));
}

float force() {
  float d = distance();
  if(d < LENGTH) {
    return 0;
  } else {
    return (d - LENGTH) * ELASTICITY;
  }
}

float distance() {
  return sqrt(pow(xdiff(),2) + pow(ydiff(),2));
}

float xdiff() {
  return mouseX - pos.x;
}

float ydiff() {
  return mouseY - pos.y;
}

void updateBall() {
  vel.add(elasticity());
  vel.add(GRAVITY);
  vel.mult(FRICTION);
  pos.add(vel);
}

void drawVector(PVector v) {
  stroke(120);
  strokeWeight(1);
  line(width/2,height/2,width/2+v.x,width/2+v.y);
}

void drawAngle(float a) {
  pushMatrix();
  translate(width/2,height/2);
  stroke(120);
  strokeWeight(5);
  point(0,0);
  strokeWeight(1);
  line(0,0,50*cos(a),50*sin(a));
  popMatrix();
}

void drawString() {
  stroke(0);
  strokeWeight(2);
  line(mouseX,mouseY,pos.x,pos.y);
}

void drawBall() {
  noStroke();
  fill(100);
  ellipseMode(CENTER);
  ellipse(pos.x,pos.y,DIAM,DIAM);
}

