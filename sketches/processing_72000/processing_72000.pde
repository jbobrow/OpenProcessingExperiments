
int ballX = 50;
int ballY = 50;
int picX = 50;
int picY = 50;

int speedX = 5;
int speedY = 3;

int paddle = 0;

int scoreC = 0;
int scoreM = 0;
int hit = 30;
PImage scoreImg;
PImage backImg;
PImage ballImg;
PImage paddleImg;

import ddf.minim.*;

Minim minim;
AudioPlayer in;

void setup () {
  
  size (800, 400);
  smooth (); 
  
  scoreImg = loadImage ("score.jpg");
  backImg = loadImage ("backImg.jpg");
  ballImg = loadImage ("ballImg.png");
  paddleImg = loadImage ("paddleImg.jpeg");
  
  minim = new Minim(this);
  in = minim.loadFile ("music.mp3");
  in.play();
  
}

void draw () {
  
 //background
 image (scoreImg, 0, 0);
 image (backImg, 0, 0);
 
 //ball
 image (ballImg, picX, picY);
 picX = ballX - 10;
 picY = ballY - 10;
 ballX += speedX;
 ballY += speedY;
 
 if ((ballX > 790) || (ballX < 10)) {
   speedX *= -1;  
 }
 if ((ballY > 340) || (ballY < 10)) {
   speedY *= -1;
 }
 
  //paddles
 image (paddleImg, 790, mouseY);
 image (paddleImg, 5, paddle);
 
 //collisions
 if (speedX < 0) {
  paddle = ballY-hit;
 }
 
 //over
 if (mouseY > 290) {
    mouseY = 290;
  }
  if (mouseY < 0) {
    mouseY = 0;
  }
  if (paddle > 290) {
    paddle = 290;
  }
  if (paddle < 0) {
    paddle = 0;
  } 
  
 //count score
 if ((ballY > mouseY) && (ballY < mouseY+60) && (ballX == 780) && (speedX > 0)) {
   speedX *= -1;
//   scoreM += 1;
 } 
 else if ((speedX > 0) && (ballX == 790)) {
 scoreC += 1;
 }
 
 if ((ballY > paddle) && (ballY < paddle+60) && (ballX == 20) && (speedX < 0)) {
   speedX *= -1;
//   scoreC += 1;
   hit = int(random (-10,80));
 }
  else if ((speedX < 0) && (ballX == 10)) {
 scoreM += 1;
 } 
  
 //score
 PFont font;
 font = loadFont ("SynchroLET-30.vlw");
 textFont (font, 30);
 fill (0);
 text (scoreC, 342, 385);
 fill (0);
 text (scoreM, 442, 385);

}

void stop()
{
  in.close();
  minim.stop();

  super.stop();
}

