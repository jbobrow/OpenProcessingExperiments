
// Upper left of robotine to put robot in the middle of screen
final int ROBOT_X = 160;
final int ROBOT_Y = 130;

// Robotine's vertical midpoint and arm pivot points
final int MIDPOINT_X = 2*39; // body place 14 + body width 25 = 50/2
final int LEFT_PIVOT_X = 2*12;
final int RIGHT_PIVOT_X = 2*66;
final int PIVOT_Y = 2*32;
// Robotine's horizontal bottom of body and leg pivot points
final int BOTTOMPOINT_Y = 2*82;
final int LEFTLEG_PIVOT_X = 2*38;
final int RIGHTLEG_PIVOT_X = 2*40;

float leftArmAngle = 0.0; // initial left arm angle
float rightArmAngle = 0.0; // initial right arm angle
float leftLegAngle = 0.0; // initial left leg angle
float rightLegAngle = 0.0; // initial right leg angle

void setup() 
{
  size(800, 800);
  smooth();
  frameRate(30); // normal is 60
}

void draw() 
{
  // define mouseX and mouseY linked to robotine rather than to window
  float mX;
  float mY;
  
  background(230);
  
  pushMatrix();
  scale(2);
  translate(ROBOT_X, ROBOT_Y); // place robotine in middle
  mX = mouseX - 2*ROBOT_X;
  mY = mouseY - 2*ROBOT_Y;
  
  if (mY < BOTTOMPOINT_Y)
  {
    if (mX < MIDPOINT_X) // left side of robotine
    {
      leftArmAngle = atan2(mY - PIVOT_Y, mX - LEFT_PIVOT_X) - HALF_PI;
    }
    else // right side of robotine
    {
      rightArmAngle = atan2(mY - PIVOT_Y, mX - RIGHT_PIVOT_X) - HALF_PI;
    }
  }
  else
  {
    if (mX < MIDPOINT_X) // left side of robotine
    {
      leftLegAngle = atan2(mY - PIVOT_Y, mX - LEFTLEG_PIVOT_X) - HALF_PI;
    }
    else // right side of robotine
    {
      rightLegAngle = atan2(mY - PIVOT_Y, mX - RIGHTLEG_PIVOT_X) - HALF_PI;
    }
  }
  drawRobot(); // function drawRobot
  popMatrix();
}

void drawRobot() {
  noStroke();
  fill(255, 105, 180); // pink
  rect(20, 0, 38, 30); // head
  rect(14, 32, 50, 50); // body
//  rect(22, 84, 16, 50); // left leg
//  rect(40, 84, 16, 50); // right leg
  fill(255); // 
  ellipse(30, 12, 12, 12); // left eye
  ellipse(47, 12, 12, 12); // right eye
  fill(255, 20, 147); // other pink for contrast
  drawLeftArm(); // function left arm
  drawRightArm(); // function right arm
  drawLeftLeg(); // function left leg
  drawRightLeg(); // function right leg

}

void drawLeftArm() 
{  
  pushMatrix();
  translate(12, 32); // pivot point
  rotate(leftArmAngle);
  rect(-12, 0, 12, 37); // left arm
  popMatrix();
}

void drawRightArm() 
{  
  pushMatrix();
  translate(66, 32); // pivot point
  rotate(rightArmAngle);
  rect(0, 0, 12, 37); // right arm
  popMatrix();
}

void drawLeftLeg() 
{  
  pushMatrix();
  translate(36, 84); // pivot point
  rotate(leftLegAngle);
  rect(22-36, 84-84, 16, 50); // left leg
  popMatrix();
}

void drawRightLeg() 
{  
  pushMatrix();
  translate(40, 84); // pivot point
  rotate(rightLegAngle);
  rect(40-40, 84-84, 16, 50); // right leg
  popMatrix();
}


