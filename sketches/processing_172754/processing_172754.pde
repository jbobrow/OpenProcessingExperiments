


int ballX;//declaaring ballX
int ballY;//decaring ballY
int ballSpeedX = 10;//how fast the ball moves left and right
int ballSpeedY = 10;// how fast the ball moves up and down
int paddleHeight = 30;//how tall/ the height of the paddle 
int paddleColor;


void setup() {
  size(800, 600);//size of canvas
  noCursor();//hides the mouse
  ballX = width/2;
  ballY = height/2;
  //puts the ball in the middle of the canvas
}
//declaring
void draw() {
  background(92,175,192);//makes background teal
  moveBall();
  checkCollide();
  drawPaddle();
  drawBall();
}

void moveBall() {
  ballX = ballX + ballSpeedX;//makes the ball move 5 or -5 pixels to the left or right 
  ballY = ballY + ballSpeedY;// makes ball move 5 untis or -5 unitsup or down continously
println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY);//prints ballspeedX & Y to the console
}
//makes the ball go back the other way if it gets to less than 0(the left side of the canvas) or pass the width of the canvas(the right side of the canvas)
void checkCollide() {
  if (ballX < 0 || ballX > width) {
    ballSpeedX = ballSpeedX * -1;
  }

 
  
  if (ballY > height-paddleHeight || ballY < paddleHeight)  {
    if (ballX > mouseX && ballX < mouseX + 200) {
      ballSpeedY = ballSpeedY * -1;
    } else {
    fill(255,0,0);//makes the paddle,ball and text red
      text("GAME OVER TRY AGAIN!", width/2, height/2);//writes the words "GAME OVER TRY AGAIN" in the middle of the canvas
      noLoop();
    }
  }
}

void drawBall() {
  stroke(0);//makes the ball have a line/border around it
  ellipse(ballX, ballY, 20, 20);//makes the ball
  fill(251,142,0);//makes the color of the ball inside gold
}
//makes the paddles
void drawPaddle() {
  stroke(paddleColor);
  strokeWeight(5);//how thick the stroke is
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight);//makes the height and width of the paddle
  rect(mouseX, 0,200,paddleHeight);//makes the height and width of the second paddle on top
}
 
void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255)));
}

void keyPressed() {
  if (key == 'b' || key == 'B') {//changes the shade of the paddle
    fill(0);
  } if (key == 'w' || key == 'W') {//changes the shade of the paddle
    fill(255);
  }
}
