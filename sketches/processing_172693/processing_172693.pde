
int ballX; //declare variable
int ballY;//declare variable
int ballSpeedX = 5; //initialize variable
int ballSpeedY = 5;//initialize variable
int paddleHeight = 30;//set variable to #
int paddleColor; //name of variable


void setup() {
  size(800, 600);//set canvas size
  noCursor();
  ballX = width/2; //center of screen
  ballY = height/2;

}

void draw() {
  background(128);//grey color
  moveBall();
  checkCollide();
  drawPaddle();
  drawBall();
}

void moveBall() {
  ballX = ballX + ballSpeedX;//ball moves down
  ballY = ballY + ballSpeedY;//ball moves right
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY);//print current ball speed
}

void checkCollide() {
  if (ballX < 0 || ballX > width) { //check if ball touch left or right edge
    ballSpeedX = ballSpeedX * -1;//bounce it back
  }
  if (ballY < 0) {// check if its touching top side
    ballSpeedY = ballSpeedY * -1;// bounce it back
  }
  if (ballY > height-paddleHeight-30) {// check if ball pass paddle “goal line” made the goal line //30px higher
    if (ballX > mouseX-100 && ballX < mouseX + 100) {//check if touching paddle( rect is 
//drawn from middle, check 100 to the right and 100 to the left, making up 200 width)
      ballSpeedY = ballSpeedY * -1; //bounce it back
    } else {
      text("GAME OVER!", width/2, height/2);// if all fails print Game over in the middle
      noLoop();//stop 
    }
  }
}

void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20);//draw the ball
}

void drawPaddle() {
  stroke(paddleColor); 
  rectMode(CENTER);//draw rect from the middle 
  strokeWeight(4);//the outline of padd;e, set to 4
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight); //draws the paddle from mouse
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255)));//change the color range from greyscale
}

void keyPressed() {
  if (key == 'b' || key == 'B') {//pressing B or b
    fill(0);//change ball and paddle to black
  }
  if (key == 'w' || key == 'W') {//pressing W or w
    fill(255);//change ball and paddle to white
  }
}


