
//Alex Lee, asl1@andrew.cmu.edu, 60-257, HW6
//Copyright Alex Lee 2013, Pittsburgh PA


/*
I modified the rotation so that it would slow down due to friction. 


*/

//colors
color bgColor = #1F031A;//#1D3BDE;
color brickColor = #FFFFFF;//#BFADFF;
color sphereColor = #1F1567;
color strokeColor = #FFFFFF;
color textColor = #FFFFFF;

float transX, transY, transZ, rotX, rotY, rotZ, rotDeltaX, rotDeltaY, rotDeltaZ;

float friction = .95; 
float rotDeltaConstant = 2;
float transDeltaConstant = 4;

//brick size
float brickSizeX = 50;
float brickSizeY = 25;
float brickSizeZ = 50; 


void setup() {
  size(600, 600, P3D);
  
  restartGame();
}

void restartGame() {
  rotX = 0;
  rotY = 35;
  rotZ= 35; 
  rotDeltaX = 0;
  rotDeltaY = 0;
  rotDeltaZ = 0;
  transX = 0;
  transY = 0;
  transZ = 0;
}

void draw() {
  background(bgColor);
  drawText();
  pushMatrix();
  translate(width/2, height/2, 0);
  //drawAxisLines();
  directionalLight(229, 0, 8, 200, 200, 50);
  directionalLight(209, 0, 171, -200, -200, 50);
  //lights();
  pushMatrix();
  translate(transX, transY, transZ); //?
  rotDeltaX *= friction;
  rotDeltaY *= friction;
  rotDeltaZ *= friction;
  rotX += rotDeltaX;
  rotX = rotX % 360;
  rotY += rotDeltaY;
  rotY = rotY % 360;
  rotZ += rotDeltaZ;
  rotZ = rotZ % 360;
  rotateX(radians(rotX));
  rotateY(radians(rotY));
  rotateZ(radians(rotZ));
  translate(-1*brickSizeX, -2*brickSizeY, -1*brickSizeZ);
  drawLetter();
  popMatrix();
  popMatrix();
}

void drawAxisLines() {
  stroke(strokeColor);
  strokeWeight(3);
  stroke( 200, 200, 0 ); 
  //line( 0, 0, 200, 0, 0, -200 );  // Z axis line
  stroke( 0, 200, 200 );
  line( 0, 200, 0, 0, -200, 0 );  // Y axis line
  stroke( 200, 0, 200 );
  line( 200, 0, 0, -200, 0, 0 );  // X axis line
}

void drawLetter() {
  fill(brickColor);
  stroke(strokeColor);
  strokeWeight(0);
  for(int i = 0; i < 5; i++) {
    drawBrick (0, i*brickSizeY, 0);
    drawBrick (2*brickSizeX, i*brickSizeY, 0);
    drawBrick (0, i*brickSizeY, 2*brickSizeZ);
    drawBrick (2*brickSizeX, i*brickSizeY, 2*brickSizeZ);
  }
  drawBrick (brickSizeX, 0, 0);
  drawBrick (0, 0, brickSizeZ);
  drawBrick (brickSizeX, 0, brickSizeZ*2);
  drawBrick (brickSizeX*2, 0, brickSizeZ);
  
  drawBrick (brickSizeX, brickSizeY*2, 0);
  drawBrick (0, brickSizeY*2, brickSizeZ);
  drawBrick (brickSizeX, brickSizeY*2, brickSizeZ*2);
  drawBrick (brickSizeX*2, brickSizeY*2, brickSizeZ);
  
  
  pushMatrix();
  fill(sphereColor);
  translate(brickSizeX, brickSizeY, brickSizeZ);
  sphere(brickSizeX/1.7);
  popMatrix();
  
}


void drawBrick(float X, float Y, float Z) {
  pushMatrix();
  translate(X, Y, Z);
  box(brickSizeX, brickSizeY, brickSizeZ);
  popMatrix();
}

void drawText() {
  String rot = "Rotation (X: " + abs(round(rotX)) + ", Y: " + abs(round(rotY)) + ", Z: " + abs(round(rotZ)) + ")";
  String trans = "Translation (X: " + round(transX) + ", Y: " + round(transY) + ", Z: " + round(transZ) + ")";
  fill(0, 102, 153, 204);
  textSize(15);
  text(rot, 10, 20, 0);
  text(trans, 10, 35, 0);
}

void mouseDragged() {
  if(mouseButton == LEFT) {
    if(pmouseX < mouseX) {
      transX += transDeltaConstant; 
    }
    else if(pmouseX > mouseX) {
      transX -= transDeltaConstant; 
    }
    if(pmouseY < mouseY) {
      transY += transDeltaConstant; 
    }
    else if(pmouseY > mouseY) {
      transY -= transDeltaConstant; 
    }
  }
  if(mouseButton == RIGHT) {
    if(pmouseY < mouseY) {
      transZ -= transDeltaConstant; 
    }
    else if(pmouseY > mouseY) {
      transZ += transDeltaConstant; 
    }
  }
}

void keyPressed() {
  if(key== 'Q' || key == 'X') {
    rotDeltaX += rotDeltaConstant;
  }
  if(key== 'A' || key == 'x') {
    rotDeltaX -= rotDeltaConstant;
  }
  if(key== 'W' || key == 'Y') {
    rotDeltaY += rotDeltaConstant;
  }
  if(key== 'S' || key == 'y') {
    rotDeltaY -= rotDeltaConstant;
  }
  if(key== 'E' || key == 'Z') {
    rotDeltaZ += rotDeltaConstant;
  }
  if(key== 'D' || key == 'z') {
    rotDeltaZ -= rotDeltaConstant;
  }
  if(key == 'r') {
    restartGame();
  }
  if(key == 's') {
    rotX = 0;
    rotY = 0;
    rotZ = 0;
    rotDeltaX = 0;
    rotDeltaY = 0;
    rotDeltaZ = 0;
  }
  if(key == ' ') {
    transX = 0;
    transY = 0;
    transZ = 0;
  }
}


