
Enemy e1, e2, e3, e4;
Player1 p1;
Food f1;

int lifeValueP = 25;
int foodValueP = 0;
int level = 0;
PImage img;

void setup() {
  size(800, 400);
  img = loadImage("zombie_horde2");
  textFont(createFont("ZOMBIE", 60));
  frameRate(24);
  e1 = new Enemy(200, 300, .05, 96);
  e2 = new Enemy(100, 200, .05, 96);
  e3 = new Enemy(300, 100, .05, 96);
  e4 = new Enemy(400, 400, .05, 96);
  p1 = new Player1(600, 400, .1);
  f1 = new Food(400, 200, 48);
}

void draw() {
  background(#505050);
  levelUp();
}

void level1() {
  e1.display();
  e2.display();
  e3.display();
  e4.display();
  p1.display();
  f1.display();
  gui();
}


void startMenu() {

  textSize(72);
  textAlign(CENTER, CENTER);
  fill(#0C4609);
  text("ZOMBIE SURVIVAL", 400, 300);
  text("CLICK TO START", mouseX, mouseY);
  if (mousePressed) {
    level = 1;
  }
}

void gameOver() {
  image(img, 400, 200);
  textSize(72);
  textAlign(CENTER, CENTER);
  fill(#0C4609);
  text("GAME OVER", 400, 300);
  text("CLICK TO TRY AGAIN", mouseX, mouseY);
  if (mousePressed) {
    lifeValueP = 25;
    foodValueP = 0;
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
  textSize(15);
  textAlign(LEFT, TOP);
  fill(255);
  text("FOOD = " + foodValueP, 20, 30);
  text("LIFE = " + lifeValueP, 20, 60);
}


class Enemy {
  int timer = 0;
  float eX;
  float eY;
  float easing;
  int respawn;

  Enemy(float tempX, float tempY, float tempEasing, int tempTime) {
    eX = tempX;
    eY = tempY;
    easing = tempEasing;
    respawn = tempTime;
  }

  void display() {
        timer++;
    if (timer >= respawn) {
      eX = random(width);
      eY = random(height);
      timer = 0;
    }
    float distance = dist(p1.pX,p1.pY,eX,eY);
    if(distance < 30){
      lifeValueP -=1;
    }
    if(lifeValueP < 1){
      level = -1;
    }
    float targetX = mouseX;
    float targetY = mouseY;
    eX += (targetX - eX) * easing;
    eY += (targetY - eY) * easing;
    fill(#226A14);
    ellipse(eX, eY, 30, 30);
  }
}

class Food {
  int timer = 0;
  float fX;
  float fY;
  int respawn;

  Food(float tempX, float tempY, int tempTime) {
    fX = tempX;
    fY = tempY;
    respawn = tempTime;
  }

  void display() {
    timer++;
    if (timer >= respawn) {
      fX = random(width);
      fY = random(height);
      timer = 0;
    }
    float distance = dist(p1.pX,p1.pY,fX,fY);
    if(distance < 20){
      fX = random(width);
      fY = random(height);
      foodValueP += 1;
      timer = 0;
    }
    fill(#FFEC12);
    ellipse(fX, fY, 30, 30);
  }
}

class Player1 {
  float pX;
  float pY;
  float easing;

  Player1(float tempX, float tempY, float tempEasing) {
    pX = tempX;
    pY = tempY;
    easing = tempEasing;
  }

  void display() {
    float targetX = mouseX;
    float targetY = mouseY;
    pX += (targetX - pX) * easing;
    pY += (targetY - pY) * easing;
    fill(#F1F2E6);
    ellipse(pX, pY, 30, 30);
  }
}






