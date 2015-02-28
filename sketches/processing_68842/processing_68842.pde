
import processing.opengl.*;

/**
 * Motion 
 * CC Lab Fall 2012
 *
 * by Ryan Raffa
 * 09/02/12
 */

//create initial global variables
int     radius;
float	frequency, position, positionAdder;
float   posOne, posTwo, AmouseX;
float xPosOne[] = new float[160];
float xPosTwo[] = new float[160];
float yPos[] = new float[160];
float VmouseX[] = new float [8];

void setup() {
  size(1240, 720, OPENGL);
  background(0);
  frameRate(60);

  radius        = 100;
  frequency     = 400;
  position      = 0;
  positionAdder = ( (float)frequency / 44100) * TWO_PI;

  //generate yPosOne values

  for (int i=0; i<160; i++) {
    yPos[i]= -i*8+width/2;
  }
}

void draw() {

  noStroke();
  //background(0);
  fill(0, 0, 0, 80);
  rect(0, 0, width, height);
  translate(width/2, height/2);

  averagemouse();
  
  position += positionAdder;
  posOne = oscillationPositive(position);
  posTwo = oscillationNegative(position);
  
  //calculate Xpos
  for (int i=0; i<159; i++) {
    xPosOne[i]=xPosOne[i+1]-.03*(random(i));
   xPosTwo[i]=xPosTwo[i+1]+.03*(random(i));
  }
  xPosOne[159]=posOne+(AmouseX-height/2);
  xPosTwo[159]=posTwo+(AmouseX-height/2);
  // Red Circle

  for (int i=0; i<160; i++) {
    fill(255, 0, 0+3*(160-i), 255-1.5*(160-i));
    ellipse(yPos[i], xPosOne[i], 20+(160-i), 20+(160-i));
  }
  // Green

  for (int i=0; i<160; i++) {
    fill(0, 255, 0+4*(160-i), 255-1.5*(160-i));
    ellipse(yPos[i], xPosTwo[i], 20+(160-i), 20+(160-i));
  }
  

}

float oscillationPositive(float position) {

  float pos = sin(position);
  pos = pos * radius;

  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { 
    position -= TWO_PI;
  }
  return pos;
}

float oscillationNegative(float position) {

  //Subtract PI to provide a value on the opposite side in radians
  float pos = sin(position-PI);
  pos = pos * radius;
  
  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { position -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}

void averagemouse(){

for (int i=0; i<7 ;i++){
  VmouseX[i]=VmouseX[i+1];
}
VmouseX[7]=mouseY;

AmouseX = (VmouseX[7]+VmouseX[6]+VmouseX[5]+VmouseX[4]+VmouseX[3]+VmouseX[2]+VmouseX[1]+VmouseX[0])/8;

}

