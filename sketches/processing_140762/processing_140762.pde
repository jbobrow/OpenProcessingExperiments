
// brianna jennings
// my great sketch
  
//declare global variables
float eyeSize;
float eyeBallDiam;
float whiteEye;
float fin1;
float mouthDown;
float bodyR;
float bodyB;
float bodyG;
float bodySize1;
float bodySize2;
float darkBlue1;
float darkBlue2;
float darkBlue3;
float yellow1;
float yellow2;
float yellow3;
float medBlue1;
float medBlue2;
float medBlue3;
float mouthR;
float mouthB;
float mouthG;
float eye1;
float eye2;
float eye3;
 
//run once
void setup(){
  size(300,300);
  background(166,166,166);
}
  
void keyPressed(){
  background(166,166,166);
  eyeSize = random(5,10);
  eyeBallDiam = random(15,30);
  whiteEye = random(30,60);
  fin1 = random(0,30);
  mouthDown = random(50,90);
  bodyR = random(32,255);
  bodyB = random(44,255);
  bodyG = random(106,255);
  bodySize1 = random(75, 95);
  bodySize2 = random(200, 220);
  darkBlue1 = random(0,255);
  darkBlue2 = random(1,255);
  darkBlue3 = random(6,255);
  yellow1 = random(30,255);
  yellow2 = random(41,255);
  yellow3 = random(100,255);
  medBlue1 = random(252,255);
  medBlue2 = random(248,255);
  medBlue3 = random(0,255);
  mouthR = random(23,255);
  mouthB = random(30,255);
  mouthG = random(72,255);
  eye1 = random(186,255);
  eye2 = random(46,255);
  eye3 = random(142,255);
}
  
//run forever
void draw(){
  translate(150,150);
 
 
  //her arms
  //dark blue
  fill(darkBlue1,darkBlue2,darkBlue3);
  ellipse(80,fin1,115, 35);
  ellipse(-80,fin1,115, 35);
    noStroke();
  //yellow
  fill(yellow1,yellow2,yellow3);
  ellipse(80,fin1,95,23);
  ellipse(-80,fin1,95,23);
//med blue
  fill(medBlue1,medBlue2,medBlue3);
  ellipse(92,fin1,87,20);
  ellipse(-92,fin1,87,20);
    
//her face
  fill(bodyR,bodyB,bodyG);
  ellipse(0,0,bodySize1,bodySize2);
  
// The Eyes
  stroke(2);
  fill(255,255,255);
  ellipse(40,-40, whiteEye, whiteEye);
  ellipse(-40,-40,whiteEye, whiteEye);
  noStroke();
  fill(eye1,eye2,eye3);
  ellipse(40,-35, eyeBallDiam, eyeBallDiam);
  ellipse(-40,-35,eyeBallDiam, eyeBallDiam);
  fill(56,43,71);
  ellipse(40,-35,eyeSize, eyeSize);
  ellipse(-40,-35,eyeSize, eyeSize);
// The Mouth
  fill(mouthR,mouthB,mouthG);
  pushMatrix();
  translate(16,-35);
  rect(-30, mouthDown, 30, 30, 3, 6, 12, 18);
  popMatrix();
}


