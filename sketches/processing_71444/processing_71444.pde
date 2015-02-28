
class Ball { //Make a class called "Ball."
  float xPos; //Control horizontal position.
  float yPos; //Control vertical position.
  int ballSize; //Control size.
  float xVel = 3; //Modify horizontal position.
  float yVel = 0; //Modify vertical position.
  float grav = .3; //Modify yVel to simulate gravity.

  Ball(float x, float y, int s) { //This is the constructor for the Ball object. No "void" function necessary.
    xPos = x; //Set the global variable xPos (which is available for use anywhere) equal to the local variable x, which only exists
    //inside the constructor. That way we can give values to an instance of the Ball object through the constructor then use those
    //values elsewhere by copying them into xPos.
    yPos = y; //Ditto.
    ballSize = s; //Ditto.
  }

  void drawBall() {
    noFill();
    ellipse(xPos, yPos, ballSize, ballSize); //Now we draw the ellipse using the values entered in the constructor (see note above).
  }

  void updateBall() {
    yPos += yVel; //Update yPos each frame with yVel.
    yVel += grav; //Update yVel each frame with grav.
    if (yVel > 7.8) {
      yVel = 7.8; //Control how high the ball bounces by putting a limit on yVel. That way if the ball falls from a great height it
    //doesn't bounce up again to the same height. This isn't real physics (or anywhere close), folks.
    }
    
    if (yPos >= height - (ballSize / 2)) { //Did the ball hit the ground?
      yVel = (yVel - grav) * -1; //Reverse its motion (and subtract gravity at that frame only to counter the gravity that is being added
      //at that frame; otherwise the ball would keep bouncing higher and higher.
    }

    for (int i = 0; i < myPlats.length; i++) { //Time for collision detection! Super cool and super important! We run through the same
    //for loop as on the main tab because we are going to check the ball's position relative to each Platform in the array.
      if ((xPos >= myPlats[i].xPos) && (xPos <= (myPlats[i].xPos + myPlats[i].platWidth))) { //At each value of i (aka array element
      //in this case), is the ball's xPos within the width of the Platform at that array element?
        if ((yPos >= myPlats[i].yPos) && (yPos <= (myPlats[i].yPos + 10))) { //Assuming we got a positive result above, is the ball's
        //yPos within the upper part of the Platform at that array element?
          yVel = -7.8; //If Yes to both above, the ball has hit the top of that Platform. Give the ball a set yVel so it "bounces" off
          //the Platform the same amount as it "bounces" off the ground.
        }
        else if ((yPos >= (myPlats[i].yPos + 10)) && (yPos <= (myPlats[i].yPos + myPlats[i].platHeight))) { //Ah, but what if the yPos
        //is within the lower part of the Platform at that array element?
          yVel = (yVel - grav) * -1; //In that case the ball has hit the bottom of that Platform, so we reverse the direction (once again
          //nullifying the gravity addition at this frame, which keeps the ball from going faster and faster in the same space) just as if
          //the ball had hit the ground.
        }
      }
      if ((xPos >= myPlats[9].xPos) && (xPos <= (myPlats[9].xPos + myPlats[9].platWidth))) { //Is the ball within the width of the last
      //(and winning) Platform?
        if ((yPos >= myPlats[9].yPos) && (yPos <= (myPlats[9].yPos + 10))) { //If yes, is its vertical position within the upper part of
        //that Platform?
          bounced = true; //If yes to both, the player has bounced the ball on the Winning platform, so we set the winning condition
          //boolean to "true."
        }
      }
    }

    if (keyPressed) { //Let's control the ball.
      if (keyCode==RIGHT && xPos <= width-(ballSize / 2)) { //If the player presses the right-directional arrow key and the ball is not
      //at the right edge of the screen...
        xPos += xVel; //...move the ball right based on the xVel.
      }
      else if (keyCode==LEFT && xPos >= 0 +(ballSize / 2)) { //If the player presses the left-directional arrow key and the ball is not
      //at the left edge of the screen...
        xPos -= xVel; //...move the ball left based on the xVel.
      }
    }
  }
}


