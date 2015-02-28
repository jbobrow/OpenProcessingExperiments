
class Ball { //The class for the ball

    //Initialization of the ball's variables
  PVector ballLocation; //The location of the ball
  PVector ballSpeed; //The speed of the ball
  color ballColor = color(255); //The color of the ball - defaults as white
  int canNextBallBeHitTimer = 0; //The time before the next hit is allowed - this is to stop a glitch that lets a ball hit more then one brick at a time

  Ball(float ballSpawnLocationX, float ballSpawnLocationY, float inputBallSpeedX, float inputBallSpeedY) { //Takes the nessessary inputs and creates a new ball with these properties

    //Declaration of the ball's variables
    this.ballLocation = new PVector(ballSpawnLocationX, ballSpawnLocationY); //Sets the inputed location to the new ball
    this.ballSpeed = new PVector(inputBallSpeedX, inputBallSpeedY); //Sets the speed of the ball
  }

  void renderBall(int ballNumber) { //Renders the ball

    //Movement of the ball
    if (!pauseState) { //If the game isn't paused
      this.ballLocation.x += this.ballSpeed.x; //Moves ball horizantally by the horizantal speed
      this.ballLocation.y += this.ballSpeed.y; //Moves ball vertically by the vertical speed
    }

    //Collision of the ball with the walls
    if (this.ballLocation.x < BALL_SIZE && this.ballSpeed.x < 0) this.ballSpeed.x = -this.ballSpeed.x; //If the ball moves to the left and hits the left wall, reflect the ball
    if (this.ballLocation.x > SCREEN_SIZE - BALL_SIZE && this.ballSpeed.x > 0) this.ballSpeed.x = -this.ballSpeed.x; //If the ball moves to the right and hits the right wall, reflect the ball
    if (this.ballLocation.y < BALL_SIZE && this.ballSpeed.y < 0) this.ballSpeed.y = -this.ballSpeed.y; //If the ball moves up and hits the top wall, reflect the ball
    if (this.ballLocation.y - BALL_SIZE > SCREEN_SIZE) numBalls.remove(ballNumber); //If the ball goes past the bottom of the screen, remove it

    //Collision of the ball with the paddle
    if (this.ballLocation.x + BALL_SIZE/2 > playerPaddle.paddleLocation.x //If the ball is right of the left side of the paddle
    && this.ballLocation.x - BALL_SIZE/2 < playerPaddle.paddleLocation.x + paddleSize.x //If the ball is on the left of the right side of the paddle
    && this.ballLocation.y + BALL_SIZE/2 > playerPaddle.paddleLocation.y //If the ball is past the top of the paddle
    && this.ballLocation.y + BALL_SIZE/2 < playerPaddle.paddleLocation.y + paddleSize.y //If the ball is above the bottom of the paddle
    && this.ballSpeed.y > 0) { //If the ball is moving downwards (as to stop a glitch which causes the ball to vibrate when bouncing off the paddle)
      if (this.ballLocation.x > playerPaddle.paddleLocation.x + paddleSize.x/2) //If the ball hits on the right side of the paddle
        this.ballSpeed.x = dist(playerPaddle.paddleLocation.x + paddleSize.x/2, 0, this.ballLocation.x, 0)/HORIZANTAL_SPEED_SENSITIVITY; //Angle towards the right side in proportion to the distance of the ball with the middle of the paddle
      else //If the ball hits on the left side of the paddle
      this.ballSpeed.x = -dist(playerPaddle.paddleLocation.x + paddleSize.x/2, 0, this.ballLocation.x, 0)/HORIZANTAL_SPEED_SENSITIVITY; //Angle towards the left side in proportion to the distance of the ball with the middle of the paddle
      this.ballSpeed.y = -this.ballSpeed.y; //Reflect the ball vertically
    }

    //Collision of the ball with a brick
    for (int brickNumber = 0; brickNumber < numBricks.size(); brickNumber++) { //Checks all currently rendering bricks
      if (this.ballLocation.x + BALL_SIZE/2 >= numBricks.get(brickNumber).brickLocation.x //If the ball's right side is past the left side of the brick
      && this.ballLocation.x - BALL_SIZE/2 <= numBricks.get(brickNumber).brickLocation.x + BRICK_SIZE.x //If the ball's left side is past the right side of the brick
      && this.ballLocation.y + BALL_SIZE/2 >= numBricks.get(brickNumber).brickLocation.y //If the ball's bottom is past the top of the brick
      && this.ballLocation.y - BALL_SIZE/2 <= numBricks.get(brickNumber).brickLocation.y + BRICK_SIZE.y) { //If the ball's top is above the bottom of the brick

        if ((this.ballLocation.x < numBricks.get(brickNumber).brickLocation.x && this.ballSpeed.x > 0) //If the ball hits the left side of the brick
        || (this.ballLocation.x > numBricks.get(brickNumber).brickLocation.x + BRICK_SIZE.x && this.ballSpeed.x < 0)) this.ballSpeed.x = -this.ballSpeed.x; //Or if the ball hits the right side of the brick, reflect it back
        if ((this.ballLocation.y < numBricks.get(brickNumber).brickLocation.y && this.ballSpeed.y > 0) //If the ball hits the top side of the brick
        || (this.ballLocation.y > numBricks.get(brickNumber).brickLocation.y + BRICK_SIZE.y && this.ballSpeed.y < 0)) this.ballSpeed.y = -this.ballSpeed.y; //Or the ball hits the bottom of the brick, reflect the ball vertically

          if (this.canNextBallBeHitTimer <= 0) { //If the timer allows another block to be destroyed

          //The power-up drop code of the brick      
          if (int(random(CHANCE_OF_POWER_UP)) == 0) //If the random chance happens in which a power-up should be dropped
            numPowerUps.add(new PowerUp(numBricks.get(brickNumber).brickLocation.x + BRICK_SIZE.x/2, 
            numBricks.get(brickNumber).brickLocation.y + BRICK_SIZE.y/2)); //Spawns a power-up at that brick's location

          this.ballColor = numBricks.get(brickNumber).brickColor; //Transfers the color of the brick to the ball
          numBricks.remove(brickNumber); //Removes the hit block if the ball is allowed to destroy a block
          this.canNextBallBeHitTimer = MINIMUM_TIME_BEFORE_NEXT_HIT; //Resets the hit timer
        }
      }
    }

    if (stickBallToPaddle) //If the ball must be stuck to the paddle
        this.ballLocation = new PVector(playerPaddle.paddleLocation.x + paddleSize.x/2, playerPaddle.paddleLocation.y - BALL_SIZE/2); //Move the ball just above the paddle

    canNextBallBeHitTimer--; //Decreases the hit timer by one

    //Drawing of the ball
    fill(this.ballColor); //Colors white
    ellipse(this.ballLocation.x, this.ballLocation.y, BALL_SIZE, BALL_SIZE); //Draws the ball
  }
}


