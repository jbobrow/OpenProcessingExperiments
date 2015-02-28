
PFont myfont;

PImage rightUpperArm_a;
PImage rightLowerArm_a;
PImage body_a;
PImage shin_a;
PImage thigh_a;
PImage head_a;
PImage foot_a;
PImage head_a2;
PImage rightUpperArm_b;
PImage rightLowerArm_b;
PImage body_b;
PImage shin_b;
PImage thigh_b;
PImage head_b;
PImage foot_b;

float x;
float targetX;
float easing = 0.04;

float opacity;
float breath = 0;
float hipMiddlex;
float hipx;
float hipy;
float ground;

//right leg
float rightThighLength;
float rightShinLength;
float rightKneex;
float rightKneey;
float rightIKAngle;
float rightHipAngle;
float rightKneeAngle;
float rdx;
float rdy;
float rightAnklex;
float rightAnkley;
//left leg
float leftThighLength;
float leftShinLength;
float leftKneex;
float leftKneey;
float leftIKAngle;
float leftHipAngle;
float leftKneeAngle;
float ldx;
float ldy;
float leftAnklex;
float leftAnkley;
//torso
float torsoLength;
float shoulderx;
float shouldery;
float torsoAngle;
float tdx;
float tdy;
//right arm
float rightUpperArmLength;
float rightLowerArmLength;
float rightShoulderAngle;
float rightShoulderx;
float rightShouldery;
float rightElbowAngle;
float rightArmIKAngle;
float rightElbowx;
float rightElbowy;
float rax;
float ray;
float rightWristx;
float rightWristy;
//left arm
float leftUpperArmLength;
float leftLowerArmLength;
float leftShoulderAngle;
float leftShoulderx;
float leftShouldery;
float leftElbowAngle;
float leftArmIKAngle;
float leftElbowx;
float leftElbowy;
float lax;
float lay;
float leftWristx;
float leftWristy;
//head
float neckAngle;
float neckx;
float necky;
float headAngle;
float headx;
float heady;

void setup() {
  myfont = loadFont("Verdana-12.vlw");
  textFont(myfont);
  
  rightUpperArm_b = loadImage("skin_rightUpperArm.png");
  rightLowerArm_b = loadImage("skin_rightLowerArm.png");
  body_b = loadImage("skin_body.png");
  shin_b = loadImage("skin_shin.png");
  thigh_b = loadImage("skin_thigh.png");
  head_b = loadImage("skin_head.png");
  foot_b = loadImage("skin_foot.png");
  head_a2 = loadImage("half_head.png");
  
  rightUpperArm_a = loadImage("ape_rightUpperArm.png");
  rightLowerArm_a = loadImage("ape_rightLowerArm.png");
  body_a = loadImage("ape_body.png");
  shin_a = loadImage("ape_shin.png");
  thigh_a = loadImage("ape_thigh.png");
  head_a = loadImage("ape_head.png");
  foot_a = loadImage("ape_foot.png");
  
  size(640, 480);
  smooth();
}

void draw() {
  background(226);
  
  //easing
  targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  opacity = map(x, 0, width, 255, 0);
  
  ground = 420;
  breath ++;
  hipMiddlex = 289;
  hipx = hipMiddlex + map(x, 0, width, -9, 9) + map(x, 0, width, 5, 2) * sin(breath/50);
  hipy = ground - map(x, 0, width, 75, 180) + map(x, 0, width, 4, 3) * sin(10.25 + breath/12.5);
  
  
  //IK lines

  
  //body parts------------
  rightArm();
  leftLeg();
  head();
  torso();
  rightLeg();
  leftArm();
  
  

}


//----------------------------------------------------------------------
void leftLeg() {
  
  leftThighLength = map(x, 0, width, .6, 1) * 96;
  leftShinLength = map(x, 0, width, .6, 1) * 96;
  //leftAnklex = map(x, 0, width, 335, 340);
  leftAnklex = hipMiddlex + map(x, 0, width, 20, 50) * sin(breath/25);
  leftAnkley = 421 - map(x, 0, width, 10, 20) * cos(breath/25);
  if(leftAnkley >= 424){
    leftAnkley = 423;
  }
  
  rdx = leftAnklex - leftKneex;
  rdy = leftAnkley - leftKneey;
  leftKneeAngle = atan2(rdy, rdx);
  float rtx = leftAnklex - cos(leftKneeAngle)  * leftShinLength;
  float rty = leftAnkley - sin(leftKneeAngle) * leftShinLength;
  rdx = rtx - hipx;
  rdy = rty - hipy;
  leftHipAngle = atan2(rdy, rdx);
  if(leftHipAngle >= leftIKAngle - .05){
    leftHipAngle = leftIKAngle - .05;
  }
  leftKneex = hipx + cos(leftHipAngle) * leftThighLength;
  leftKneey = hipy + sin(leftHipAngle) * leftThighLength;
  leftIKAngle = atan2(leftAnkley - hipy, leftAnklex - hipx);
  
  //thigh
  pushMatrix();
  translate(hipx, hipy);
  rotate(leftHipAngle);
  pushMatrix();
  scale(map(x, 0, width, .6, 1), map(x, 0, width, .8, 1));
  image(thigh_b, -30, -.5*thigh_b.height);
  tint(255, opacity);
  image(thigh_a, -30, -.5*thigh_b.height);
  noTint();
  popMatrix();
  popMatrix();
  //foot
  pushMatrix();
  translate(leftAnklex, leftAnkley);
  image(foot_b, -20, -10);
  tint(255, opacity);
  image(foot_a, -20, -10);
  noTint();
  popMatrix();
  //shin
  pushMatrix();
  translate(leftKneex, leftKneey);
  rotate(leftKneeAngle);
  pushMatrix();
  scale(map(x, 0, width, .63, 1), 1);
  image(shin_b, -12, -.4*shin_b.height);
  tint(255, opacity);
  image(shin_a, -12, -.4*shin_b.height);
  noTint();
  popMatrix();
  popMatrix();
  
  
  
  

}

//----------------------------------------------------------------------
void rightLeg() {
  
  rightThighLength = map(x, 0, width, .6, 1) * 96;
  rightShinLength = map(x, 0, width, .6, 1) * 96;
  //rightAnklex = map(x, 0, width, 335, 340);
  rightAnklex = hipMiddlex - map(x, 0, width, 20, 50) * sin(breath/25);
  rightAnkley = 421 + map(x, 0, width, 10, 20) * cos(breath/25);
  if(rightAnkley >= 424){
    rightAnkley = 423;
  }
  
  rdx = rightAnklex - rightKneex;
  rdy = rightAnkley - rightKneey;
  rightKneeAngle = atan2(rdy, rdx);
  float rtx = rightAnklex - cos(rightKneeAngle)  * rightShinLength;
  float rty = rightAnkley - sin(rightKneeAngle) * rightShinLength;
  rdx = rtx - hipx;
  rdy = rty - hipy;
  rightHipAngle = atan2(rdy, rdx);
  if(rightHipAngle >= rightIKAngle - .05){
    rightHipAngle = rightIKAngle - .05;
  }
  rightKneex = hipx + cos(rightHipAngle) * rightThighLength;
  rightKneey = hipy + sin(rightHipAngle) * rightThighLength;
  rightIKAngle = atan2(rightAnkley - hipy, rightAnklex - hipx);
  
  //thigh
  pushMatrix();
  translate(hipx, hipy);
  rotate(rightHipAngle);
  pushMatrix();
  scale(map(x, 0, width, .6, 1), map(x, 0, width, .8, 1));
  image(thigh_b, -30, -.5*thigh_b.height);
  tint(255, opacity);
  image(thigh_a, -30, -.5*thigh_b.height);
  noTint();
  popMatrix();
  popMatrix();
  //foot
  pushMatrix();
  translate(rightAnklex, rightAnkley);
  image(foot_b, -20, -10);
  tint(255, opacity);
  image(foot_a, -20, -10);
  noTint();
  popMatrix();
  //shin
  pushMatrix();
  translate(rightKneex, rightKneey);
  rotate(rightKneeAngle);
  pushMatrix();
  scale(map(x, 0, width, .63, 1), 1);
  image(shin_b, -12, -.4*shin_b.height);
  tint(255, opacity);
  image(shin_a, -12, -.4*shin_b.height);
  noTint();
  popMatrix();
  popMatrix();
  
  
  

}

//----------------------------------------------------------------------
void leftArm() {
  
  leftUpperArmLength = map(x, 0, width, 66, 80);
  leftLowerArmLength = map(x, 0, width, 66, 80);
  //leftWristx = map(x, 0, width, 335, 340);
  leftWristx = shoulderx + map(x, 0, width, 20, 60) * sin(breath/25) + map(x, 0, width, 20, 0);
  leftWristy = 421 - map(x, 0, width, 10, 20) * cos(.8 + breath/25);
  if(leftWristy >= 424){
    leftWristy = 423;
  }
  
  ldx = leftWristx - leftElbowx;
  ldy = leftWristy - leftElbowy;
  leftElbowAngle = atan2(ldy, ldx);
  float ltx = leftWristx - cos(leftElbowAngle)  * leftLowerArmLength;
  float lty = leftWristy - sin(leftElbowAngle) * leftLowerArmLength;
  ldx = ltx - shoulderx;
  ldy = lty - shouldery;
  leftShoulderAngle = atan2(ldy, ldx);
  if(leftShoulderAngle <= leftIKAngle + .05){
    leftShoulderAngle = leftIKAngle + .05;
  }
  leftElbowx = shoulderx + cos(leftShoulderAngle) * leftUpperArmLength;
  leftElbowy = shouldery + sin(leftShoulderAngle) * leftUpperArmLength;
  leftIKAngle = atan2(leftWristy - shouldery, leftWristx - shoulderx);
  
  //UpperArm
  pushMatrix();
  translate(shoulderx, shouldery);
  rotate(leftShoulderAngle);
  pushMatrix();
  scale(1, map(x, 0, width, .9, 1));
  image(rightUpperArm_b, -12, -rightUpperArm_b.height/2);
  tint(255, opacity);
  image(rightUpperArm_a, -12, -rightUpperArm_b.height/2);
  noTint();
  popMatrix();
  popMatrix();
  
  //LowerArm
  pushMatrix();
  translate(leftElbowx, leftElbowy);
  rotate(leftElbowAngle);
  pushMatrix();
  scale(map(x, 0, width, .9, 1.1), map(x, 0, width, 1, 1.1));
  image(rightLowerArm_b, -15, -rightLowerArm_b.height/2);
  tint(255, opacity);
  image(rightLowerArm_a, -15, -rightLowerArm_b.height/2);
  noTint();
  popMatrix();
  popMatrix();
  
  

}

//----------------------------------------------------------------------
void torso(){
  
  torsoLength = map(x, 0, width, 90, 115);
  torsoAngle = map(x, 0, width, -.5, -1.55) + map(x, 0, width, .05, .02) * sin(breath/25);
  
  shoulderx = hipx + cos(torsoAngle) * torsoLength;
  shouldery = hipy + sin(torsoAngle) * torsoLength;
  
  tdx = shoulderx - hipx;
  tdy = shouldery - hipy;
  //torsoAngle = atan2(tdy, tdx);
  
  pushMatrix();
  translate(hipx, hipy);
  rotate(torsoAngle);
  scale(map(x, 0, width, .85, 1));
  image(body_b, -25, -body_b.height/2);
  tint(255, opacity);
  image(body_a, -25, -body_b.height/2);
  noTint();
  popMatrix();
}
//----------------------------------------------------------------------
void rightArm() {
  
  rightUpperArmLength = map(x, 0, width, 66, 80);
  rightLowerArmLength = map(x, 0, width, 66, 80);
  //rightWristx = map(x, 0, width, 335, 340);
  rightWristx = shoulderx - map(x, 0, width, 20, 60) * sin(breath/25) + map(x, 0, width, 20, 0);
  rightWristy = 421 + map(x, 0, width, 10, 20) * cos(.8 + breath/25);
  if(rightWristy >= 424){
    rightWristy = 423;
  }
  
  rdx = rightWristx - rightElbowx;
  rdy = rightWristy - rightElbowy;
  rightElbowAngle = atan2(rdy, rdx);
  float rtx = rightWristx - cos(rightElbowAngle)  * rightLowerArmLength;
  float rty = rightWristy - sin(rightElbowAngle) * rightLowerArmLength;
  rdx = rtx - shoulderx;
  rdy = rty - shouldery;
  rightShoulderAngle = atan2(rdy, rdx);
  if(rightShoulderAngle <= rightIKAngle + .05){
    rightShoulderAngle = rightIKAngle + .05;
  }
  rightElbowx = shoulderx + cos(rightShoulderAngle) * rightUpperArmLength;
  rightElbowy = shouldery + sin(rightShoulderAngle) * rightUpperArmLength;
  rightIKAngle = atan2(rightWristy - shouldery, rightWristx - shoulderx);
  
  //UpperArm
  pushMatrix();
  translate(shoulderx, shouldery);
  rotate(rightShoulderAngle);
  pushMatrix();
  scale(1, map(x, 0, width, .9, 1));
  image(rightUpperArm_b, -12, -rightUpperArm_b.height/2);
  tint(255, opacity);
  image(rightUpperArm_a, -12, -rightUpperArm_b.height/2);
  noTint();
  popMatrix();
  popMatrix();
  
  //LowerArm
  pushMatrix();
  translate(rightElbowx, rightElbowy);
  rotate(rightElbowAngle);
  pushMatrix();
  scale(map(x, 0, width, .9, 1.1), map(x, 0, width, 1, 1.1));
  image(rightLowerArm_b, -15, -rightLowerArm_b.height/2);
  tint(255, opacity);
  image(rightLowerArm_a, -15, -rightLowerArm_b.height/2);
  noTint();
  popMatrix();
  popMatrix();
  

}

//----------------------------------------------------------------------
void head() {
  
  neckAngle = map(x, 0, width, -.1, -1.5);
  headAngle = 0;
  
  neckx = shoulderx + cos(neckAngle) * 25;
  necky = shouldery + sin(neckAngle) * 25;
  
  headx = neckx + cos(headAngle) * 15;
  heady = necky + sin(headAngle) * 15;
  
  
  pushMatrix();
  translate(neckx, necky);
  rotate(headAngle);
  pushMatrix();
  translate(map(x, 0, width, -15, 0), map(x, 0, width, -3, 0));
  tint(255, map(x, .6*width, .7*width, 0, 255));
  image(head_b, -.25*head_b.width, -.8*head_b.height);
  noTint();
  if(x >= width/2){
    tint(255, map(x, .7*width, .8*width, 255, 0));
  } else {
    tint(255, map(x, .2*width, .3*width, 0, 255));
  }
  image(head_a2, -.25*head_b.width, -.8*head_b.height);
  noTint();
  tint(255, map(x, .3*width, .4*width, 255, 0));
  image(head_a, -.25*head_b.width, -.8*head_b.height);
  noTint();
  popMatrix();
  popMatrix();

  
}


