
//sets variables for  the speed, position , and sizes
float ballX;
float ballY;
float ballSpeedX = 5;
float ballSpeedY = 5;
float ballSize =40;
int paddleHeight = 30;
int paddleColor;
int score=0;

void setup() {
  size(800, 600);
  noCursor();
  rectMode(CENTER);
  ballX = width/2;//starts the ball
  ballY = height/2; // at the middle
}

void draw() {
  background(128); // sets background to gray color
  //call corresponding function
  moveBall();
  checkCollide();
  drawPaddle();
  drawBall();
  text("Score:" + score,width/2,20);
  if(score==20){ // checks if your score is 20
  text("You Won!!", width/2, height/2); // writes You Won!! on the canvas
    noLoop(); // stops running the code
  }
   if (ballSize<=0) {
      text("You Win!!", width/2, height/2); // writes You Win!! on the canvas
      noLoop(); // stops running the code
    }
}

void moveBall() {
  ballX = ballX + ballSpeedX; // moves the ball left or right according to ballSpeedX
  ballY = ballY + ballSpeedY;  // moves the ball up or down according to ballSpeedY
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY + ", ballSize: " + ballSize); //shows the speed and size of the ball
}



void checkCollide() {
  if (ballX < 0 || ballX > width) { //tests it touching right or left sides
    ballSpeedX = ballSpeedX * -1; // changes the horizontal direction of ball
  }

  if (ballY < 0) { // checks if ball touches top
    ballSpeedY = ballSpeedY * -1; // changes vertical direction of ball
  }

  if (ballY > height-39) { // checks if past the "goal line"

    if (ballX > mouseX-150 && ballX < mouseX - 50) { // checks if ball is touching the left side of paddle
      ballSpeedY = ballSpeedY * -1.09; // changes vertical direction of ball and 
      ballSpeedX = ballSpeedX * 1.05;// speeds up the ball
      score++;
      
    } else if (ballX > mouseX-50 && ballX < mouseX + 50) { // checks if ball touching the right side paddle
      ballSpeedY = ballSpeedY * -1; // changes vertical direction of ball
      ballSize-=random(2); //makes the size of the ball decrease by a number between 1 and 2 
      score++; //increases the score
    }
    else {
    text("GAME OVER!", width/2, height/2); // writes GAME OVER! on the canvas
    noLoop(); // stops running the code
  }

   
  } 
}


void drawBall() {
  noStroke(); // makes no outline
  ellipse(ballX, ballY, ballSize, ballSize);// draws circle on the coordinates made by the variables
}

void drawPaddle() {
  stroke(paddleColor);//changes the outline color to the var. paddleColor
  strokeWeight(4); //makes the outline thick
  rect(mouseX, height-(paddleHeight/2)-4, 100, paddleHeight);// draws a paddle where ever the mouse is
  fill(76, 65, 65);
  rect((mouseX-100), height-(paddleHeight/2)-4, 100, paddleHeight);// draws a paddle where ever the mouse is
  fill(paddleColor);//changes the outline color to the var. paddleColor
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255))); //sets paddle color to a number from 0-255 based on the horizontal location of the mouse
}

void keyPressed() {
  if (key == 'b' || key == 'B') { // checks if b is pressed
    fill(0); //makes the color of shapes black
  }
  if (key == 'w' || key == 'W') { // checks if w is pressed
    fill(255); //makes color of shapes white
  }
}

