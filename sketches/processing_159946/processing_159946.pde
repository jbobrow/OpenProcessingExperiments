
float diameter = 64;
int steps = 5;
PVector follower;
void setup() {
  size(800, 600);
//  smooth();
  ellipseMode(CENTER);
  background(64);
  follower = new PVector(mouseX, mouseY);
}
void draw() {
  noStroke();
  fill(0,32);
  rect(0,0,width,height);
  stroke(255);
  noFill();
  PVector mouse = new PVector(mouseX, mouseY);
  PVector middle = new PVector(width/2, height/2);
  mouse.sub(middle);
  mouse.mult(2);
  mouse.add(middle);
  follower.add(PVector.mult(PVector.sub(mouse,follower),0.04));
  recursiveRoutine(follower, new PVector(width/2, height/2), diameter, 0);
}
void recursiveRoutine(PVector location, PVector center, float diam, int step) {
  if (step<steps) {
    PVector arm = PVector.sub(location, center);
    float angle = atan2(arm.y, arm.x);
    float radius = arm.mag();
    for (int i=0; i<6; i++) {
      float newAngle = angle + TWO_PI*i/6;
      PVector newArm = new PVector(radius*cos(newAngle), radius*sin(newAngle));
      newArm.add(center);
      ellipse(newArm.x, newArm.y, diam, diam);
      float newNewAngle = angle * 3 * (-1 + (step%2)*2);
      float newRadius = radius*0.37;
      float newDiam = diam*0.4;
      PVector newNewArm = new PVector(newRadius*cos(newNewAngle), newRadius*sin(newNewAngle));
      newNewArm.add(newArm);
      recursiveRoutine(newNewArm, newArm, newDiam, step+1);
    }
  }
}



