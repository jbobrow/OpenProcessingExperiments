
//Alien Experiment

float zoogX = 150;
float zoogY = 150;

float eyeR;
float eyeG;
float eyeB;

float mouthR;
float mouthG;
float mouthB;

float skinR;
float skinG;
float skinB;

float change;



void setup() {
  size(500,800);
  smooth();
  background(255,255,255);
  
}

void draw() {
  
  stroke(140,201,253);
  fill(skinR,skinG,skinB);
  ellipse(zoogX,zoogY,150,200);
  stroke(255);
  fill(eyeR,eyeG,eyeB);
  ellipse(zoogX - 20,zoogY - 10,33,44);
  ellipse(zoogX + 20,zoogY - 10,33,44);
  stroke(120,20,0);
  fill(mouthR,mouthG,mouthB);
  ellipse(zoogX,zoogY + 50,60,50);
  
  change = random(0.01,2);
  zoogX = pmouseX;
  zoogY = pmouseY;
  eyeR = random(0,255);
  eyeG = random(0,255);
  eyeB = random(0,255);
  mouthR = random(100,255);
  mouthG = random(0,100);
  mouthB = random(0,50);
  skinR = random(100,185);
  skinG = random(120,155);
  skinB = random (200,255);
  
}


