
//*******************************
//Ball CLASS
class Ball {

  private float x;
  private float y;
  
  private float speed = 0;
  private float minSpeed = 2;
  private float maxSpeed = 10;

  private float slopeX = 5;
  private float slopeY = 5;


  //for working out the ratio of x to y traveled (using scary trig)
  float angle;
  float trigX;
  float trigY;

  float lastTime=0;

  private int ballDiameter = 20;
  boolean playing = true;
  int id;


  //Constructor *********
  Ball (float x, float y, int id) {

    this.x = x;
    this.y = y;
    this.id = id;

    angle = (float)(Math.atan2(slopeY, slopeX));
    trigX = (float)Math.cos(angle);
    trigY = -(float)Math.sin(angle);
  }
  //********

  void update() {

    if (playing) {
      moveBall();
      testWallCollision();
      testPaddleCollision();
    } else {
      //set paddle off screen
      x = width+300;
    }
  }

  void display() {

    if (playing) {
      fill(255);
      ellipseMode(CENTER);
      ellipse(x, y, ballDiameter, ballDiameter);
    }
  }


  void testWallCollision() {

    if (x >= width) {

      x = width - ballDiameter/2;
      trigX = -trigX;
    }

    else if (x - ballDiameter/2 < wall) {

      x = ballDiameter/2 + wall;
      trigX = -trigX;
    }

    else if (y >= height) {

      //add point to other team
      if (speed>0){
      updateScore(1); 
      resetPosition();
      }
    }

    else if (y< 0) {

      //add point to other team
      if (speed>0){
      updateScore(2); 
      resetPosition();
      }
    }
  }

  void testPaddleCollision() {
    //check if ball is in the paddle area of the screen (e.g. the top and bottom)

    //TOP PADDLE AREA
    if (y < (globalPaddleHeight+10) + ballDiameter*0.5) {

      //so this ball needs to check hits against the top paddles 0,1,2
      for (int i = 0; i < paddle.length/2; i++) {

        int pX = paddle[i].getX();
        int pY = paddle[i].getY();

        //THE HIT TEST

        // IF BALL IS IN THE X RANGE
        if (x-(ballDiameter/2) <= (pX + paddle[i].getWidth()) && x + (ballDiameter/2) >= pX ) {

          //reset Y position as normal
          y = ballDiameter*0.5 + pY + paddle[i].getHeight();

          //change speed
          if (trigX < 0) {
            speed += paddle[i].getPaddleDir()*0.3;
          } 
          else {
            speed -= paddle[i].getPaddleDir()*0.3;
          }

          //reverse Y direction
          trigY = -trigY;

          //***************************************
        }
      }
    }

    //BOTTOM PADDLE AREA
    else if (y >= height - (globalPaddleHeight+10) ) {

      //so this ball needs to check hits against the bottom paddles 2,3
      for (int i = paddle.length/2; i < paddle.length; i++) {

        int pX = paddle[i].getX();
        int pY = paddle[i].getY();  

        //THE HIT TEST

        // IF BALL IS IN THE X RANGE
        if (x-(ballDiameter/2) <= (pX + paddle[i].getWidth()) && x+(ballDiameter/2) >= pX ) {

          //reset Y position
          y = (pY) - ballDiameter*0.5;

          //change speed
          if (trigX < 0) {
            speed += paddle[i].getPaddleDir()*0.3;
          } 
          else {
            speed -= paddle[i].getPaddleDir()*0.3;
          }

          //reverse Y direction
          trigY = -trigY;
        }
      }
    }
  }

  void playing(boolean bp) {
    playing = bp;
  }

  void moveBall() {

    //check speed not too fast or too slow
    if (speed > maxSpeed) {
      speed = maxSpeed;
    }
    else if (speed < minSpeed) {
      if (speed != 0) {
      speed = minSpeed;
      }
    }
    
    /* TIME FIX  */
    //see how many ticks elapsed since last update
    float eleapsedTicks = millis() - lastTime;
    //update lastTime to new time
    lastTime = millis();
    float tempSpeed = eleapsedTicks * speed*0.05;

    //Move X and Y
    x += tempSpeed * trigX;
    y += tempSpeed * trigY;

    //take angle and speed and calculate actual pixel offset
    //rotate a point by angle
  }

  void changeAngle(float sX, float sY) {

    angle = (float)(Math.atan2(sY, sX));
    trigX = (float)Math.cos(angle);
    trigY = (float)Math.sin(angle);
  }

  void setSpeed(int tspeed) {
    speed = tspeed;
  }
  
  void setX(int tx) {
    x = tx;
  }


  void resetPosition() {
    y=height/2;
  }
}


