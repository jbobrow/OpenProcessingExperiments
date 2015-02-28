
PFont score;

Ball[] balls = new Ball[10];
int blood = 10;
int bloodBar = 200;


void setup() {
  smooth();
  size(400, 400);
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
    balls[i].setupBall();
  }
  score = createFont ("verdana", 50);
}  



void draw() {
  background(0);
  text("Blood", 50, 15 );
  for (int i = 0; i < balls.length; i++) {
    balls[i].drawBall();
    balls[i].updateBall();
  }
  rect(mouseX, mouseY, 20, 20);
  createBloodBar();
}


class Ball 
{
  float x, y, speedX, speedY;
  float dia = 20;

  void setupBall() {
    x = random(dia, width-dia);
    y = random(dia, height-dia);
    speedX = random(1, 8);
    speedY = random(1, 8);
  }

  void drawBall() {
    ellipse(x, y, dia, dia);
  }

  void updateBall() {
    x = x + speedX;
    y = y + speedY;

    if (x <= dia*.5 || x >= (width - dia*.5)) {
      speedX = speedX*-1;
    }
    if (y <= dia*.5 || y >= (height - dia*.5)) {
      speedY = speedY*-1;
    }
    if (x >= mouseX && x <= mouseX+20 && y >= mouseY && y <= mouseY +20) {
      fill(255, 0, 0);
      x = 50;
      y = 50;
      blood --;
      println(blood);
    }
    if (mousePressed == true) {
      fill(255);
    }
  }
}

void createBloodBar() {
  rect(90, 5, bloodBar, 10);
  if (blood == 9) {
    bloodBar = 180;
    text("CLICK TO TURN WHITE", 250, 250);
  }
  if (blood == 8) {
    bloodBar = 160;
  }
  if (blood == 7) {
    bloodBar = 140;
  }
  if (blood == 6) {
    bloodBar = 120;
  }
  if (blood == 5) {
    bloodBar = 100;
  }
  if (blood == 4) {
    bloodBar = 80;
  }
  if (blood == 3) {
    bloodBar = 60;
  }
  if (blood == 2) {
    bloodBar = 40;
  }
  if (blood == 1) {
    bloodBar = 20;
  }
  if (blood <= 0) {
    blood = 0;
    bloodBar = 1;
    text("YOU LOSE", 250, 250);
    text("CLICK TO RETRY", 250, 300);
  }

  if (blood <= 0 && mousePressed == true) {
    blood = 10;
    bloodBar = 200;
  }
}


