
// global variables, able to be used in all functions
int ballX;              // x-location of the ball
int ballY;              // y-location of the ball
int ballSpeedX = 5;     // speed of the ball horizontally
int ballSpeedY = 5;     // speed of the ball vertically
int paddleHeight = 30;  // height of the paddle
int paddleColor;        // color of the paddle
 
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
    ballSpeedX = ballSpeedX * -1.1; // causes the ball to speed up when it hits the sides 
  }
  
  // top edge
  if (ballY < 0) {
 
   text("GAME OVER!", width/2, height/2);
      noLoop();    //when the ball hits the the top part where the paddle is not at, than it would say game over and the loop will end
    
  }
  
  // paddle
  if ((ballY > height-paddleHeight)||(ballY<50)) { // this is what makes the ball bounce from the top and bottom paddle, depending on their hegith and what co-ordinate they're in
    if (ballX > mouseX && ballX < mouseX + 200) { // within paddle
      ballSpeedY = ballSpeedY * -1;   // switch Y direction
    
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
  strokeWeight(1); // border thickness of 4px
  
  // y-value is always at the bottom, minus height of paddle, minus border of paddle
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight);
  
  rect(mouseX, height/paddleHeight/4, 200, paddleHeight);
}

 
void mousePressed() {
  // takes the values of mouseX between 0 and width and scales between 0-255
  paddleColor = int((map(mouseX, 0, width, 0, 255)));
}
 
void keyPressed() {
  // changes ball/paddle to black/white
    if (key == 'b' || key == 'B') {
    fill(random(0,150,255),random(0,150,255),random(0,150,255))//will fill the paddle with different colors many times when w key is pressed
  }
  if (key == 'w' || key == 'W') {
    fill (random(0,150,255),random(0,150,255),(0,150,255)); //will fill the paddle with different colors many times when w key is pressed
 }
}
