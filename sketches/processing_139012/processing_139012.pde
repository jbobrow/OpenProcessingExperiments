
PImage img1;
PImage a;
PImage b;
PImage c;
PImage d;

//timer for "food"
int savedTime;
int timer1 = 3000;
//character x and y
float x = 255;
float y = 255;
//food x and y
float fX = 10;
float fY = 10;
//enemy x and y
float eX = 10;
float eY = 10;
//press start x and y
float sX = 255;
float sY = 255;
//counters for GUI
int lifeValue = 50;
int foodValueC = 0;
int foodValueE = 0;
//easing for enemy
float easing = .015;
//speed of character
float speed = 6;
//level
int level = 0;

void setup() {
  size(500, 333);
  a = loadImage("tornado.png");
  b = loadImage("eye tornado.png");
  c = loadImage("win tornado.png");
  d = loadImage("fail tornado.png");
  //create font
  textFont(createFont("Blade Runner Movie Font", 50));
  //outline
  img1 = loadImage("tornado.png");
  noStroke();
  //strokeWeight(2);
  //milliseconds since start
  savedTime = millis();
}

void draw() {
  smooth();
  background(0);
  image (img1, 0, 0);
  levelUp();
}

void food() {
  //respawn
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    fX = random(500);
    fY = random(333);
    savedTime = millis();
  }
  fill(#FA0F23);
  ellipse(fX, fY, 30, 30);
}



void character() {
  //character movement
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
  fill(#F2DA4E);
  ellipse(x, y, 30, 30);
}

void eat() {
  //distance between character and food
  float distC = dist(x, y, fX, fY);
  //distance between enemy and food
  float distE = dist(eX, eY, fX, fY);
  //distance between character and enemy
  float distD = dist(x, y, eX, eY);
  if (distC < 30) {
    fX = random(500);
    fY = random(333);
    foodValueC += 1;
  }
  if (distE < 40) {
    fX = random(500);
    fY = random(333);
    foodValueE += 1;
  }
  if (distD < 40) {
    lifeValue -= 1;
  }
  if (lifeValue <= 0) {
    level = -1;
  }
}

void enemy() {
  //movement and creation of enemy characters
  float targetX = fX;
  float targetY = fY;
  eX += (targetX - eX) * easing;
  eY += (targetY - eY) * easing;
  fill(0);
  ellipse(eX, eY, 30, 30);
}

void level1() {
  //level 1
  image(a, 0, 0, 667, 500);
  food();
  character();
  eat();
  enemy();
  gui();
  if (foodValueC == 10) {
    level = 2;
  }
}
void level2() {
  //level 2
  image(b, 0, 0, 500, 500);
  food();
  character();
  eat();
  enemy();
  gui();
  if (foodValueC == 15) {
    level = 3;
  }
}

void startMenu() {
  //startMenu
  textSize(18);
  textAlign(CENTER, CENTER);
  fill(0);
  text("A Wild Tornado Has Appeared! Save Kansas!", 255, 200);
  text("PRESS START", sX, sY);
  float pStart = dist(mouseX, mouseY, sX, sY);
  if (mousePressed && pStart <= 30) {
    level = 1;
  }
}

void gameOver() {
  //gameOver screen
  textSize(20);
  textAlign(CENTER, CENTER);
  background(d);
  fill(255, 0, 0);
  text("GAME OVER", 255, 200);
  text("You Have Failed! Kansas Is No More!", sX, sY);
  float pStart = dist(mouseX, mouseY, sX, sY);
  if (mousePressed && pStart <= 30) {
    lifeValue = 50;
    level = 1;
  }
}
void successLevel() {
  //winnerMenu screen
  textSize(13);
  textAlign(CENTER, CENTER);
  background(c);
  fill(255,0,0);
  text("Kansas Is Saved! Unfornately, Disaster Was Inevitable.", 255, 200);
  text("CLICK TO REPLAY", sX, sY);
  float pStart = dist(mouseX, mouseY, sX, sY);
  if (mousePressed && pStart <= 30) {
    lifeValue = 50;
    level = 1;
  }
}

void levelUp() {
  //checking for level
  if (level == 0) {
    startMenu();
  }
  if (level == 1) {
    level1();
  }
  if (level == 2) {
    level2();
  }
  if (level == 3) {
    successLevel();
  }
  if (level == -1) {
    gameOver();
  }
}


void gui() {
  //in game info
  textSize(20);
  textAlign(LEFT, TOP);
  fill(0);
  text("HEALTH = " + lifeValue, 20, 30);
  text("PLAYER 1 =  " + foodValueC, 20, 60);
  text("TORNADO = " + foodValueE, 20, 90);
}



