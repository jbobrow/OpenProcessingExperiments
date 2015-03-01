
int ballX; //Declares a variable called ballX
int ballY; //Declares a variable called ballY
int ballZ;
int ballT;
int ballSpeedX = 7; //Sets the ballX speed to 6
int ballSpeedY = 7; //Sets the ballY speed to 6
int paddleHeight = 30; //Sets the paddle height to 30
int paddleColor; //Declares the paddle’s color

void setup() { //Sets the code up
  size(700, 700); //Sets the size of the canvas
  noCursor(); //Sets up the code with no mouse present 
  ballX = width/4; //Sets ballX equal to the width divided by 2
  ballY = height/4; //Sets ballY equal to the height divided by 2
}

void draw() { //Draws the variables listed below
  background(50); //Sets the background color to 50(Grey)
  moveBall(); //Declares a variable called moveBall
  checkCollide(); //Declares a variable called checkCollide
  drawPaddle(); //Draws the paddle from given parameters
  drawBall(); //Draws the ball from given parameters
}

void moveBall() { //Sets up how the ball will move
  ballY = ballX + ballSpeedX; //ballX is equal to ballX plus the speed of the ball
  ballX = ballY + ballSpeedY; //ballY is equal to ballY plus the speed of the ball
  println("ballSpeedX:  " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); //Adds up the 2 X, and the 2 Y values together
}

void checkCollide() { //Sets up how the ball will speed up or down
  if (ballX < 0 || ballX > width) { //If ballX is greater than 0 and ballX is less than the width, then decrease the ball’s speed by 1
        ballSpeedX = ballSpeedX * -1;
  }
  if (ballY < 1) { //If ballY is greater than 0, decrease the ball’s speed by 1
        ballSpeedX = ballSpeedY * -1;
  }
  if (ballY > height-paddleHeight) { //If ballY is greater than 0, then subtract the height from the paddle
        if (ballX > mouseX && ballX < mouseX + 200) { //If the ball is at a greater distance than the canvas, end the game.
          ballSpeedY = ballSpeedY * 1;
        } else {
          text("GAME OVER!", width/2, height/2);
          noLoop();
        }
  }
}

void drawBall() { //Draws the ball with no stroke
  noStroke();
  rect(ballX, ballY, 20, 20);
}

void drawPaddle() { //Draws a colored, rectangular paddle
  stroke(paddleColor);
  strokeWeight(0);
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight);
  ellipse(ballZ, height-paddleHeight-4, 200, paddleHeight);
  
}

void mousePressed() { //When the mouse is pressed, draw the paddle’s color
  paddleColor = int((map(mouseX, 20, width, 20, 255)));
}

void keyPressed() { //When a key is pressed, draw the different, randomly colored paddle
  if (key == 'b' || key == 'B') {
        fill(5);
  }
  if (key == 'w' || key == 'W') {
        fill(25);
  }
}

