
int topOf;
int bottomOf;
float opponentTopOf;
float opponentBottomOf;
float x = 200;
float y = 200;
float addx = 12;
float addy = 5.5;
int score = 0;
int opponentScore = 0;
float opponentY = 200;
float opponentSpeed = 5;
int rectAlpha = 0;

void setup() {
  size(400, 400);
  frameRate(24);
  noStroke();
  smooth();
  rectMode(CENTER);
  PFont font;
  font = loadFont("BatikRegular-24.vlw");
  textFont(font, 24);
}

void draw() {
  background(0);
  fill(255);
  text(score, 300, 30);
  fill(255);
  text(opponentScore, 100, 30);
  topOf = mouseY - 35;
  bottomOf = mouseY + 35;
  opponentTopOf = opponentY - 35;
  opponentBottomOf = opponentY + 35;
  x = x + addx;
  y = y + addy;
  fill(255);
  rect(395, mouseY, 10, 50);
  fill(255);
  rect(5, opponentY, 10, 50);
  fill(255);
  ellipse(x, y, 20, 20);
  if(y > topOf && y < bottomOf && x > 380 && x > 200) {
    addx = 12;
    addx = addx * -1;
  }
  if(y > opponentTopOf && y < opponentBottomOf && x < 20 && x < 200) {
    addx = -12;
    addx = addx * -1;
  }
  if(y > 390) {
    addy = addy * -1;
  }
  if(y < 10) {
    addy = addy * -1;
  }
  if(x > 400) {
    x = 200;
    y = 200;
    opponentScore = opponentScore + 1;
  }
  if(x < 0) {
    x = 200;
    y = 200;
    score = score + 1;
  }
  if(opponentY < y) {
    opponentY = opponentY + opponentSpeed;
  }
  if(opponentY > y) {
    opponentY = opponentY - opponentSpeed;
  }
  if(score > 9) {
    fill(255);
    text("You Win!!! :)", 50, 100);
    text("Press R key to restart", 50, 150);
    fill(0, 0, 0, rectAlpha);
    rect(200, 200, width, height);
    rectAlpha = rectAlpha + 1;
    x = 200;
    y = 200;
    opponentY = 200;
  }
  if(opponentScore > 9) {
    fill(255);
    text("You Lose... :(", 50, 100);
    text("Press R key to restart", 50, 150);
    fill(0, 0, 0, rectAlpha);
    rect(200, 200, width, height);
    rectAlpha = rectAlpha + 1;
    x = 200;
    y = 200;
    opponentY = 200;
  }
  if(keyPressed) {
    if(score > 9 && key == 'r') {
      score = 0;
      opponentScore = 0;
      rectAlpha = 0;
    }
    if(opponentScore > 9 && key == 'r') {
      score = 0;
      opponentScore = 0;
      rectAlpha = 0;
    }
  }
}

