

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample gameOver, wall, paddle, topbottom;



float xBall=width/2, yBall=height/2, xVelocity=0, yVelocity=0, m;
int rally = 0;
int score = 0;
int highScore = 0;
float paddleWidth = 100;
int wallR = 255;
int wallG = 255;
int wallB = 255;
int tbwallR = 255;
int tbwallG = 255;
int tbwallB = 255;
int tbAlpha = 255;
int ball = 0;
int paddleR = 255;
int paddleG = 255;
int paddleB = 255;
int rally2 = 0;

void setup() {
  size(800, 600);
  frameRate(60);
  minim = new Minim(this);
  gameOver = minim.loadSample("http://www3.pf-x.net/~onikari/applet/data/powerdown07.mp3");
  wall = minim.loadSample("http://www3.pf-x.net/~onikari/applet/data/button03b.mp3");
  paddle = minim.loadSample("http://www3.pf-x.net/~onikari/applet/data/select04.mp3");
  topbottom = minim.loadSample("http://www3.pf-x.net/~onikari/applet/data/poka02.mp3");
}

void draw() {
  background(0);
  noStroke();
  
  ellipse(xBall, yBall, 15, 15);
  
  if (xVelocity == 0 && yVelocity == 0) {
    textSize(72);
    text("P  O  N  G", (width/2), (height/2) + 25);
    textSize(20);
    text("Created By:", (width/2)+250, (height/2)+0);
    text("Luke Ozaki", (width/2)+250, (height/2)+25);
    text("GAMEOVER", (width/2), (height/2)+70);
    text("Click to Start", (width/2), (height/2)+150);
    if (mousePressed == true) {
      xVelocity = 3;
      yVelocity = 3;
    }
  }
  score =(int) ( Math.ceil(abs(yVelocity)) * Math.ceil((rally2)) * 5) + 5 * rally * ( (Math.round(abs(xVelocity))) * (Math.round(abs(yVelocity))) );
  textSize(32);
  text("Score :", (width/2), 30);
  textAlign(CENTER);
  text(score, width/2, 60);
  textSize(15);
  text("High Score:", (width/2) + 200, 20);
  text(highScore, (width/2) + 300, 20);
  // text("Horizontal Velocity:", (width/2) + 100, height - 50);
  // text("Vertical Velocity:", (width/2) + 100, height - 30);
  // text(abs(xVelocity), (width/2) + 250, height - 50);
  // text(abs(yVelocity), (width/2) + 250, height - 30);

  m=mouseY;
  


  if (xBall > width - 17.5) {
    wall.trigger();
    wallR = 135;
    wallG = 206;
    wallB = 250;
    xVelocity = -1.08*xVelocity;
    rally++;
    // paddleWidth = 0.999 * paddleWidth;
  }
  else if (xBall < width - (40 * (abs(xVelocity) / 3)) ) {
    wallR = 255;
    wallG = 255;
    wallB = 255;
  }
  if (xBall < 25 && yBall < m + paddleWidth && yBall > m - paddleWidth) {
    paddle.trigger();
    paddleR = 152;
    paddleG = 251;
    paddleB = 152;
    xVelocity = -1.08*xVelocity;
    rally++;
    paddleWidth = 0.98 * paddleWidth;
  }
  else if (xBall > (40 * (abs(xVelocity) / 3) )) {
    paddleR = 255;
    paddleG = 255;
    paddleB = 255;
  }

  if (xBall < 5) {
    gameOver.trigger();
    xBall=width/2;
    yBall=height/2;
    tbwallR = 255;
    tbwallG = 255;
    tbwallB = 255;
    if (score > highScore) {
      highScore = score;
    }
    rally = 0;
    rally2 = 0;
    paddleWidth = 100;
    yVelocity = 0;
    xVelocity = 0;
  }
  else {
  }

  if (yBall > height - 12.5 || yBall < 12.5) {
    topbottom.trigger();
    rally2++;
    tbwallR = random(200, 255);
    tbwallG = random(100, 255);
    tbwallB = random(100, 255);
    //tbAlpha = 255;
    yVelocity= -1.04*yVelocity;
    //paddleWidth = 0.999 * paddleWidth;
  }
  else if (yBall < height - (37.5 * (abs(yVelocity) / 3)) && yVelocity < 0|| yBall > (37.5 * (abs(yVelocity) / 3)) && yVelocity > 0) {
    //tbAlpha = 0;
    tbwallR = 255;
    tbwallG = 255;
    tbwallB = 255;
  }

  xBall += xVelocity;
  yBall += yVelocity;
  pushStyle();
  fill(paddleR, paddleG, paddleB);
  rect(5, m - paddleWidth, 10, paddleWidth*2);
  popStyle();

  pushStyle();
  fill(tbwallR, tbwallG, tbwallB);
  rect(16, height-5, width, 5);
  rect(16, 0, width, 5);
  popStyle();

  pushStyle();
  fill(wallR, wallG, wallB);
  rect(width-10, 0, 10, height);
  popStyle();
}

void stop() {
  gameOver.close();
  minim.stop();
  super.stop();
}
