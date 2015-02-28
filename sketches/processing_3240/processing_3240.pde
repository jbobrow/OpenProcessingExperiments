
void setup() {
  size(400, 400);
  background(bg);
  stroke(random(255),random(255),random(255));
  frameRate(200);
  PFont font;
  font = loadFont("MyriadWebPro-18.vlw"); 
  textFont(font, 18); 
}

color bg = #f0f8ff, goal = #40d040;
boolean looping = true;
int lives = 5, score = 0, shake = 0;
float
  ballPosX = 0.0, ballPosX2 = 0.0, ballVelX = 3,
  ballPosY = 0.0, ballPosY2 = 0.0, ballVelY = 0.0,
  ballRad = 8, grav = 0.02,
  mouseX1 = mouseX, mouseY1 = mouseY,
  mouseX2 = mouseX1, mouseY2 = mouseY1,
  mouseVelX = mouseX1 - mouseX2, mouseVelY = mouseY1 - mouseY2,
  mouseVelX1 = mouseX1 - mouseX2, mouseVelY1 = mouseY1 - mouseY2,
  mouseVelX2 = mouseX1 - mouseX2, mouseVelY2 = mouseY1 - mouseY2,
  mouseVelX3 = mouseX1 - mouseX2, mouseVelY3 = mouseY1 - mouseY2,
  padWid = 30, goalX
;


void draw() {
  fill(0);
  text("score: ", 3, 16); text(score, 80, 16);
  ellipseMode(RADIUS); noFill();
  for (int i = 1; i < 15; i = i+1) {
    if(i > lives) {stroke(bg);}
    ellipse(i*18, 30, 4, 4);
  }
  stroke(bg);
  line(mouseX2 - padWid-1, mouseY2, mouseX2 + padWid+1, mouseY2);
  mouseX2 = mouseX1; mouseY2 = mouseY1;
  ellipse(ballPosX2, ballPosY2, ballRad, ballRad);
  rect(goalX, height*0.4, 2, height*0.2);
  stroke(goal);
  goalX = random(shake/10)-shake/20+2;
  if(shake > 0) {shake = shake -1;}
  rect(goalX, height*0.4, 2, height*0.2);
  stroke(#FF0000); rect(5, height-4, width-10, 2);
  stroke(0);
  rect(0, 0, width-1, height-1);
  line(mouseX1 - padWid, mouseY1, mouseX1 + padWid, mouseY1);
  mouseX1 = mouseX; mouseY1 = mouseY;
  ellipse(ballPosX, ballPosY, ballRad, ballRad);
  ballPosX2 = ballPosX;            ballPosY2 = ballPosY;
  ballVelY = ballVelY + grav;
  ballPosX = ballPosX + ballVelX;  ballPosY = ballPosY + ballVelY;
  if(ballPosX + ballRad > width) {
    ballPosX = width - ballRad;
    ballVelX = ballVelX * -0.9;
  } else if(ballPosX - ballRad < 0) {
    ballPosX = ballRad;
    ballVelX = ballVelX * -0.9;
    if(ballPosY > height*0.4 && ballPosY < height*0.6) {
      stroke(bg); fill(bg);
      rect(0, 0, 160, 20);
      shake = shake + int(ballVelX*100);
      score = score + shake;
      padWid = padWid - 1;
      if(int(padWid/5) == padWid/5) {lives = lives +1;}
    }
  }
  if(ballPosY + ballRad > height-1) {
    ballPosY = height-1 - ballRad;
    ballVelY = ballVelY * -0.9 +0.1;
    ballVelX = ballVelX * 0.99;
    lives = lives - 1;
    stroke(bg); fill(bg);
    rect(1, 1, 160, 20);
    if(lives < 1) {
      fill(bg); ellipse(18, 30, 4, 4);
      fill(0);
      text("score: ", 3, 16); text(score, 80, 16);
      text("GAME OVER", 3, 32);
      score = 0;
      ballPosX = 0; ballVelX = 3;
      ballPosY = 0; ballVelY = 0;
      padWid = 30;
      lives = 5;
      looping = false;
      noLoop();
    }
  } else if(ballPosY - ballRad < 0) {
    ballPosY = ballRad;
    ballVelY = ballVelY * -0.9;
  }
  mouseVelX3 = mouseVelX2; mouseVelY3 = mouseVelY2;
  mouseVelX2 = mouseVelX1; mouseVelY2 = mouseVelY1;
  mouseVelX1 = mouseX1 - mouseX2; mouseVelY1 = mouseY1 - mouseY2;
  mouseVelX = (mouseVelX1 + mouseVelX2 + mouseVelX3)/3;
  mouseVelY = (mouseVelY1 + mouseVelY2 + mouseVelY3)/3;
  if(ballPosY + ballRad > mouseY1 && ballPosY < mouseY1 &&
     ballPosX + ballRad > mouseX1 - padWid &&
     ballPosX - ballRad < mouseX1 + padWid && ballVelY > mouseVelY) {
    ballPosY = mouseY1 - ballRad;
    ballVelY = 0-ballVelY + mouseVelY * 0.8 +0.1;
    ballVelX = ballVelX + (mouseVelX - ballVelX)/4;
  } else if(ballPosY - ballRad < mouseY1 && ballPosY > mouseY1 &&
     ballPosX + ballRad > mouseX1 - padWid &&
     ballPosX - ballRad < mouseX1 + padWid && ballVelY < mouseVelY) {
    ballPosY = mouseY1 + ballRad;
    ballVelY = 0-ballVelY + mouseVelY * 0.8;
    ballVelX = ballVelX + (mouseVelX - ballVelX)/4;
  }
}

void mousePressed() {
  if(looping) {noLoop(); looping = false;} else {loop(); looping = true; background(bg);}
}

