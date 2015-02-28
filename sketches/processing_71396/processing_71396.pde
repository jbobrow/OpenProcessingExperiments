
PFont font;
int ballX = 45;
int ballY = 20;
int xSpeed = 3;
int ySpeed = 4;
int padW = 25;
int padL = 100;
int p1y = 0;
int p1x = 0;
int p2y = 0;
int p2x = 575;
int p1Score = 0;
int p2Score = 0;

void setup() {
  size(600, 600);
  background(0);
  font = loadFont("MineCrafter-2.0-48.vlw");
}
void draw() {
  noStroke();
  //Player 1
  background(0);
  if (p2y < 0) {
    p2y = 0;
  }
  if (p2y > 500) {
    p2y = 500;
  }
  if (keyPressed && (key == CODED)) {
    if (keyCode == UP) {
      p2y-=3;
    } 
    else if (keyCode == DOWN) {
      p2y+=3;
    }
  }
  fill(255, 255);
  rect(p2x, p2y, padW, padL);
  //Player 2
  if (p1y < 0) {
    p1y = 0;
  }
  if (p1y > 500) {
    p1y = 500;
  }
  if (keyPressed) {
    if (key == 'w') {
      p1y-=3;
    }
    if (key == 's') {
      p1y+=3;
    }
  }
  fill(255, 255);
  rect(p1x, p1y, padW, padL);
  //PONG text
  textFont(font, 64);
  textAlign(CENTER);
  fill(11, 255, 0);
  text("PONG", 300, 300);
//Scoring
  fill(255, 255, 255);
  text(p2Score, 400, 200);
  text(p1Score, 200,200);
  if(ballX < 0){
    p2Score = p2Score + 10;
    ballX = 260;
    ballY = 265;
    xSpeed *= -1;
    println("Player 2 Scored!");
  }
  if(ballX > 600){
    p1Score = p1Score + 10;
    ballX = 260;
    ballY = 265;
    xSpeed *= -1;
    println("Player 1 Scored!");
  }
//Ball
  fill(255, 255, 255);
  ellipse(ballX, ballY, 40, 40);
  ballX += xSpeed;
  ballY += ySpeed;
  if (ballY < 20 || ballY > 580) {
    ySpeed *= -1;
  } 
  if (ballX > p1x && ballX < p1x + 25 && ballY > p1y && ballY < p1y + 100) {
    xSpeed *= -1;
  }
  if (ballX > p2x && ballX < p2x + 25 && ballY > p2y && ballY < p2y + 100) {
    xSpeed *= -1;
  }
//Finishing
 if(p2Score == 100 || p1Score == 100){
  background(0);
  text("Game Over", 300,300);
 if(p1Score == 100){
 fill(0,255,255);
  textSize(20);
  text("Winner! Player 1!", 300,200);
  println("Player 1 is the Winner!");
 }
 if(p2Score == 100){
  textSize(20);
  text("Winner! Player 2!", 300,200);
  println("Player 2 is the Winner!");
 }
 }
}



