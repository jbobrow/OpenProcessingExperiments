
Enemy e1, e2, e3;
Player1 p1;
Food f1;

int level = 0;

void setup() {
  size(800, 400);
  textFont(createFont("ZOMBIE", 60));
  frameRate(24);
  e1 = new Enemy(200, 300, .05, 96);
  e2 = new Enemy(100, 200, .05, 96);
  e3 = new Enemy(300, 100, .05, 96);
  p1 = new Player1(600, 400, .1);
  f1 = new Food(400, 200, 48);
}

void draw() {
  background(255);
  levelUp();
}

void level1(){
  e1.display();
  e2.display();
  e3.display();
  p1.display();
  f1.display();
}


void startMenu(){
  textSize(72);
  textAlign(CENTER,CENTER);
  fill(#0C4609);
  text("ZOMBIE SURVIVAL", 400,300);
  text("CLICK TO START", mouseX,mouseY);
  if(mousePressed){
    level = 1;
  }
}

void levelUp(){
if(level == 0){
  startMenu();
}
if(level == 1){
  level1();
}
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
    float targetX = mouseX;
    float targetY = mouseY;
    eX += (targetX - eX) * easing;
    eY += (targetY - eY) * easing;
    fill(#D86811);
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
      timer = 0;
    }
    fill(#0F4821);
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
    fill(#3B3B3B);
    ellipse(pX, pY, 30, 30);
  }
}






