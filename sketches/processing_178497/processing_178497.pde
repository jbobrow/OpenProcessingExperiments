
void setup() {
  size(600, 600, P3D);
}
float lLegRot =0, rLegRot=0, lArmRot=0, rArmRot=0;
float deg = radians(4);
 
void draw() {
  background(0);
  fill(50);
 
 
  translate(width/2, height/2);
 
  // body
  pushMatrix();
  //rect(-100, -100, 200, 200);
  translate(0, -15, 10);
  scale(1.5, 2, 2);
  fill(0,255,0);
  box(50);
  popMatrix();
 
  // right arm
  pushMatrix();
  translate(100, -50, 0);
  rotate(rArmRot);
  scale(2, 1, 1);
  stroke(255);
  fill(255,0,0);
  box(50);
  popMatrix();
 
  pushMatrix();
  translate(170, -50, 0);
  rotate(-rArmRot);
  scale(1, 0.5, .5);
  stroke(255);
  fill(#EA7676);
  box(50);
  popMatrix();
 
  // left arm
  pushMatrix();
  translate(-100, -50);
  rotate(lArmRot);
  scale(2, 1, 1);
  stroke(255);
  fill(255,0,0);
  box(50);
  popMatrix();
 
  pushMatrix();
  translate(-170, -50, 0);
  rotate(-lArmRot);
  scale(1, .5, .5);
  stroke(255);
  fill(#EA7676);
  box(50);
  popMatrix();
 
  // head
  pushMatrix();
  translate(0, -130);
  scale(2, 2, 1);
stroke(255);
  fill(255,255,0);
  sphere(27);
  popMatrix();
 
  // left leg
  pushMatrix();
  translate(-30, 100);
  rotate(lLegRot);
  //rect(-25, 0, 50, 200);
  scale(1, 2, 2);
  stroke(255);
  fill(0,0,255);
  box(50);
  popMatrix();
 
  // right leg
  pushMatrix();
  translate(30, 100);
  rotate(rLegRot);
  // rect(-25, 0, 50, 200);
  scale(1, 2, 2);
  box(50);
 
  popMatrix();
}
 
void mouseDragged() {
  int x = mouseX - width/2;
  int y = mouseY - height/2;
  boolean right=false;
  if (mouseX-pmouseX<0) right=true;
 
  if (dist(x, y, 70, 0) <50) {
    if (right) rArmRot-=deg;
    else rArmRot +=deg;
  } else if (dist(x, y, -100, 0)<50) {
    if (right) lArmRot-=deg;
    else lArmRot +=deg;
  } else if (dist(x, y, -50, 100)<50) {
    if (right) lLegRot-=deg;
    else lLegRot +=deg;
  } else if (dist(x, y, 50, 100)<50) {
    if (right) rLegRot-=deg;
    else rLegRot +=deg;
  }
}
 
 
void keyPressed() {
  lLegRot =0;
  rLegRot=0;
  lArmRot=0;
  rArmRot=0;
}

