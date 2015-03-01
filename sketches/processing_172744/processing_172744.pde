
float ballX; //sets the 
float ballY; //balls integers
float ballSpeedX = 5; //speed of the
float ballSpeedY = 5; //balls movement
float paddleHeight = 30; //height of the paddle
float paddleColor; //color of the paddle
float points = 0; //sets the points on top left




void setup() {
  size(800, 600); //screen size
  noCursor();   //removes cursor
  ballX = width/2;  //sets the starting 
  ballY = height/2;  //position of the ball
}

void draw() {
  background(128); //sets background color
  moveBall();  //balls movement
  checkCollide(); //checks if the ball collides with anything
  drawPaddle();  //draws the shape of the paddle on the bottom
  drawBall();    //draws the shape of the ball
  
    text("Score is " + points, 10, 30); //adds a point every time it touches the paddle
    
fill(random(0, 255),random(0, 255),random(0, 255)); //sets a random color
  for (int i=0; i<=20; i++) {  
    textSize(32); //sets the text size to 32
}}

void moveBall() {
  ballX = ballX + ballSpeedX; //sets the movement
  ballY = ballY + ballSpeedY; //of the ball
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); //prints the status
}

void checkCollide() {
  if (ballX < 0 || ballX > width) { //switches direction of x
    ballSpeedX = ballSpeedX * -1; //changes direction of the ball
  }
  if (ballY < 0) { //top edge 
    ballSpeedY = ballSpeedY * -1; //changes direction of the ball (y)
  }
  if (ballY > height-paddleHeight) {
    if (ballX > mouseX && ballX < mouseX + 200) {    //changes direction of ball if it 
      ballSpeedY = ballSpeedY * -1.2;                          //hits the paddle
      points = points + 1;  //adds a point to the the score
    } else {
      text("GAME OVER!", width/2, height/2);              //prints game over if you miss.
      noLoop();
    }
  }
}

void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20); //sets size of the ball
}

void drawPaddle() {   //sets the paddle
  stroke(paddleColor); //to a size
  strokeWeight(4); //and follows the mouse
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight); //sets the paddle
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255)));  //picks a different number for color.
}

void keyPressed() {
  if (key == 'b' || key == 'B') {       //press b for black
    fill(0);
  }
  if (key == 'w' || key == 'W') {          //press w for white
    fill(255);
  }


  }
