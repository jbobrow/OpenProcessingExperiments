
// guidance for classes and initial object-oriented code provided by Jane (then modified by me). Thanks, Jane!

class ball { // bouncy ball, which player does not control directly
  float rBall, gBall, bBall; //color

  float xBall; //xpos
  float yBall; //ypos

  float wBall; //width
  float hBall; //height

  float xVelBall; //movement in x-direction.
  float yVelBall; //movement in y-direction.

  float gravBall; //control height of bounce.

  void setupBall() {    
    xBall = width/2;
    yBall = height/1.5;

    wBall = 30;
    hBall = 30;

    xVelBall = 0;
    yVelBall = 0;

    gravBall = 0.7;

    rBall = (255);
    gBall = (0);
    bBall = (0);
  }

  void updateBall() {
    xBall += xVelBall; //make ball move on x-axis.
    yBall += yVelBall; //make ball move on y-axis.

    yVelBall += gravBall; //modify velocity to control height of bounce relative to the surface.

    if (yVelBall > 19) { //make sure ball bounces only so high relative to the ground (regardless of initial elevation; this isn't quite real physics).
      yVelBall = 19;
    }

    if (xBall <= 0 || xBall >= width) { //bounce off side walls.
      xVelBall*= -1;
    }

    if (yBall <= 0 || yBall >= height) { //bounce off ceiling and floor.
      yVelBall = (yVelBall - gravBall) * -1; //prevent gravity from adding at the moment that the yVel changes direction
      //(stops the ball from bouncing ever higher).
      xVelBall *= 0.85; //use friction to limit the horizontal bouncing.
    }
    
    if (gameState == 1) { //check if this is level 1 in order to count the juggling tally.
       if (yBall >= height - hBall/2){
         score = 0;
       }
    }

    if (gameState == 2) { //check if this is level 2 in order to interact with the correct platforms.

      if ((xBall >= 250) && (xBall <= 450) && (yBall >= 300) && (yBall <= 320)) { //ball hits top of the first platform
        yVelBall = -19;
      }
      if ((xBall >= 250) && (xBall <= 450) && (yBall >= 330) && (yBall <= 350)) { //ball hits bottom of the first platform
        yVelBall = (yVelBall - gravBall) * -1;
      }

      if ((xBall >= 450) && (xBall <= 650) && (yBall >= 150) && (yBall <= 170)) { //ball hits top of the second platform
        yVelBall = -19;
      }
      if ((xBall >= 450) && (xBall <= 650) && (yBall >= 180) && (yBall <= 200)) { //ball hits bottom of the second platform
        yVelBall = (yVelBall - gravBall) * -1;
      }

      if ((xBall >= 500) && (xBall <= 600) && ((yBall + 15) >= 130) && ((yBall + 15) <= 150)) { //ball hits top of the goal.
        gameState++; //player beat level. Change game screen.
      }
    }

    //    println(dist(xBall, yBall, mouseX, mouseY)); //debug distance.
    //    println(gameState); //debug gameState.
  }

  void drawBall() {
    fill(rBall, gBall, bBall);
    ellipse(xBall, yBall, wBall, hBall);
    //    println(yVelBall); debug.
  }
}


