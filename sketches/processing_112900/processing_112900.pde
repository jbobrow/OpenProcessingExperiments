
//Kairavi Chahal | kchahal
//Homework 6 | October 1, 2013
 
//Copyright Kairavi Chahal | 2013 | Carnegie Mellon University
//All rights reserved.

//Starter code by Prof. Jim Roberts, CMU.

//X/x, Y/y, Z/z to control rotation
//S/s to stop rotation

//Up/down, left/right, v/^ to control translation OR
//Left/right click + drag to control translation
//Spacebar to stop translation

float Xrot, Yrot, Zrot;
float deltaXrot, deltaYrot, deltaZrot;

float Xtrans, Ytrans, Ztrans;
float deltaXtrans, deltaYtrans, deltaZtrans;

void setup() {
  size(400, 400, P3D);
  background(200);
  
  Xrot = Yrot = Zrot = 0;
  deltaXrot = deltaYrot = deltaZrot = 0;
  
  Xtrans = Ytrans = Ztrans = 0;
  deltaXtrans = deltaYtrans = deltaZtrans = 0;
}

void draw() {
  background(200);
  writeData();
  translate(width/2, height/2, 0);

  directionalLight(100, 100, 100, 0, 1, 1);
  
  updateTrans();
  updateRot();
  
  translate(Xtrans, Ytrans, Ztrans);
  rotateX(radians(Xrot));
  rotateY(radians(Yrot));
  rotateZ(radians(Zrot));
  
  drawInitial();
}

void updateRot() {
  Xrot = Xrot + 0.1*deltaXrot;
  Yrot = Yrot + 0.1*deltaYrot;
  Zrot = Zrot + 0.1*deltaZrot;
}

void updateTrans() {
  Xtrans = Xtrans + 0.1*deltaXtrans;
  Ytrans = Ytrans + 0.1*deltaYtrans;
  Ztrans = Ztrans + 0.1*deltaZtrans;
}

void drawInitial() {
  ambientLight(0, 50, 100, 2, 2, 2);
  
  //K
  pushMatrix();
    translate(-20, 0, 0);
    box(20, 60, 20);
    translate(20, 0, 0);
    box(20);
    translate(20, 20, 0);
    box(20);
    translate(0, -40, 0);
    box(20);
    translate(20, 60, 0);
    box(20);
    translate(0, -80, 0);
    box(20);
  popMatrix();
  
  //C
  pushMatrix();
    translate(-20, -40, -30);
    box(20, 20, 40);
    translate(0, 80, 0);
    box(20, 20, 40);
    translate(0, -20, -30);
    box(20);
    translate(0, -40, 0);
    box(20);
  popMatrix();
}

void mouseDragged() {
  //Right
  if (mouseButton == LEFT && mouseX > pmouseX) {
    deltaXtrans++;
  }
  //Left
  if (mouseButton == LEFT && mouseX < pmouseX) {
    deltaXtrans--;
  }
  //Up
  if (mouseButton == LEFT && mouseY < pmouseY) {
    deltaYtrans--;
  }
  //Down
  if (mouseButton == LEFT && mouseY > pmouseY) {
    deltaYtrans++;
  }
  //Up - RIGHT
  if (mouseButton == RIGHT && mouseY < pmouseY) {
    deltaZtrans++;
  }
  //Down - RIGHT
  if (mouseButton == RIGHT && mouseY > pmouseY) {
    deltaZtrans--;
  }
}

void keyPressed() {
  if (key == 'X') {
    deltaXrot++;
  }
  if (key == 'x') {
    deltaXrot--;
  }
  if (key == 'Y') {
    deltaYrot++;
  }
  if (key == 'y') {
    deltaYrot--;
  }
  if (key == 'Z') {
    deltaZrot++;
  }
  if (key == 'z') {
    deltaZrot--;
  }
  if (key == 's' || key == 'S') {
    Xrot = Yrot = Zrot = 0;
    deltaXrot = deltaYrot = deltaZrot = 0;
  }
  if (key == ' ') {
    Xtrans = Ytrans = Ztrans = 0;
    deltaXtrans = deltaYtrans = deltaZtrans = 0;
  }
  
  //Extra controls for translation with arrow keys
  //Right
  if (keyCode == RIGHT) {
    deltaXtrans++;
  }
  //Left
  if (keyCode == LEFT) {
    deltaXtrans--;
  }
  //Up
  if (keyCode == DOWN) {
    deltaYtrans++;
  }
  //Down
  if (keyCode == UP) {
    deltaYtrans--;
  }
  //Out
  if (key == 'v' || key == 'V') {
    deltaZtrans++;
  }
  //In
  if (key == '6') {
    deltaZtrans--;
  }
}

void writeData() {
  textSize(14);
  fill(255);

  textAlign(LEFT);
  text("Translation:", 20, 20);
  text("X: " + int(Xtrans), 20, 40);
  text("Y: " + int(Ytrans), 20, 60);
  text("Z: " + int(Ztrans), 20, 80);
  text("Trans. Rates:", 20, height-80);
  text("dX: " + int(deltaXtrans), 20, height-60);
  text("dY: " + int(deltaYtrans), 20, height-40);
  text("dZ: " + int(deltaZtrans), 20, height-20);
  
  textAlign(RIGHT);
  text("Rotation:", width-20, 20);
  text("X: " + int(Xrot%360), width-20, 40);
  text("Y: " + int(Yrot%360), width-20, 60);
  text("Z: " + int(Zrot%360), width-20, 80);
  text("Rot. Rates:", width-20, height-80);
  text("dX: " + int(deltaXrot), width-20, height-60);
  text("dY: " + int(deltaYrot), width-20, height-40);
  text("dZ: " + int(deltaZrot), width-20, height-20);
}

//TO DO: implement translational wrapping/bouncing


