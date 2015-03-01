
float ballX; //ball location on x axis
float ballY; //ball location on y axis
float ballSpeedX = 5;  // ball moves at a speed of 5 between left and right
float ballSpeedY = 5;  // ball moves at a speed of 5 between top and bottom 
float paddleHeight = 30; // the top of the paddle
float paddleColor; // outline of paddle color
float score = 0;

void setup() {
  size(800, 600);
  noCursor();  // don't show the mouse
  ballX = 100;  // ball starts in the
  ballY = 10; // middle of the canvas
}

void draw() {
  background(100);  // change background to remove the previously drawn circle 
  moveBall(); 
  checkCollide();
  drawPaddle();
  drawBall();
  textSize(15);
  text("score = " + score, 10, 15); // score board

}

void moveBall() { 
  ballX = ballX + ballSpeedX; // take the x location of ball and add 5 or -5 if moving left
  ballY = ballY + ballSpeedY; // take the y location of ball and add 5 or -5 if moving up
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); // print the speed the ball is going at 
}

void checkCollide() {
  if (ballX < 0 || ballX > width) { // if the ball touches the side of the canvas,
    ballSpeedX = ballSpeedX * -1; // bounce off and go in the opposite direction
      
}   
if (ballY < 0) { // if the ball touches top of the canvas,
    ballSpeedY = ballSpeedY * -1; // bounce off and go down
  } 
 if (ballY > height-paddleHeight) { // if ball goes past the goal line
    if (ballX > mouseX && ballX < mouseX + 200) { //if ball hits the paddle
      ballSpeedY = ballSpeedY * -1; 
      ballSpeedY = ballSpeedY + -1.5; //ball moves faster evertime it hits paddle
      score = score + 1; // score increase by 1
    } else {
      textSize(50);
      text("GAME OVER!", width/3, height/2); //game over will appear in the middle of the canvas
      noLoop(); // doesn't repeat
    }
  }
}

void drawBall() {
  noStroke(); //no outline 
  ellipse(ballX, ballY, 20, 20); //draw circle
}

void drawPaddle() {
  stroke(paddleColor); // color of paddle outline
  strokeWeight(4); //thickness of outline
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight); //draw rectangle
}

void mousePressed() { //when mouse is pressed, 
  paddleColor = int((map(mouseX, 0, width, 0, 255))); //change the color of outline of paddle depending on where the paddle is, black on left, gray in middle, white on right. 
}

void keyPressed() {
  if (key == ' ') { //if key b is pressed
    fill(random(0,255),random(0,255),random(0,255)); //change inside of the ball and paddle to random color 
  }
  if (key == 'b' || key == 'B') { //if key w is pressed
    fill(random(0,255)); //change inside of the ball and paddle to any random color on the grayscale 
  }
}

