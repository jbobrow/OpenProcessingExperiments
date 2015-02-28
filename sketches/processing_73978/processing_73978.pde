
//homework 7
//Sharon Rubin
//srrubin@andrew.cmu.edu
//copyright © Sharon Rubin September 2012 Pittsburgh PA 15213 All Rights Reserved
//easing code from John Gruen

float easeX, easeY, inc;
float enemyrect1X, enemyrect1Y, enemyrect1Xspeed, enemyrect1Yspeed;
float enemyrect2X, enemyrect2Y, enemyrect2Xspeed, enemyrect2Yspeed;
float targetX, targetY, targetXspeed, targetYspeed;
int totalTime, score;

void setup() {
  size(600, 600); 
  smooth();
  noCursor();
  strokeWeight(5);
  strokeCap(ROUND);
  easeX = width/2;
  easeY = height/2;
  inc = .06; //this determines how fast an eased object catches up with the mouse
  enemyrect1X = random(600);
  enemyrect1Y = random(600);
  enemyrect1Xspeed = width/100;
  enemyrect1Yspeed = height/200;
  enemyrect2X = random(600);
  enemyrect2Y = random(600);
  enemyrect2Xspeed = width/200;
  enemyrect2Yspeed = height/100;
  targetX = random(600);
  targetY = random(600);
  targetXspeed = width/70;
  targetYspeed = height/80;
  totalTime = 60;
  score = 0;
}

void draw() {
  background(0);
  easeBall();
  mouseBall();
  easeConnector();
  drawEnemyrect1();
  moveEnemyrect1();
  drawEnemyrect2();
  moveEnemyrect2();
  drawTarget();
  moveTarget();
  loseCollision1();
  loseCollision2();
  winCollision();
  countDown();
}

void mouseBall() {
  noStroke();
  fill(240, 172, 37); 
  ellipse(mouseX, mouseY, width/20, width/20);
}

void easeBall() {
  fill(255);
  noStroke();
  easeX += (mouseX - easeX)*inc;
  easeY += (mouseY - easeY)*inc;
  ellipse(easeX, easeY, width/12, width/12);
}

void easeConnector() {
  stroke(200);
  line(mouseX, mouseY, easeX, easeY);
}

void drawEnemyrect1() {
  fill(178, 14, 14);
  stroke(178, 14, 14);
  rect(enemyrect1X, enemyrect1Y, width/60, width/60);
}

void moveEnemyrect1() {
  enemyrect1X = enemyrect1X + enemyrect1Xspeed;
  enemyrect1Y = enemyrect1Y + enemyrect1Yspeed;
  if ((enemyrect1X>width) || (enemyrect1X<0)) {
    enemyrect1Xspeed = enemyrect1Xspeed*-1;
  } 
  if ((enemyrect1Y>height) || (enemyrect1Y<0)) {
    enemyrect1Yspeed = enemyrect1Yspeed*-1;
  }
}

void drawEnemyrect2() {
  rect(enemyrect2X, enemyrect2Y, width/60, width/60);
}

void moveEnemyrect2() {
  enemyrect2X = enemyrect2X + enemyrect2Xspeed;
  enemyrect2Y = enemyrect2Y + enemyrect2Yspeed;
  if ((enemyrect2X>width) || (enemyrect2X<0)) {
    enemyrect2Xspeed = enemyrect2Xspeed*-1;
  } 
  if ((enemyrect2Y>height) || (enemyrect2Y<0)) {
    enemyrect2Yspeed = enemyrect2Yspeed*-1;
  } 
  if ((mouseX == enemyrect2X || mouseY==enemyrect2Y)) {
    background(142, 0, 0);
  }
}

void drawTarget() {
  fill(154, 206, 2);
  stroke(154, 206, 2);
  rect(targetX, targetY, width/60, width/60);
}

void moveTarget() {
  targetX = targetX + targetXspeed;
  targetY = targetY + targetYspeed;
  if ((targetX>width) || (targetX<0)) {
    targetXspeed = targetXspeed*-1;
  } 
  if ((targetY>height) || (targetY<0)) {
    targetYspeed = targetYspeed*-1;
  }
}

void loseCollision1() {
  float distance = dist(mouseX, mouseY, enemyrect1X, enemyrect1Y);
  if (distance< width/60+width/20) {
    background(142, 0, 0);
    fill(142, 0, 0);
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2, width, height);
    enemyrect1X = random(600);
    enemyrect1Y = random(600);
    score = score-1;
  }
}

void loseCollision2() {
  float distance = dist(mouseX, mouseY, enemyrect2X, enemyrect2Y);
  if (distance< width/60+width/20) {
    fill(142, 0, 0);
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2, width, height);
    enemyrect2X = random(600);
    enemyrect2Y = random(600);
    score = score-1;
  }
}

void winCollision() {
  float distance = dist(easeY, easeY, targetX, targetY);
  if (distance< width/60+width/12) {
    fill(101, 170, 0);
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2, width, height);
    targetX = random(600);
    targetY = random(600);
    score = score+1;
  }
}

void countDown(){
  int countdownx, countdowny;
  countdownx = width/20;
  countdowny = height/15;
  fill(255);
  textAlign(LEFT);
  text(totalTime-millis()/1000, countdownx, countdowny);
  if (score>0) {
    fill(154, 206, 2);
  } if (score<0) {
    fill(178, 14, 14);
  }
  text(score, countdownx, countdowny+20);
  if (totalTime-millis()/1000 <= 0) {
    fill(0);
    noStroke();
    rect(width/2, height/2, width, height); 
    fill(154, 206, 2);
    int gameoverx, gameovery;
    gameoverx = width/2;
    gameovery = height/2;
    textSize(40);
    textAlign(CENTER);
    text("GAME OVER", gameoverx, gameovery);
    textSize(10);
    text("YOUR FINAL SCORE IS: " + score, gameoverx, gameovery+20);
    text("PRESS SPACE BAR TO PLAY AGAIN", gameoverx, gameovery+40);
    noLoop();
  }
}

void keyPressed() {
  if (key == ' ') {
  easeX = width/2;
  easeY = height/2;
  inc = .06; //this determines how fast an eased object catches up with the mouse
  enemyrect1X = random(600);
  enemyrect1Y = random(600);
  enemyrect1Xspeed = width/100;
  enemyrect1Yspeed = height/200;
  enemyrect2X = random(600);
  enemyrect2Y = random(600);
  enemyrect2Xspeed = width/200;
  enemyrect2Yspeed = height/100;
  targetX = random(600);
  targetY = random(600);
  targetXspeed = width/70;
  targetYspeed = height/80;
  totalTime = 60+millis()/1000;
  score = 0;
  loop();
  }
}

