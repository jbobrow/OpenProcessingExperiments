
//GRASS
float grassR = 83;
float grassG = 178;
float grassB = 77;
float grassX = 0;
float grassY = 0;
float grassWH = 200;
//WATER
float waterR = 64;
float waterG = 127;
float waterB = 131;
float waterR2 = 40;
float waterG2 = 70;
float waterB2 = 70;
//TAIL
float tailR = 57;
float tailG = 50;
float tailB = 33;
float tailX = 157;
float tailY = 70;
float tailWidth = 35;
float tailHeight = 80;
//RIGHT ARM
float armR = 70;
float armG = 57;
float armB = 29;
float armTopX = 52;
float armTopY = 98;
float armBottomX = 80;
float armBottomY = 115;
float armRightX = 80;
float armRightY = 130;
float armLeftX = 52;
float armLeftY = 112;
//BODY
float bodyColorR = 85;
float bodyColorG = 72;
float bodyColorB = 38;
float bodyStrokeR = 46;
float bodyStrokeG = 38;
float bodyStrokeB = 17;
float bodyStrokeWeight = 2;
float bodyX = 125;
float bodyY = 100;
float bodyWidth = 92;
float bodyHeight = 80;
float headX = 85;
float headY = 90;
float headWidth = 65;
float headHeight = 50;
float headTwoX = 95;
float headTwoY = 105;
float headTwoWidth = 60;
float headTwoHeight = 30;
//LEFT ARM
float armLTX = 83;
float armLTY = 93;
float armLRX = 115;
float armLRY = 120;
float armLLX = 100;
float armLLY = 120;
float armLX = 83;
float armLY = 107;
//WATER COVER
float waterLowElX = 110;
float waterLowElY = 120;
float waterLowElWidth = 90;
float waterLowElHeight = 20;
float waterLowRectX = 0;
float waterLowRectY = 115;
float waterLowRectWidth = 200;
float waterLowRectHeight = 300;
//BODY COVER
float grassLowRectY = 115;
//FACE
float eyeNoseColor = 15;
float eyeX = 72;
float eyeY = 85;
float eyeDiam = 5;
float noseX = 61;
float noseY = 92;
float noseWidth = 10;
float noseHeight = 9;
float earStroke = 3;
float earColorR = 46;
float earColorG = 38;
float earColorB = 17;
float earX = 89;
float earY = 75;
float earWidth = 18;
float earHeight = 11;
float innerEarX = 87;
float innerEarY = 77;
float innerEarWidth = 19;
float innerEarHeight = 13;
//PAWS
float rightPawX = 52;
float rightPawY = 105;
float leftPawX = 83;
float leftPawY = 100;
float pawWidth = 10;
float pawHeight = 14;
//PAWS II
float frontPawX = 83;
float frontPawY = 96;
float frontPawWidth = 8;
float frontPawHeight = 4;
//BRANCH
float branchStrokeW = 7;
float branchColorR = 49;
float branchColorG = 38;
float branchColorB = 16;
float segmentOneX = 25;
float segmentOneY = 110;
float segmentOneBX = 45;
float segmentOneBY = 108;
float segmentTwoBX = 78;
float segmentTwoBY = 101;
float segmentThreeBX = 90;
float segmentThreeBY = 99;
float segmentFourBX = 110;
float segmentFourBY = 110;
//TEETH
float toothColor = 255;
float leftToothX = 60;
float rightToothX = 64;
float toothY = 100;
float toothWidth = 3;
float toothHeight = 8;

float change = 1;
int   state = 0;
float speed = 0.5;
float waterDir = 0.5;
float water2Dir = 0.5;


void setup() {
  size(200,200);
}

void draw() {
  smooth();
  noStroke();
  ellipseMode(CENTER);
  
  mouseY = constrain(mouseY, 70, 185);
  
  //GRASS AND DIRT
  fill(grassR, grassG, grassB);
  rect(grassX, grassY, grassWH, grassWH);
  
  //TAIL
  fill(tailR, tailG, tailB);
  ellipse(tailX, tailY, tailWidth, tailHeight);
  tailY = mouseY - 30;
  
  //ARM
  fill(armR, armG, armB);
  quad(armTopX, armTopY, armBottomX, armBottomY, armRightX, armRightY, armLeftX, armLeftY);
  armTopY = mouseY - 2;
  armBottomY = mouseY + 15;
  armRightY = mouseY + 30;
  armLeftY = mouseY + 12;
  
  //BODY
  fill(bodyColorR, bodyColorG, bodyColorB);
  strokeWeight(bodyStrokeWeight);
  stroke(bodyStrokeR, bodyStrokeG, bodyStrokeB);
  ellipse(bodyX, bodyY, bodyWidth, bodyHeight);
  noStroke();
  ellipse(headX, headY, headWidth, headHeight);
  ellipse(headTwoX, headTwoY, headTwoWidth, headTwoHeight);
  bodyY = mouseY;
  headY = mouseY - 10;
  headTwoY = mouseY + 5;
  
  //LEFT ARM
  fill(armR, armG, armB);
  quad(armLTX, armLTY, armLRX, armLRY, armLLX, armLLY, armLX, armLY);
  armLTY = mouseY - 7;
  armLRY = mouseY + 20;
  armLLY = mouseY + 20;
  armLY = mouseY + 7;
    
  //BODY COVER
  fill(grassR, grassG, grassB);
  noStroke();
  rect(waterLowRectX, grassLowRectY, waterLowRectWidth, waterLowRectHeight);
  grassLowRectY = mouseY + 15;

  //FACE
  noStroke();
  fill(eyeNoseColor);
  ellipse(eyeX, eyeY, eyeDiam, eyeDiam);
  ellipse(noseX, noseY, noseWidth, noseHeight);
  strokeWeight(earStroke);
  stroke(earColorR, earColorG, earColorB);
  ellipse(earX, earY, earWidth, earHeight);
  noStroke();
  fill(bodyColorR, bodyColorG, bodyColorB);
  ellipse(innerEarX, innerEarY, innerEarWidth, innerEarHeight);
  eyeY = mouseY - 15;
  noseY = mouseY - 8;
  earY = mouseY - 25;
  innerEarY = mouseY - 23;
  
  //PAWS
  fill(armR, armG, armB);
  ellipse(rightPawX, rightPawY, pawWidth, pawHeight);
  ellipse(leftPawX, leftPawY, pawWidth, pawHeight);
  rightPawY = mouseY + 5;
  leftPawY = mouseY;
  
  //BRANCH
  noFill();
  strokeWeight(branchStrokeW);
  stroke(branchColorR, branchColorG, branchColorB);
  line(segmentOneX, segmentOneY, segmentOneBX, segmentOneBY);
  line(segmentOneBX, segmentOneBY, segmentTwoBX, segmentTwoBY);
  line(segmentTwoBX, segmentTwoBY, segmentThreeBX, segmentTwoBY);
  line(segmentThreeBX, segmentThreeBY, segmentFourBX, segmentFourBY);
  segmentOneY = mouseY + 10;
  segmentOneBY = mouseY +8;
  segmentTwoBY = mouseY + 1;
  segmentThreeBY = mouseY - 1;
  segmentFourBY = mouseY + 10;
  
  //TEETH
  noStroke();
  fill(toothColor);
  rect(leftToothX, toothY, toothWidth, toothHeight);
  rect(rightToothX, toothY, toothWidth, toothHeight);
  toothY = mouseY;

  //PAWS II
  fill(armR, armG, armB);
  ellipse(frontPawX, frontPawY, frontPawWidth, frontPawHeight);
  frontPawY = mouseY - 4;
  
  //WATER COVER
  fill(waterR, waterG, waterB, 200);
  //ellipse(waterLowElX, waterLowElY, waterLowElWidth, waterLowElHeight);
  rect(waterLowRectX, waterLowRectY, waterLowRectWidth, waterLowRectHeight);
  waterR = waterR + waterDir;
  waterG = waterG + waterDir;
  waterB = waterB + waterDir;
  if (waterR <= 64 || waterR >= 40) {
    waterDir = speed * -1;
  }
  
  //FLOOD
    waterLowRectY = waterLowRectY - speed;
  if ((waterLowRectY < 25) || (waterLowRectY > 200)) {
    speed = speed * -1;
  }


  
  

}

