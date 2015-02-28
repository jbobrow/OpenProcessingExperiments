
int x = 800;
int y = 800;
int score = 2;
int playerA = 0;
int playerB = 0;

int ballX;
int ballY;
int ballDir = 5;
int ballSize = 10;  // Radius
float ballAngle = 0.0;  // Direction

// Global variables for the paddle
int paddleWidth = 20;
int paddleHeight = 70;

int wallGap = 50;
/*---------------------------------------------------------------*/
void setup() {
  size (x, y);
  ballY = height/2;
  ballX = 0;
  background(25);
}
/*---------------------------------------------------------------*/
void draw() {
  cursor(CROSS);
  background(25);
  float r = random(50, 255);
  float g = random(100, 255);
  float b = random(50, 255);
  stroke(r, g, b);
  for (int i=10;i<=height;i+=40) {
    rect(x/2, i, 1, 10);
  }
  theGame();
}

/*---------------------------------------------------------------*/
void theGame() {
  ballX += ballDir * 2;
  ballY += ballAngle;

  if (ballX > width+ballSize*2) {
    ballX = -ballSize;
    ballY = int(random(0, height-ballSize));
    ballAngle = 0;
    println(ballX + ":" + ballY + ":" + ballAngle);
  }
  if (ballX < -ballSize*2) {
    ballX = width;
    ballY = int(random(0, height-ballSize));
    ballAngle = 0;
    println(ballX + ":" + ballY + ":" + ballAngle);
  }
  // Constrain paddle to screen
  float paddleY = constrain(mouseY, 0, height-paddleHeight);
  // Test to see if the ball is touching the paddle
  float py = width-wallGap-ballSize;
  float px = wallGap+ballSize+10;
  if ((ballX >= py && (ballY+ballSize >= paddleY && ballY <= paddleY + paddleHeight))
    || ballX <= px && (ballY+ballSize <= paddleY && ballY <= paddleY + paddleHeight)) { 
    ballDir *= -1;
    if (mouseY != pmouseY) {
      ballAngle = (mouseY-pmouseY)/2.0;
      ballAngle = constrain(ballAngle, -5, 5);
    }
  }  
  // If ball hits back wall, reverse direction
  if ((ballX < 0) || ballX > x) {
    ballDir *= -1;
  }
  // If the ball is touching top or bottom edge, reverse direction
  if ((ballY > height-ballSize) || (ballY < 0)) {
    ballAngle = ballAngle * -1;
  }
  // Draw ball
  if ((ballX < 0) || ballX > x) {
    fill(125, 80, 10);
  }
  colors();
  rect(ballX, ballY, ballSize, ballSize);
  // Draw the paddle
  
  rect(width-wallGap-10, paddleY, paddleWidth, paddleHeight);  
  // Draw the paddle
  rect(wallGap, height-paddleY-paddleHeight, paddleWidth, paddleHeight);   
  // Score Boards

  if (ballX == x) {
    playerA+=1;
        fill(100,225,50);
    stroke(100,225,50);
      }
  if (ballX == 0) {
    playerB+=1; 
        fill(100,225,50);
    stroke(100,225,50);
  }  
  String pa = String.valueOf(playerA/2);
  String pb = String.valueOf(playerB/2);
  println(pa + " " + pb);
  textSize(25);
  text(pa, 150, 50);
  text(pb, 650, 50);
  gameOver();
}
/*---------------------------------------------------------------*/
void colors() {
  fill(114, 234, 227); 
  stroke(114, 234, 227);
  strokeWeight(5);
}
/*---------------------------------------------------------------*/
void gameOver() {
  if ((playerA/2 == score) || playerB/2 == score) {
    setup(); 
    text("GAME OVER!", 350, 100); 
    if (playerA > playerB) {
      text("Player A Wins!", 350, 150);
    }
    else {
      text("Player B Wins!", 350, 150);
    }
    text("Do you want to play again?(y/n)", 245, 200);
    if (keyPressed) {
      if (key == 'y' || key == 'Y') {
        draw();
      }
      else {
        exit();
      }
    }
  }
}

/*---------------------------------------------------------------*/




