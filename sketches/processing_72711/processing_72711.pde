
class Ball { //Make a class called "Ball."
  float xPos; //Control horizontal position.
  float yPos; //Control vertical position.
  int ballSize; //Control size.
  float xVel = 3; //Modify horizontal position.
  float yVel = 0; //Modify vertical position.
  float grav = .3; //Modify yVel to simulate gravity.
  float depth = 10; //Control how deep the ball can land on the platform (useful for collision detection).
  boolean jump = false; //Control when the ball can jump.
  boolean L, R = false; //Control when the ball can move.

  Ball(float x, float y, int s) { //This is the constructor for the Ball object. No "void" function necessary.
    xPos = x; //Set the global variable xPos (which is available for use anywhere) equal to the local variable x, which only exists inside the constructor. That way we can give values to an instance of the Ball object through the constructor then use those values elsewhere by copying them into xPos.
    yPos = y; //Ditto.
    ballSize = s; //Ditto.
  }

  void drawBall() {
    noFill();
    ellipse(xPos, yPos, ballSize, ballSize); //Now we draw the ellipse using the values entered in the constructor (see note above).
  }

  void updateBall() {
    if (jump == true) { //If jumping is allowed...
      yVel = -7.8; //...give the ball upward velocity. It's a jump!
      jump = false; //Immediately forbid jumping to prevent mid-air jumps.
    }
    if (R == true &&  xPos <= width-(ballSize / 2)) { //If rightward movement is allowed and the ball is not at the right edge of the screen...
      xPos += xVel; //...move the ball right based on the xVel.
    }
    if (L == true && xPos >= (ballSize / 2)) { //If leftward movement is allowed and the ball is not at the left edge of the screen...
      xPos -= xVel; //...move the ball left based on the xVel.
    }

    yPos += yVel; //Update yPos each frame with yVel.
    yVel += grav; //Update yVel each frame with grav.
    if (yVel > 7.8) {
      yVel = 7.8; //Impose terminal velocity to make collision detection easier.
    }

    if (yPos >= height - (ballSize / 2)) { //Did the ball hit the ground?
      if (yVel == 7.8) { //If it was going fast enough...
        yVel = -3; //...make it bounce a little.
      }
      else {
        yVel = 0; //Otherwise, bring it to rest (vertically).
      }
    }

    for (int i = 0; i < myPlats.length; i++) { //Time for collision detection! Super cool and super important! We run through the same for loop as on the main tab because we are going to check the ball's position relative to each Platform in the array.
      if ((xPos >= myPlats[i].xPos) && (xPos <= (myPlats[i].xPos + myPlats[i].platWidth))) { //At each value of i (aka array element in this case), is the ball's xPos within the width of the Platform at that array element?
        if ((yPos >= myPlats[i].yPos) && (yPos <= (myPlats[i].yPos + depth))) { //Assuming we got a positive result above, is the ball's yPos within the upper part of the Platform at that array element?
          if (yVel == 7.8) { //The ball hit the platform, so change its velocity appropriately.
            yVel = -3;
          }
          else {
            yVel = 0; //All of this is the same deal as when the ball hits the ground (see comments above).
          }
        }
        else if ((yPos >= (myPlats[i].yPos + depth)) && (yPos <= (myPlats[i].yPos + myPlats[i].platHeight))) { //Ah, but what if the yPos is within the lower part of the Platform at that array element?
          yVel = (yVel - grav) * -1; //In that case the ball has hit the bottom of that Platform, so we reverse the direction (nullifying the gravity addition at this frame).
        }
      }
      if ((xPos >= myPlats[9].xPos) && (xPos <= (myPlats[9].xPos + myPlats[9].platWidth))) { //Is the ball within the width of the last (and winning) Platform?
        if ((yPos >= myPlats[9].yPos) && (yPos <= (myPlats[9].yPos + depth))) { //If yes, is its vertical position within the upper part of that Platform?
          bounced = true; //If yes to both, the player has landed the ball on the Winning platform, so we set the winning condition boolean to "true."
        }
      }
    }
  }
}


