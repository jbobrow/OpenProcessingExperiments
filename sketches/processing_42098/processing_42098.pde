
// HW 10 - Computing for the Arts with Processing
// © Asa Foster 2011

int  win = 800;
int i = 0;

float[] randX = {random(win/3, win-win/3), random(win/3, win-win/3), random(win/3, win-win/3)};
float[] randY = {random(win/3, win-win/3), random(win/3, win-win/3), random(win/3, win-win/3)};
float[] randZ = {random(300), random(300), random(300)};
float[] boxX  = {random(50, 200), random(50, 200), random(50, 200)};
float[] boxY  = {random(50, 200), random(50, 200), random(50, 200)};
float[] boxZ  = {random(50, 200), random(50, 200), random(50, 200)};
float[] spinX = {random(-360, 360), random(-360, 360), random(-360, 360)};
float[] spinY = {random(-360, 360), random(-360, 360), random(-360, 360)};


color magenta = color(150, 50, 110);
color yellow = color(170, 170, 70);
color cyan = color(20, 140, 140);

void setup() {
  size(800, 800, P3D);
  strokeWeight(2.5);
}


void draw() {
  background(0);
  noFill();
  lights();
  drawCube(magenta, randX[0], randY[0], randZ[0], spinX[0], spinY[0], boxX[0], boxY[0], boxZ[0]);
  drawCube(yellow,  randX[1], randY[1], randZ[1],  spinX[1], spinY[1], boxX[1], boxY[1], boxZ[1]);
  drawCube(cyan,    randX[2], randY[2], randZ[2],  spinX[2], spinY[2], boxX[2], boxY[2], boxZ[2]);
//  spinCubes();
  noStroke();

}

void spinCubes() {
  spinY[0] += .015;
  spinY[1] += .015;
  spinY[2] += .015;
}

void keyPressed() {

  float[] randXtemp = {random(win/3, win-win/3), random(win/3, win-win/3), random(win/3, win-win/3)};
  randX = randXtemp;
  float[] randYtemp = {random(win/3, win-win/3), random(win/3, win-win/3), random(win/3, win-win/3)};
  randY = randYtemp;
  float[] randZtemp = {random(100), random(100), random(100)};
  randZ = randZtemp;
  float[] boxXtemp  = {random(50, 200), random(50, 200), random(50, 200)};
  boxX = boxXtemp;
  float[] boxYtemp  = {random(50, 200), random(50, 200), random(50, 200)};
  boxY = boxYtemp;
  float[] boxZtemp  = {random(50, 200), random(50, 200), random(50, 200)};
  boxZ = boxZtemp;
  float[] spinXtemp = {random(360), random(360), random(360)};
  spinX = spinXtemp;
  float[] spinYtemp = {random(360), random(360), random(360)};
  spinY = spinYtemp;
}

void drawCube(color whatColor, float transX, float transY, float transZ, float rotaX, float rotaY, float sizeX, float sizeY, float sizeZ) {
  pushMatrix();
  stroke(whatColor);
  translate(transX, transY, transZ);
  rotateY(rotaY);
  rotateX(rotaX);
  box(sizeX, sizeY, sizeZ);
  popMatrix();
}


