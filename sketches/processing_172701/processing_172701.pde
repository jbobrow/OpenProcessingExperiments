
int ballX; //ball at x units
int ballY; //ball at y units
int ballSpeedX = 5; //initial speed of ball horizontally 
int ballSpeedY = 5; //initial speed of ball vertically 
int paddleHeight = 30; //paddle height
int paddleColor; //paddle color

void setup() {
  size(800, 600); //canvas size
  noCursor(); //cursor not visible on screen
  ballX = width/9; //ball appearance x units
  ballY = height/9; //ball appearance y units
}

void draw() {
  background(128); //keeps background on single grey color 
  moveBall(); //ball moves
  checkCollide(); //collision check
  drawPaddle(); //paddle appears
  drawBall(); //ball appears
}

void moveBall() {
  ballX = ballX + ballSpeedX; //x unit of ball when ball moves at 5 
  ballY = ballY + ballSpeedY; //y unit of ball when ball moves at 5
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); //prints 5 , 5
}

void checkCollide() {
  if (ballX < 0 || ballX > width) { //when ball collides on the walls
    ballSpeedX = ballSpeedX * -1; //ball speed changes from negative or positive
    ellipse(mouseX,mouseY,30,30);
    fill(250);
  }
  if (ballY < 0) { //top
    ballSpeedY = ballSpeedY * -1; //then speed * -1
    ellipse(mouseX,mouseY,30,30);
    fill(250);
  }
  if (ballY > height-paddleHeight) { //past goal line
    if (ballX > mouseX && ballX < mouseX + 200) { //within paddle
      ballSpeedY = ballSpeedY * -1; //ball speed y units is * -1
      ellipse(mouseX,mouseY,40,40);
    fill(255);
    } else { //if it does miss paddle
      text("GAME OVER!", width/2, height/2); //game over is printed 
      noLoop();
    }
  }
}

void drawBall() { 
  noStroke(); 
  ellipse(ballX, ballY, 20, 20); //draws ball
}

void drawPaddle() {
  stroke(paddleColor); //color of outline
  strokeWeight(4); //outline thickness color
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight); //draws rectangle 
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255))); //paddle color changes from white to black
}

void keyPressed() {
  if (key == 'b' || key == 'B') { //when B or b is pressed
    fill(0); //color is black
  }
  if (key == 'w' || key == 'W') { //when w or W pressed
    fill(255); //color is white
  }
if(key == 'g' || key == 'G') { //when g or G pressed
fill(160); //color is grey
}
}
