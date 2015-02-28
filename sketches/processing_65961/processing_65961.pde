
class Robot {
  float x;
  float y;
  color eyeColor = #ffffff;
  float armLength;
  float leftArmAngle= 135;
  float rightArmAngle= 45;
  float maxLeftArmAngle = 270;
  float minLeftArmAngle = 105;
  float maxRightArmAngle = 75;
  float minRightArmAngle = -90;
  int moveSpeed = 1;
  boolean isIncreasingLeft = true;
  boolean isIncreasingRight = true;

  Robot(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void moveLeftArm() {
    if (isIncreasingLeft == true) {
      leftArmAngle += 1; 
      if (leftArmAngle >= maxLeftArmAngle) {
        isIncreasingLeft = false;
      }
    }
    if (isIncreasingLeft == false) {
      leftArmAngle -= 1; 
      if (leftArmAngle <= minLeftArmAngle) {
        isIncreasingLeft = true;
      }
    }
  }

  void moveRightArm() {
    if (isIncreasingRight == true) {
      rightArmAngle -= 1; 
      if (rightArmAngle <= minRightArmAngle) {
        isIncreasingRight = false;
      }
    }
    if (isIncreasingRight == false) {
      rightArmAngle += 1; 
      if (rightArmAngle >= maxRightArmAngle) {
        isIncreasingRight = true;
      }
    }
  }

  void moveRobot() {
    if (x>=300 || x<=250) {
      moveSpeed = -moveSpeed;
    }
    x += moveSpeed;
  }

  void changeEyeColor() {
    if (frameCount % 70 == 20) {
      eyeColor = #ff00ff;
    } 
    else if (frameCount % 70 == 40) {
      eyeColor = #ffff00;
    } 
    else if (frameCount % 70 == 60) {
      eyeColor = #0000ff;
    }
    println(frameCount % 80);
  }


  void display() {
    stroke(100);
    strokeWeight(3);
    pushMatrix();
    translate(x, y);
    fill(0);
    rect(0, 0, 100, 50);//head
    fill(eyeColor);
    ellipse(25, 25, 33, 33);//left eye
    ellipse(75, 25, 33, 33);//right eye
    fill(0);
    ellipse(25, 25, 5, 5);//left pupil
    ellipse(75, 25, 5, 5);//right pupil
    translate(50, 50);
    fill(180);
    rect(-10, 0, 20, 20);//neck
    line(-10, 4, -5, 4);
    line(-10, 8, -5, 8);
    line(-10, 12, -5, 12);
    translate(0, 20);
    fill(0);
    rect(-70, 0, 140, 120);//body
    translate(0, 120);
    strokeWeight(10);
    ellipse(-80, 0, 12, 100);//left wheel
    ellipse(80, 0, 12, 100);//right wheel
    strokeWeight(3);
    translate(0, -60);
    line(-70, -50, armLength * cos(radians(leftArmAngle)) - 70, armLength * sin(radians(leftArmAngle)) - 50);//left arm
    line(70, -50, armLength * cos(radians(rightArmAngle)) + 70, armLength * sin(radians(rightArmAngle)) - 50);//right arm
    popMatrix();
  }
}


