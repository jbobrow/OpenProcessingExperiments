
// global variables, able to be used in all functions
int ballX;              // x-location of the ball
int ballY;              // y-location of the ball
int ballSpeedX = 5;     // speed of the ball horizontally
int ballSpeedY = 5;     // speed of the ball vertically
int paddleHeight = 30;  // height of the paddle
int paddleColor;        // color of the paddle
int score1 = 0;

void setup() {
  size(900, 600);   // canvas size
  noCursor();       // hides the mouse
  ballX = width/2;  // start the ball in the
  ballY = height/2; //   middle of the canvas
}

void draw() {
  background(95); // resets the background
  moveBall();      // ball moves in X and Y directions
  checkCollide();  // checks for collision with walls or paddle
  drawPaddle();    // re-draws paddle
  drawBall();      // re-draws ball
}

void moveBall() {
  ballX = ballX + ballSpeedX; // updates ball location horizontally
  ballY = ballY + ballSpeedY; // updates ball location vertically
 textSize(30);              //increases the text/font size to 30
  text("SCORE:"+score1,width/8,height/8); //sort of a scoreboard, keeps track of your score

  // monitor speed/direction of ball
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY);
}

void checkCollide() {
  // left/right edge
  if (ballX < 0 || ballX > width) {
    ballSpeedX = ballSpeedX * -1; // switch X direction
  }

  // top edge
  if (ballY < 0) {
    ballSpeedY = ballSpeedY * -1; // switch Y direction
  }

  // paddle
  if (ballY > height-paddleHeight) { // past 'goal line'
    if (ballX > mouseX && ballX < mouseX + 200) { // within paddle
      
      score1 ++;  //after the ball touches the paddle^^  increase the score value by 1
     //commented out because it doesnt worok with openprocessing!--- delay(200); pause the game for 200 milliseconds... action taken after the score increases
        ballSpeedY = ballSpeedY * -1; // switch Y direction
    } else { // end game
      text("GAME OVER!", width/2, height/2);
      noLoop();
    }
  }
}

void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20);
}

void drawPaddle() {
  stroke(paddleColor); // color of paddle border
  strokeWeight(4); // border thickness of 4px

  // y-value is always at the bottom, minus height of paddle, minus border of paddle
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight);
}

void mousePressed() {
  // takes the values of mouseX between 0 and width and scales between 0-255
  paddleColor = int((map(mouseX, 0, width, -745, -955)));
  

}

void keyPressed() {
  // changes ball/paddle to black/white
  if (key == 'b' || key == 'B') {
    fill(0);
  }
  if (key == 'w' || key == 'W') {
    fill(255);
  }
  if (key == 'e' || key == 'E') { //if E or e is pressed, exit the whole window
    exit();
  }
}



