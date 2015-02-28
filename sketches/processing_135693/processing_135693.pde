

int savedTime;
int timer1 = 3000;

float x = 255;
float y = 255;
float fX = 10;
float fY = 10;
float sX = 20;
float sY = 350;
int lifeValue = 50;
int foodValueC = 0;
int foodValueE = 0;
float speed = 6;

int level = 0;

void setup() {
  size(500, 500);
  textFont(createFont("Gotham-Light", 50));

  noStroke();

  savedTime = millis();
}

void draw() {
  smooth();
  background(#03192C);
  levelUp();
}

void food() {

  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    fX = random(500);
    fY = random(500);
    savedTime = millis();
  }
  fill(#12BEFF);
  ellipse(fX, fY, 30, 40);
  fill(255);
  ellipse(fX, fY, 15, 15);
}



void character() {

  if (keyPressed) {
    if (key == 'w') {
      y -= speed;
    }
    if (key == 's') {
      y += speed;
    }
    if (key == 'a') {
      x -= speed;
    }
    if (key == 'd') {
      x += speed;
    }
  }
  fill(255);
  rect(x, y, 30, 30, 10);
}

void eat() {

  float distC = dist(x, y, fX, fY);

  if (distC < 30) {
    fX = random(500);
    fY = random(500);
    foodValueC += 1;
    lifeValue -= 5;
  }

  if (lifeValue <= 0) {
    level = -1;
  }
}



void level1() {
  //level 1
  food();
  character();
  eat();
  gui();
}

void startMenu() {

  textSize(40);
  textAlign(LEFT, CENTER);
  fill(#12BEFF);
  text("chase the tear", 20, 200);
  textSize(15);
  text("click here to start", sX, sY);
  float pStart = dist(mouseX, mouseY, 100, sY);
  if (mousePressed && pStart <= 30) {
    level = 1;
  }
}

void gameOver() {

  textSize(30);
  textAlign(LEFT, CENTER);
  fill(#12BEFF);
  text("you weren't strong enough", 20, 200);
  textSize(15);
  text("click here to retry", sX, sY);
  float pStart = dist(mouseX, mouseY, 100, 350);
  if (mousePressed && pStart <= 30) {
    lifeValue = 50;
    level = 1;
  }
}

void levelUp() {

  if (level == 0) {
    startMenu();
  }
  if (level == 1) {
    level1();
  }
  if (level == -1) {
    gameOver();
  }
}

void gui() {

  textSize(20);
  textAlign(LEFT, TOP);
  fill(#12BEFF);
  text("determination: " + lifeValue, 125, 470);
  text("attempts:  " + foodValueC, 320, 470);
  fill(255);
  text("the truth", 20, 470);
}



