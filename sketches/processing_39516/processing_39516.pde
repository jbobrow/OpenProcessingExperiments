
PImage backdrop;
float pongX1;
float pongX2;
float pongX3;
float textW;
int topBorder = 80;
int rightBorder;
int bottomBorder;
int paddleY;
int ballDia;
float ballX;
float ballY;
float ballChangeX = 5.5;
float ballChangeY;
int score = 0;
int highScore = 0;
String rollingText = "JON PONG";


void setup() {

  size(700, 400);
  rightBorder = (width -100);
  bottomBorder = (height - 20);
  noStroke();
  smooth();
  backdrop = loadImage("backdrop.jpg");
  
  //text start
  textW = textWidth(rollingText);
  pongX1 = 0 - textW;
  pongX2 = width*-.33-textW;
  pongX3 = width*-.66-textW;

  //ball start
  ballDia = 20;
  ballX = random(50, rightBorder-100);
  ballY = random(topBorder + ballDia, bottomBorder - ballDia);
  ballChangeY = random(1, 3);
}

void draw() {

  image(backdrop, 0, 0, width, height);



  //border
  fill(80);
  rect(0, topBorder-20, 700, 20);
  rect(rightBorder, 60, 100, 400);
  rect(0, bottomBorder, 700, 20);

  //score
  fill(255);
  text("Score:", 624, 150);
  text(score, 645, 172);
  text("High", 627, 270);
  text("Score:", 623, 290);
  text(highScore, 645, 312);

  //text
  textSize(20);
  text(rollingText, pongX1, 40);
  text(rollingText, pongX2, 40);
  text(rollingText, pongX3, 40);
  pongX1 = pongX1 + 1;
  pongX2 = pongX2 + 1;
  pongX3 = pongX3 + 1;

  if (pongX1 >= 700) {
    pongX1 = -textW;
  }
  if (pongX2 >= 700) {
    pongX2 = -textW;
  }
  if (pongX3 >= 700) {
    pongX3 = -textW;
  }

  //paddle
  if ((mouseY-25) <= 82) {
    paddleY = 82;
  } 
  else if ((mouseY-25) >=  328) {
    paddleY = 328;
  }
  else {
    paddleY = mouseY-25;
  }

  rect(20, paddleY, 5, 50);



  //GAME RESET
  if (ballX + ballDia*.5 >= 18) {
    
    //ball
    ellipse(ballX, ballY, ballDia, ballDia);
    ballX = ballX + ballChangeX;
    ballY = ballY + ballChangeY;

    //ball bouncing
    if (ballX + ballDia*.5 >= rightBorder) {
      ballChangeX = ballChangeX * -1;
    }
    if (((ballY - ballDia*.5) <= topBorder) || ((ballY + ballDia*.5) >=bottomBorder-1)) {
      ballChangeY = ballChangeY * -1;
    }



    if ((ballX-ballDia*.5) <= 25 && paddleY-2 <= ballY && paddleY+52 >= ballY) {
      ballX = 26 + ballDia*.5;
      ballChangeX = ballChangeX * -1;
      ballChangeX = ballChangeX + .7;
      score = score + 1;
    }
  }
  
  else if(ballX + ballDia*.5 < 18 && ballX + ballDia*.5 > 0){
    ballX = ballX + ballChangeX;
    ballY = ballY + ballChangeY;
  }

  else if(ballX+ ballDia*.5 <=0) {
    if (score > highScore){
      highScore = score;
    }
    
    score = 0;
    ballX = random(50, rightBorder-100);
    ballY = random(topBorder + ballDia, bottomBorder - ballDia);
    ballChangeX = 2;
    ballChangeY = random(1, 3);
    
    
  }
}


