
int score1 = 00;
int score2 = 00;

int rX = 400;
int rY = 200;
int paddleY = 20;

int speedX = 5;
int speedY = 5;

PImage bg;
PImage ball;
PImage paddle;

import ddf.minim.*;

Minim minim;
AudioPlayer in;


void setup() {
  size(800, 400);
  bg = loadImage("background.jpg");
  ball = loadImage("ball.png");
  paddle = loadImage("paddle.png");
  smooth();

  minim = new Minim(this);
  in = minim.loadFile ("Vcr.mp3");
  in.play();
}

void draw() {
  background(255);
  image(bg, 0, 0);
  noCursor();

  // score
  PFont font;
  font = loadFont("HelveticaNeue-UltraLight-24.vlw");
  textFont(font, 24);
  fill(10, 102, 170);
  text(score1, 345, 385);
  text(score2, 450, 385);

  // paddles
  image(paddle, 765, mouseY);
  image(paddle, 20, paddleY);
  // paddles over the boundaries
  if (mouseY > 275) {
    mouseY = 275;
  }
  if (mouseY < 0) {
    mouseY = 0;
  }
  if (paddleY > 275) {
    paddleY = 275;
  }
  if (paddleY < 0) {
    paddleY = 0;
  }

  // ball
  image(ball, rX, rY);
  // move the ball
  rX = rX + speedX;
  rY = rY + speedY;
  // bounce off the vertical boundaries
  if ((rY >= 335) || (rY <= 0)) {
    speedY = speedY * -1;
  }


  // for the paddle controlled by computer
  // move
  if (speedX < 0) {
    if (speedY > 0) {
      if (paddleY < (rY + 20 + speedY - int(random(73)))) {
        paddleY = paddleY + speedY;
      }
      else {
        paddleY = paddleY - speedY;
      }
    }
    if (speedY < 0) {
      if (paddleY > (rY + 20 + speedY + int(random(3)))) {
        paddleY = paddleY + speedY;
      }
      else {
        paddleY = paddleY - speedY;
      }
    }
  }

      println(rX);

  // collisions
  if (rX == 35) { 
      println(rY);
    if ((rY <= (paddleY + 70 + 15)) && (rY >= (paddleY - 15))) {
      speedX = speedX * ( -1 );
    }
    else {
      score2 = score2 +1;
    }
  }


  // for the paddle controlled by mouse
  // collisions
  if (rX == 735) { 
      println(rY);
    if ((rY >= (mouseY - 15 )) && ( rY <= (mouseY + 70 + 15))) {
      speedX = speedX * ( -1 );
    }
    else {
      score1 = score1 + 1;
    }
  }


  // start over
  if ((rX < 0)||(rX>800)) {
    speedX = speedX * (-1);
    rX = 400;
    rY = 200;
  }
}

void stop()
{
  in.close();
  minim.stop();

  super.stop();
}


