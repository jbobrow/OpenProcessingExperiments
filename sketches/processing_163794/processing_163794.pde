

void setup() {
  size(600, 600);
  ballX = width/2;
  ballY = height/2;
  noStroke();
  rectMode(CENTER);
  //textMode(CENTER);
}

void draw() {
  noCursor();
  background(0);

  if (gameMode == 1) {
    drawBall(40);
    drawPaddles(10, 90,20,width-20,20,height-20);
  }

  if (click != true) {
    drawOpenText();
  }

  if (click == true && gameMode != 0) {

    moveBall();
    bounceBall(10, 90,20,width-20,20,height-20,40);
  }

  gameEnd(40);
}
float ballX;
float ballY;
float xSpeed = 3;
float ySpeed = 1;
float x = 0;

boolean click = false;

int gameMode = 1;
void drawBall(float ballRadius) {
  fill(247, 247, 45);
  ellipse(ballX, ballY, ballRadius, ballRadius);
}

void drawPaddles(int paddleShort, int paddleLong, int paddleXa, int paddleXb, int paddleYa, int paddleYb) {
  stroke(0);
  fill(247, 247, 45);
  rect(paddleXa, mouseY, paddleShort, paddleLong);
  rect(paddleXb, mouseY, paddleShort, paddleLong);

  rect(mouseX, paddleYa, paddleLong, paddleShort);
  rect(mouseX, paddleYb, paddleLong, paddleShort);
}

void moveBall() {
  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;
}

void bounceBall(int paddleShort, int paddleLong, int paddleXa, int paddleXb, int paddleYa, int paddleYb, float ballRadius) {
  if (ballX+ballRadius/2>paddleXb-paddleShort/2) {
    if (ballY>mouseY-paddleLong/2 && ballY<mouseY+paddleLong/2) {
      xSpeed *=-1.2;
      ballX = (paddleXb - paddleShort/2)-ballRadius;
    }
  }
  if (ballX-ballRadius/2<paddleXa+paddleShort/2) {
    if (ballY>mouseY-paddleLong/2 && ballY<mouseY+paddleLong/2) {
      xSpeed *=-1.2;
    }
  }

  if (ballY+ballRadius/2>paddleYb-paddleShort/2) {
    if (ballX>mouseX-paddleLong/2 && ballX<mouseX+paddleLong/2) {
      ySpeed *=-1.2;
      ballY = (paddleYb - paddleShort/2)-ballRadius;
    }
  }
  if (ballY-ballRadius/2<paddleYa+paddleShort/2) {
    if (ballX>mouseX-paddleLong/2 && ballX<mouseX+paddleLong/2) {
      ySpeed *=-1.2;
      
    }
  }
}

void drawOpenText() {
  String s = "CLICK TO PLAY";
  fill(255);
  textSize(30);
  text(s, 190, 200, 300, 200);
}

void mouseClicked() {
  click = true;
  if (gameMode ==0) {
    click = false;
    gameMode = 1;
    ballX = width/2;
    ballY = height/2;
    xSpeed = 4;
    ySpeed = 3;
    
  }
}

void gameEnd(float ballRadius) {
  if (ballX-ballRadius/2>=600||ballX+ballRadius/2<=0||ballY-ballRadius/2>=600||ballY+ballRadius/2<=0) {
    String g = "GAME OVER";
    fill(247, 230, 45);
    textSize(50);
    text(g, 220, 250, 300, 200);
    String t = "click to try again";
    fill(100);
    textSize(25);
    text(t, 205, 400, 300, 200);

    gameMode = 0;
  }
}


