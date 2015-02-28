
//CAT
int dimCanvas = 400;
//Eye Params
float eyeD = random(0, 50);
float eyeDist = 100;
float eyeLeftX = random(eyeD, dimCanvas-eyeD-eyeDist*2);
float eyeLeftY =  random(40, dimCanvas-100);
float eyeRightX = eyeLeftX+eyeDist;
float eyeRightY = eyeLeftY;
float eyeWeight = 3;
float R = 0;
float G = 0;
float B = 0;


//Nose Params
float triangleX = eyeLeftX+random(-10, eyeDist/2);
float triangleY = eyeLeftY+random(10, 20);
float noseWidth = 40;
float noseLength = 50;

//Top of head Params
float earWidth = 40;
float earHeight = 30;
float tilt = map(random(0, 100), 0, 100, .25, 2);

//Chin params
float chinDepth = map(random(0, 100), 0, 100, 9, 100);


void setup() {
  size(400, 400);
  smooth();
  background(255);
}

void draw() {
  stroke(0);
  strokeWeight(1);
  drawChin();
  drawNose();
  drawHead();
  strokeWeight(eyeWeight);
  stroke(R, G, B);
  drawEyes();
}

void mousePressed() {
  //Randomize params!
  eyeD = random(0, 50);
  eyeDist = 100;
  eyeLeftX = random(eyeD, dimCanvas-eyeD-eyeDist);
  eyeLeftY =  random(40, dimCanvas-100);
  eyeRightX = eyeLeftX+eyeDist;
  eyeRightY = eyeLeftY;
  eyeWeight = random(1, 10);
  R = random(0, 255);
  G =  random(0, 255);
  B =  random(0, 255);


  //Nose Params
  triangleX = eyeLeftX+random(-10, eyeDist);
  triangleY = eyeLeftY+random(10, 100);
  noseWidth = random(10, 50);
  noseLength = random(4, 20);

  //Top of head Params
  earWidth = random(6, 90);
  earHeight = random(15, 30);
  tilt = map(random(0, 100), 0, 100, .25, 2);

  //Chin params
  chinDepth = map(random(0, 100), 0, 100, 9, 100);
}

void drawEyes() {
  //right eye
  ellipse(eyeLeftX, eyeLeftY, eyeD, eyeD);
  //left eye
  ellipse(eyeLeftX+eyeDist, eyeRightY, eyeD, eyeD);
}

void drawNose() {
  line(eyeLeftX+eyeD/2, eyeLeftY, triangleX, triangleY);
  line(eyeRightX-eyeD/2, eyeRightY, triangleX+noseWidth, triangleY);
  triangle(triangleX, triangleY, triangleX+noseWidth, 
  triangleY, triangleX+noseWidth/2, triangleY+noseLength);
}

void drawHead() {
  line(eyeLeftX, eyeLeftY-eyeD, eyeRightX, eyeLeftY-eyeD);
  //left Ear
  line(eyeLeftX, eyeLeftY-eyeD, eyeLeftX-earWidth/tilt, eyeLeftY-eyeD-earHeight);
  line(eyeLeftX-earWidth/tilt, eyeLeftY-eyeD-earHeight, eyeLeftX-earWidth, 
  eyeLeftY-eyeD);
  //right Ear
  line(eyeRightX, eyeLeftY-eyeD, eyeRightX+earWidth/tilt, eyeLeftY-eyeD-earHeight);
  line(eyeRightX+earWidth/tilt, eyeLeftY-eyeD-earHeight, eyeRightX+earWidth, eyeLeftY-eyeD);
}

void drawChin() {
  beginShape();
  curveVertex(eyeLeftX-earWidth, eyeLeftY-eyeD);
  curveVertex(eyeLeftX-earWidth, eyeLeftY-eyeD);
  curveVertex(triangleX+noseWidth/2, triangleY+noseLength+chinDepth);
  curveVertex(eyeRightX+earWidth, eyeLeftY-eyeD);
  curveVertex(eyeRightX+earWidth, eyeLeftY-eyeD);
  endShape();
}
