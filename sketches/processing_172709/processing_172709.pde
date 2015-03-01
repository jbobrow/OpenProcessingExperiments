
// global variables, able to be used in all functions
int ballX;              // x-location of the ball
int ballX2;             //x-location of 2nd ball
int ballY2;             //y-location of 2nd ball
int ballSpeedY2=3;      //speed of 2nd ball moving vertically
int ballSpeedX2=3;      //speed of 2nd ball moving horizontally
int ballY;              // y-location of the ball
int ballSpeedX = 2;     // speed of the ball horizontally
int ballSpeedY = 2;     // speed of the ball vertically
int paddleHeight = 30;  // height of the paddle
int paddleColor;        // color of the paddle



void setup() {
  size(800, 400);   //canvas size
  background(198); //makes background gray 
  //noCursor();       //hides the mouse
  ballX = width/2;  //start the ball in the center
  ballY = height/2; //middle of the canvas
  ballX2=width/2;   //starts 2nd ball in center 
  ballY2=height/2;  //starts 2nd ball in middle
}

void draw() {
  background(0);//makes background change color
  moveBall();      // ball moves in X and Y directions
  checkCollide();  // checks for collision with walls or paddle
  drawPaddle();    // re-draws paddle
  drawBall();      // re-draws ball 
  drawBallA();     //draws 2nd ball
}

void moveBall() {
  ballX = ballX + ballSpeedX; // updates ball location horizontally
  ballY = ballY + ballSpeedY; // updates ball location vertically
  ballX2=ballX2+ballSpeedX2;  //updates 2nd ball location horizontally
  ballY2=ballY2+ballSpeedY2;  //updates 2nd ball location vertically

  // monitor speed/direction of ball
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY + "ballSpeedX2:" + ballSpeedX2 + "ballSpeedY2:" + ballSpeedY2);//updates all ball speeds
}

void checkCollide() {
  // left/right edge
  if (ballX < 0 || ballX > width) {//makes ball bounce in opposite directions if they touch x-line or width-line
    ballSpeedX = ballSpeedX * -1; // switch X direction
  }
  if (ballX2<0||ballX2>width) {
    ballSpeedX2=ballSpeedX2*-1;//change ballX2 direction
  }

  // top edge
  if (ballY < 0) {
    ballSpeedY = ballSpeedY * -1; // switch Y direction
  }
  if (ballY2<0) {
    ballSpeedY2=ballSpeedY2*-1;//change ballY2 position
  }

  // paddle
  if (ballY > height-paddleHeight-4-10) { // past 'goal line'
    if (ballX > mouseX-100 && ballX < mouseX + 100) {// within paddle
      ballSpeedY = ballSpeedY * -1; // switch Y direction
      ballSpeedY--;//speeds up 1st ball
    } else {//ends game if 1st ball passes paddle
      fill(255);//changes color text "YOU LOSE"
      text("YOU LOSE!!!!", width/2, height/2);
      noLoop();//ends game when ball passes paddle
    }
  }
  if (ballY2>height-paddleHeight-4-10) {
    if (ballX2>mouseX-100&&ballX2<mouseX+100) {
      ballSpeedY2=ballSpeedY2*-1;
    } else {// end game
      fill(255);//changes color of text "YOU LOSE"
      text("YOU LOSE!", width/2, height/2);
      noLoop();//ends game when ball passes paddle
    }
  }
}


void drawBall() {
  stroke(0);//makes line of ball black
  ellipse(ballX, ballY, 20, 20);//draws the 1st ball
}

void drawBallA() {
  stroke(0);//makes line of ball black
  fill(255, 0, 255);//makes ball pinkish color
  ellipse(ballX2, ballY2, 20, 20);//draws 2nd ball
}

void drawPaddle() {
  stroke(paddleColor); // color of paddle border
  strokeWeight(4); // border thickness of 4px

  // y-value is always at the bottom, minus height of paddle, minus border of paddle
  rectMode(CENTER);//makes mouse in the center 
  rect(mouseX, height-paddleHeight/2-4, 200, paddleHeight);//draw paddle 
}

void mousePressed() {
  // takes the values of mouseX between 0 and width and scales between 0-255
  paddleColor = int((map(mouseX, 0, width, 0, 255)));//sets color section for paddle
  background(random(0, 50), random(0, 50), random(0, 50));//makes background change color
}

void keyPressed() {
  // changes ball/paddle to black/white
  if (key == 'q' || key == 'Q') {//when key is pressed chages color of 2nd ball and paddle 
    fill(0, 0, 255);
  }
  if (key == 'w' || key == 'W') {//when key is pressed chages color of 2nd ball and paddle 
    fill(0, 255, 0);
  }
}








