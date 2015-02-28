
// pong 0.1
float ballX, ballY, speedX, speedY;
int scoreCounter;
PFont gameOver;
PFont scoreHFont;
PFont scoreFont;
int scoreHPosX;
int scoreHPosY;
int scorePosX;
int scorePosY;
int barUp;
int barDown;
int barHeight;



void setup() {
//  noCursor();
  size(400, 400);
  background(255, 0, 100);
  frameRate(22);

  ballX = 0;
  ballY = 30;
  speedX = 10;
  speedY = 10;
  barHeight = 100;

  scoreCounter = 1;
  scoreHPosX = 300;
  scoreHPosY = 20;
  scorePosX = 350;
  scorePosY = 20;
  
}

void draw() {
  fill(5, 240, 10);
  rectMode(CORNER);
  rect(0, 0, width, height);
  //font and score stuff

  //Heading
  scoreHFont = createFont("Ubuntu", 12, true);
  textFont(scoreHFont);
  fill(0);
  text("SCORE", scoreHPosX, scoreHPosY);

  //Score
  scoreFont = createFont("Pacifico", 18);
  textFont(scoreFont);
  text(scoreCounter, scorePosX, scorePosY);

  //Bar
  noStroke();
  fill(0);
  rectMode(CORNER);
  rect(350, mouseY, 7, barHeight);

  PImage imgDuck = loadImage("duck.png");
  imageMode(CENTER);
  image(imgDuck, ballX, ballY);

//  rectMode(CENTER);
//  rect(ballX, ballY, 10, 10);
  ballX += speedX;
  ballY += speedY;

  if (ballX >= 400 || ballX <= 0) {
    speedX *= -1;
    speedY *= 1;
  }
  if (ballY >= 400 || ballY <= 0) {
    speedX *= 1;
    speedY *= -1;
  }

  //when ball collide with the bar
  /*
  for(i=0; i <= 35; i++){
   int barUp = mouseY + i;
   if(barUp == ballY){
   speedX *= -1;
   speedY *= 1;
   }
   }
   
   for(i=35; i >= 0; i--){
   int barDown = mouseY + i;
   if(barDown == ballY){
   speedX *= 1;
   speedY *= -1;
   }
   }
   */

  for (int i=0; i <= 100; i++) {
    int barDown = mouseY + i;
    if (ballY == barDown && ballX == 350) {
      speedX *= -1;
      speedY *= 1;
      scoreCounter *=2;
      barHeight -= 6;
    }
  }

  for (int i=50; i >= 0; i--) {
    int barUp = mouseY - i;
    if (ballY == barUp && ballX == 350) {
      speedX *= 1;
      speedY *= -1;
      scoreCounter *= 2;
      barHeight -= 6;
    }
  }

  //game over
  gameOver = createFont("Pacifico", 30);
  textMode(CENTER);
  textFont(gameOver);
  if (ballX > 350) {
    text("Game over, fun huh?", width/2 - 120, height/2);
    text("your brain is " + scoreCounter + " bit", width/2 - 110, height/2 + 40);
    noLoop();
  }
}


