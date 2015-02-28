
int armAngle = 0;
int angleChange = 20;
final int ANGLE_LIMIT = 50;

void setup()
{
  size(200, 200);
  smooth();
  frameRate(30);
}

void draw()
{
  background(156,196,187);
  pushMatrix();
  translate(50, 50); // place robot so arms are always on screen
  drawRobot();
  armAngle += angleChange;
  
  // if the arm has moved past its limit,
  // reverse direction and set within limits.
  if (armAngle > ANGLE_LIMIT || armAngle < 0)
  {
    angleChange = -angleChange;
    armAngle += angleChange;
  }
  popMatrix();
}

void drawRobot()
{
  noStroke();

  fill(255, 197, 3);
  ellipse(70,10 , 45, 45); // head
  ellipse(25, 32, 70, 70); // body
  fill(0);
  ellipse(73,7, 12, 12); // left eye
  fill(255,95,3);
  triangle(90,10,110,23,85,26);
  rect(20, 65, 8, 35); // left leg
  rect(30, 65, 6, 30); // right leg
  fill(255,175,0);
  drawLeftArm();
  
  
 
}

void drawLeftArm()
{
  pushMatrix();
  rotate(radians(armAngle));
  rect(20, 10, 40, 40); // left arm
  popMatrix();
}


//code was borrowed from 2-d transformation tutorial on processing.organd reappropriated

