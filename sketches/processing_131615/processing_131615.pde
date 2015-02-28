
float armAngle = 0;
float angleChange = 0.2;
final float ANGLE_LIMIT = 135;

void setup()
{
  size(500,500);
  smooth();
  frameRate(30);
  
}

void draw()
{
  background(0);
  pushMatrix();
  translate(width/2, 100); // place robot so arms are always on screen
  drawLegoMan();
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

void drawLegoMan(){
  fill(255,255,0);
  //noStroke();
  pushMatrix();
  
  
  rect(0,0,20,10); //top
  rect(-16,10,50,40); //head
  
  fill(255);
  ellipse(-5,25,15,15); //eye1
  ellipse(15,25,15,15); //eye2
  
  fill(0,0,100);
  rect(-27,51,75,80); //body
  
  fill(240,240,0);
  triangle(0,51, 10,61, 20,51); //chest
  
  fill(255);
  ellipse(13,71,7,7); //buttons 4x
  ellipse(13,86,7,7);
  ellipse(13,101,7,7);
  ellipse(13,116,7,7);
  
  drawLeftArm();
  drawRightArm();
  
  /*fill(235,235,0);
  rect(-42,106,15,15); //hand1
  rect(48,106,15,15); //hand2
  */
  
  fill(0,0,255);
  rect(-27,130,75,10); //belt
  
  rect(-27,140,36,50); //leg1
  rect(12,140,36,50); //leg2
  
  popMatrix();
}

void drawLeftArm(){
  fill(0,0,100);
  pushMatrix();
  translate(-27,61);
  rotate(armAngle);
  rect(-15,0,15,45); //arm1
  popMatrix();
}

void drawRightArm(){
  fill(0,0,100);
  pushMatrix();
  translate(48,61);
  rotate(-armAngle);
  rect(0,0,15,45); //arm2
  popMatrix();
}


