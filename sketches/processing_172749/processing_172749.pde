
// set initial variables
int ballX; // x-location of the ball
int ballY;  // y-location of the ball
int ballSpeedX = 5; // speed for ballX is 5 so whenever this variable is used, the ball will change horizontally
int ballSpeedY = 5; //speed for ballY is 5 so whenever this variable is used, the ball will change vertically
int paddleHeight = 30; // the height of the paddle (rect) is 30
int paddleColor; // color of the paddle
int score = 0; // starting score is 0
boolean run = true; // the variable is true 
void setup() {
  size(800, 600); // set canvas size to 800x600
  noCursor(); // hide cursor
  ballX = width/2; /// starts the ball in the 
  ballY = height/2; // middle of the canvas
}

void draw() {
  background(128); // background color is gray
 // functions (actions)
  if (run = true) { // these actions will work only if the variable is true
  moveBall(); // ball moves in X and Y directions
  checkCollide(); // checks for collision with walls or paddle
  drawPaddle(); // re-draws paddle
  drawBall();// re-draws ball 
   text("score = "+score,10,10); // text Ã¢ï¿½ï¿½scoreÃ¢ï¿½ï¿½ is going to show up with the numbers increasing in a certain position 
}
else { noLoop(); // does not repeat if the statement is false
} 
}

void moveBall() {
  ballX = ballX + ballSpeedX; // ballX + 5 (speed)
  ballY = ballY + ballSpeedY; // ballY + 5 (speed)
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); // writes Ã¢ï¿½ï¿½ballspeedX:Ã¢ï¿½ï¿½ _ , Ã¢ï¿½ï¿½ballSpeedY:Ã¢ï¿½ï¿½ _ to the console area
}

void checkCollide() { // if we've reached an edge, reverse speed
  if (ballX < 0 || ballX > width) {
    ballSpeedX = ballSpeedX * -1; // negate and reverse
  }
  if (ballY < 0) { 
    ballSpeedY = ballSpeedY * -1; // negate and reverse
  }
  if (ballY > height-paddleHeight) { // ballY is greater than paddleHeight // past Ã¢ï¿½ï¿½goal lineÃ¢ï¿½ï¿½
    if (ballX > mouseX && ballX < mouseX + 200) { // when ball is between the paddle space, the ball hits paddle
      ballSpeedY = ballSpeedY * -1; // negate (goes up)
         score++; // the number is going to increase 1 everytime the ball hit the paddle
    } else {
      text("GAME OVER!", width/2, height/2); // position of the text
      noLoop(); // no repeat
    }
  }
}

void drawBall() {
  noStroke(); // disables drawing the outline
  ellipse(ballX, ballY, 20, 20); // ball is in the point ballX, ballY and the width and height
 
}

void drawPaddle() {
  stroke(paddleColor); // color for the stroke of the paddle
  strokeWeight(4); // thickness
  rect(mouseX, height-paddleHeight-4, 100, paddleHeight); // (x,y,width,height) of the rectangle (paddle) 
// -4 is to show the bottom outline of the rectangle
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255))); // map(value, start1, stop1, start2, stop2)
// replaces the range 0,800 to 0,255 for its color
}

void keyPressed() {
  if (key == 'b' || key == 'B') { // if key Ã¢ï¿½ï¿½bÃ¢ï¿½ï¿½ or Ã¢ï¿½ï¿½BÃ¢ï¿½ï¿½ is pressed, fill ball/paddle black 
    fill(0);
  }
  if (key == 'w' || key == 'W') { // if key Ã¢ï¿½ï¿½wÃ¢ï¿½ï¿½ or Ã¢ï¿½ï¿½WÃ¢ï¿½ï¿½ is pressed, fill ball/paddle white
    fill(255);
  }
  
   int k = keyCode; // detect special keys  

  if (k == 'S') { // if the special key is pressed 
    if (looping)  noLoop(); // if the actions are continuing, then stop repeating
    else          loop(); // keep repeating the actions
}
