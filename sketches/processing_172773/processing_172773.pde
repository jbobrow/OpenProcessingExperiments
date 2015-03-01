
// global variables, able to be used in all functions
int ballX;              // x-location of the ball
int ballY;              // y-location of the ball
int ballSpeedX = 5;     // speed of the ball horizontally
int ballSpeedY = 5;     // speed of the ball vertically
int paddleHeight = 30;  // height of the paddle
float paddleWidth = 200; //width of paddle
int paddleColor;        // color of the paddle
 int score = 0;         //initial points 
void setup() {
  size(800, 600);   // canvas size
  noCursor();       // hides the mouse
  ballX = width/2;  // start the ball in the
  ballY = height/2; //   middle of the canvas
    
}
 
void draw() {
  background(128); // resets the background
  moveBall();      // ball moves in X and Y directions
  checkCollide();  // checks for collision with walls or paddle
  drawPaddle();    // re-draws paddle
  drawBall();      // re-draws ball 
 text("Score =" +score, 10, 12); // Scoreboard and location of score 
 
}
 
void moveBall() {
  ballX = ballX + ballSpeedX; // updates ball location horizontally
  ballY = ballY + ballSpeedY; // updates ball location vertically
  
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
if (score == 10){ //When reached 10 points player wins
      text("YOU WIN!", width/2, height/2);
      noLoop();} //game ends
      
  if (ballY > height-paddleHeight) { // past 'goal line'
    if (ballX > mouseX && ballX < mouseX + paddleWidth) { // within paddle
      ballSpeedY = ballSpeedY * -1; // switch Y direction
      score = score + 1 ; 
      
    } else { // end game
      text("GAME OVER!", width/2, height/2);
      noLoop();
    }
  }
}
 
void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20); //location of ball and size
}
 
void drawPaddle() {
  stroke(paddleColor); // color of paddle border
  strokeWeight(4); // border thickness of 4px
  rect(mouseX, height-paddleHeight-4, paddleWidth, paddleHeight); //draws rectangle
  if (score <= 3){      //if less than or 3 points reached
  paddleWidth = paddleWidth - .15; //paddle will get smaller
  }
  if(score>3){ //if score is greater than 3
  paddleWidth = paddleWidth +.15; //paddle will get bigger
  }
  if (score > 5) {  //if score is 5 
  paddleWidth =paddleWidth -.15; //paddle will get smaller again 
  }
  if (paddleWidth == 0){ //if paddle is too small
  text ("TO SLOW",width/2,height/2); //what screen will say
  noLoop(); //game stops
}
 
}
 
void mousePressed() {
  // takes the values of mouseX between 0 and width and scales between 0-//255
  paddleColor = int((map(mouseX, 0, width, 0, 255)));
}
 
void keyPressed() {
  // changes ball/paddle to black/white
    if (key == 'b' || key == 'B') {
    fill(0);
  }
  if (key == 'w' || key == 'W') {
    fill(255);
  }
}


