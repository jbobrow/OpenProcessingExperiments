
class Robot {
  float x;
  float y;
  float yRestrictionUpper = y + 50;
  float yRestrictionLower = y + 200;
  float scalar;
  float rollSpeed;
  float w_head = random(25, 30);
  float h_head = random(15, 25);
  //========================================//
  float leftEye = random(13, 17), rightEye = random(5, 13);
  float eyeMovementL = 0.1;
  float eyeMovementR = 0.1;
  //========================================//
  float leftArm = random(35, 45), rightArm = random(40, 50);
  float armMovementL = 0.1;
  float armMovementR = 0.1;
  //========================================//
  float yFeet = w_head*2 + h_head + 7;
  float wheelies = 1;
  //========================================//
  float yBody = h_head + w_head + 4;
  float wBody = 30;
  float bubbles = yFeet + 23;
  float bubbleSize = 3;
  float bubbleMovement = random(0.05, 0.15);
  
  
  // Robot Constructor
   Robot(float x_in, float y_in, float scalar_in, float rollSpeed_in) {
     x = x_in;
     y = y_in;
     scalar = scalar_in;
     rollSpeed = rollSpeed_in;
   }
   
   
   void display() {
      pushMatrix();
      translate(x, y);
      scale(scalar);
      // head
      fill(0);
      rect(2, 0, w_head, h_head);
      fill(255);
      ellipse(5, 5, leftEye, leftEye);
      ellipse(20, 5, rightEye, rightEye);

      // body
      fill(0);
      ellipse(15, yBody, wBody, w_head*2);
      noStroke();
      rect(0, yBody, wBody, w_head + 1);

      stroke(1);
      // hands
      fill(255);
      rect(-10, leftArm, 10, 10);
      rect(30, rightArm, 10, 10);

      // bottom body
      fill(0);
      rect(0, yFeet, 30, 20);
      fill(255);
      for(int i = 0; i < 30; i += 5) {
        for(int j = 0; j < 20; j += 5) {
          rect(wheelies + i, yFeet + 1 + j, 3, 3);
        }
      }
      
      noStroke();
      // floaty thingy
      for(int i = 0; i < 30; i += 5) {
          for(int j = 0; j < 25; j += 5) {
              if ( j == 0) {
                ellipse(wheelies + 2 + i, bubbles + j, bubbleSize, bubbleSize);
              }
              else if (j == 5 && i < 25) {
                ellipse(wheelies + 4 + i, bubbles + j, bubbleSize, bubbleSize);
              }
              else if (j == 10 && i < 20) {
                ellipse(wheelies + 6 + i, bubbles + j, bubbleSize, bubbleSize);
              }
          }
      }
          

      popMatrix();
     
    }
   
   void move() {
     // move whole body
     y = constrain(y, yRestrictionUpper, yRestrictionLower);
     y += rollSpeed;
     if ( y < yRestrictionUpper || y > yRestrictionLower) {
       rollSpeed = -rollSpeed;
     }
     
     
     // call on other functions so draw only calls on move function
     moveEyes();
     moveArms();
     moveBubbles();
   }
   
   
   void moveEyes() {
     leftEye = constrain(leftEye, 10, 20);
     leftEye += eyeMovementL;
     if(leftEye > 20 || leftEye < 10) {
       eyeMovementL = - eyeMovementL;
     }
     
     rightEye = constrain(rightEye, 5, 25);
     rightEye += eyeMovementR;
     if(rightEye > 25 || rightEye < 5) {
       eyeMovementR = -eyeMovementR;
     }
     
     
   }
   
   
   void moveArms() {
     leftArm = constrain(leftArm, 35, 45);
     leftArm += armMovementL;
     if (leftArm < 35 || leftArm > 45) {
       armMovementL = -armMovementL;
     }

     rightArm = constrain(rightArm, 40, 50);
     rightArm -= armMovementR;
     if (rightArm < 40 || rightArm > 50) {
       armMovementR =  -armMovementR;
     }
    
   }
  
  void moveBubbles() {
    bubbles = constrain(bubbles, yFeet + 22, yFeet + 25);
    bubbles += bubbleMovement;
    bubbleSize += bubbleMovement; 
    if (bubbles < yFeet+22 || bubbles > yFeet + 25) {
      bubbleMovement = -bubbleMovement;
    }
    bubbleSize = constrain(bubbleSize, 2, 4);
       
  } 
  
  
  
}

