
//there will be balls moving toward your bike one at a time
//hit the helmet when the ball hits your bike
//if not, a white spot will appear on the screen,
//if the screen is all white, you lose

import arb.soundcipher.*;

SoundCipher sc = new SoundCipher(this);

int width = 1440;
int height = 855;

float hitX = 1024;
float hitXX = 1024;
float hitVelX;

int bikeX;
int bikeY;
int bikeVelX;
int bikeVelY;
int bikeColor;

float sceneX = 500;

int score = 0;
PFont scoreFont;
float whiteTopY = 0;
float whiteTopHeight = 160;
float whiteBottomY = 690;
float whiteBottomHeight = 160;


void setup() {
  size(1440, 855);
  frameRate(25);
  noStroke();
  smooth();
}

void draw() {
  background(0);

  //draw score board
  scoreFont = loadFont("scoreFont.vlw");
  textFont(scoreFont);
  fill(255);
  textSize(200);
  text(score, 1100, 480);

  //draw scene
  //  fill(0, 255, 0);
  //  rect(sceneX, 558, 100, 50);
  //  sceneX = sceneX-10;
  //  if (sceneX <= 0) {
  //    sceneX = 1024;
  //  }

  //draw cyclist
  fill(200, 200, 0);
  ellipse(100, height/2, 50, 50);

  hitBall();
}

void hitBall() {
  //draw moving ball 1
  fill(255, 0, 0);
  ellipse(hitX, height/2, 30, 30);
  hitX = hitX-10;

  if (hitX <= 0) {
    hitX = 1024;
  }

  //draw moving ball 2
  fill(0, 0, 255);
  ellipse(hitXX, height/2, 30, 30);
  hitXX = hitXX-5;

  if (hitXX <= 0) {
    hitXX = 1024;
  }

  //what happens when the moving ball hits the cyclist
  fill(255);
  rect(0, whiteTopY, width, whiteTopHeight);
  rect(0, whiteBottomY, width, whiteBottomHeight);

  if (hitX <= 100 && hitX >= 80) {
    background(255, 0, 0);
    println("hit");
    //if the moving ball passes the cyclist (got hit), sth BAD happens
    score--;
    fill(255, 0, 0);
    rect(0, 0, width, 160);
    rect(0, 608, width, 160);
    fill(255); //white rectangles closing
    whiteTopHeight = whiteTopHeight+20;
    whiteBottomY = whiteBottomY-20;
    whiteBottomHeight = whiteBottomHeight+20;
  }

  if (hitXX <= 100 && hitXX >= 90) {
    background(0, 0, 255);
    println("hit2");
    //if the moving ball passes the cyclist (got hit), sth BAD happens
    score--;
    fill(0, 0, 255);
    rect(0, 0, width, 160);
    rect(0, 608, width, 160);
    fill(255); //white rectangles closing
    whiteTopHeight = whiteTopHeight+20;
    whiteBottomY = whiteBottomY-20;
    whiteBottomHeight = whiteBottomHeight+20;
  }

  //if the score is 5, the game ends (win)
  if (score == 5) {
    fill(255);
    rect(0, 0, width, height);
    fill(0);
    textSize(200);
    text("Thanks for whacking!", 70, height/2+20);
    hitX = 0;
    hitXX = 0;
  }

  //if the screen is all white, the game ends (lose)
  if (whiteTopHeight > height/2) {
    fill(0);
    textSize(200);
    text("Thanks for losing!", 150, height/2+20);
    hitX = 0;
    hitXX = 0;
  }
}

void keyPressed() {
  //whack to eliminate the moving ball 1
  if (keyCode == 32 && hitX <= 150 && hitX >= 80) {
    score++;
    sc.playNote(80, 100, 2.0);
    hitX = -hitX;
    println("whack");
    whiteTopHeight = whiteTopHeight-20;
    whiteBottomY = whiteBottomY+20;
    whiteBottomHeight = whiteBottomHeight-20;
  }


  //whack to eliminate the moving ball 2
  if (keyCode == 32 && hitXX <= 150 && hitX >= 80) {
    score++;
    sc.playNote(80, 100, 2.0);
    hitXX = -hitXX;
    println("whack");
    whiteTopHeight = whiteTopHeight-20;
    whiteBottomY = whiteBottomY+20;
    whiteBottomHeight = whiteBottomHeight-20;
  }
}

