
float ballX; //Determines the location of
float ballY; // the ball
float ballSpeedX = 1; // and also determines
float ballSpeedY = 1; // the speed
float speedChange = 0.05; // and by how much the speed changes
int paddleHeight = 30;
int paddleColor; 
int start = 0; //allows the game to be started when wanted
int colorBP = 255; // color of Ball and Paddle
int bottomPaddle;
int topPaddle;
int leftPaddle;
int rightPaddle;

void setup() {
  size(800, 600);
  noCursor();
  textSize(40);
  ballX = width/2;
  ballY = height/2;
  bottomPaddle = width/2-100;
  topPaddle = width/2-100;
  leftPaddle = height/2-100;
  rightPaddle = height/2-100;
}

void draw() {
  background(128);
  moveBall();
  checkCollide();
  drawPaddle();
  drawBall();
}

void moveBall() {
  if(start >= 1){
    ballX = ballX + ballSpeedX;
    ballY = ballY + ballSpeedY;
    println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); //allows player to see the speed of the ball
  }else{
    textAlign(CENTER);
    fill(255, 0, 200);
    text("Press space to start!", width/2, height/2);
  }
}

void checkCollide() { //a lot of explanation for this code...
  if (ballX < paddleHeight) { //checks if the ball is in the left "dead zone"
    if(ballY > leftPaddle && ballY < leftPaddle+200){ //if the ball's where the paddle is...
      ballSpeedX = ballSpeedX - speedChange; //... make the ball go left faster
      if(ballSpeedY > 0){
        ballSpeedY = ballSpeedY + speedChange; //makes the ball go down
      }else{
        ballSpeedY = ballSpeedY - speedChange; //or up (depending if it was going up or down before hitting the paddle)faster
      }
      ballSpeedX = ballSpeedX * -1; //makes the ball go right
    }else{
      lose();
    }
  }
  if(ballX > width-paddleHeight){ //right "dead zone"
    if(ballY > rightPaddle && ballY < rightPaddle+200){
      ballSpeedX = ballSpeedX + speedChange;
      if(ballSpeedY > 0){
        ballSpeedY = ballSpeedY + speedChange;
      }else{
        ballSpeedY = ballSpeedY - speedChange;
      }
      ballSpeedX = ballSpeedX * -1; //ball goes left
    }else{
      lose();
    }
  }
  if (ballY < paddleHeight) { //top "dead zone"
    if(ballX > topPaddle && ballX < topPaddle+200){
      ballSpeedY = ballSpeedY - speedChange;
      if(ballSpeedX > 0){
        ballSpeedX = ballSpeedX + speedChange; //right or
      }else{
        ballSpeedX = ballSpeedX - speedChange; //left faster
      }
      ballSpeedY = ballSpeedY * -1; //ball goes down
    }else{
      lose();
    }
  }
  if (ballY > height-paddleHeight) { //bottom "dead zone"
    if (ballX > bottomPaddle && ballX < bottomPaddle + 200) {
      ballSpeedY = ballSpeedY + speedChange;
      if(ballSpeedX > 0){
        ballSpeedX = ballSpeedX + speedChange;
      }else{
        ballSpeedX = ballSpeedX - speedChange;
      }
      ballSpeedY = ballSpeedY * -1; //ball goes up
    } else {
      lose();
    }
  }
}

void drawBall() {
  noStroke();
  fill(colorBP);
  ellipse(ballX, ballY, 20, 20);
}

void drawPaddle() { //draws all  paddles...
  fill(colorBP);
  stroke(paddleColor);
  strokeWeight(4);
  rect(bottomPaddle, height-paddleHeight-4, 200, paddleHeight); //bottom paddle
  rect(topPaddle, 4, 200, paddleHeight); //top paddle
  rect(4, leftPaddle, paddleHeight, 200); //left paddle
  rect(width-paddleHeight-4, rightPaddle, paddleHeight, 200); //right paddle
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255)));
}

void keyPressed() {
  if (key == 'b' || key == 'B') {
    colorBP = 0;
  }
  if (key == 'w' || key == 'W') {
    colorBP = 255;
  }
  if(key == ' '){
    start++; //starts game :)
  }
  if(key == 's' || key == 'S'){
    bottomPaddle = bottomPaddle - 10; //bottom paddle goes left
  }
  if(key == 'w' || key == 'W'){
    topPaddle = topPaddle - 10; //top paddle goes left
  }
  if(key == 'a' || key == 'A'){
    leftPaddle = leftPaddle - 10; // left paddle goes up
  }
  if(key == 'd' || key == 'D'){
    rightPaddle = rightPaddle - 10; //right paddle goes up
  }
  if(key == CODED){
    if(keyCode == DOWN){
      bottomPaddle = bottomPaddle + 10; //bottom paddle goes right
    }
    if(keyCode == UP){
      topPaddle = topPaddle + 10; //top paddle goes right
    }
    if(keyCode == LEFT){
      leftPaddle = leftPaddle + 10; //left paddle goes down
    }
    if(keyCode == RIGHT){
      rightPaddle = rightPaddle + 10; //right paddle goes down
    }
  }
}

void lose() {
      text("GAME OVER!", width/2, height/2);
      noLoop();
}

