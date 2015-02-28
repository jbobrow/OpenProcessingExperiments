
//This work is licensed under a Creative Commons Attribution 3.0 Unported License.

Food[] food = new Food[4];
Enemy[] enemy = new Enemy[4];
Protagonist p1;
Gui gui;
StopWatchTimer gt;
int level = 0;
float damage = .1;


void setup() {
  size(800, 400);
  noStroke();
  textFont(createFont("Langdon", 50));
  p1 = new Protagonist(255, 255);
  gui = new Gui();
  gt = new StopWatchTimer();
  for (int i = 0; i < food.length; i++) {
    food[i] = new Food(random(500), random(500));
  }
  for (int i = 0; i < enemy.length; i++) {
    enemy[i] = new Enemy(random(500), random(500));
  }
}

void draw() {
  background(126, 133, 145);
  println(level);
  levelUp();
}

void levelUp() {
  if (level == 0) {
    gui.startMenu(width/2, height/2);
  }
  if (level == -1) {
    gui.gameOver(width/2, height/2);
  }
  if (level == 1) {
    levelOne();
  }
  if (level == 2) {
    levelTwo();
  }
  if (level == 3) {
    levelThree();
  }
}

void levelOne() {
  noCursor();
  p1.updateP(3);
  level = 1;
  for (int i = 0; i < 1; i++) {
    for (int j = 0; j < 2; j++) {
      float distE = dist(food[i].xPos, food[i].yPos, enemy[j].xPos, enemy[j].yPos);
      if (distE < 30) {
        food[i].xPos = random(800);
        food[i].yPos = random(400);
        gui.foodValueE += 1;
      }
      float distD = dist(p1.xPos, p1.yPos, enemy[j].xPos, enemy[j].yPos);
      if (distD < 30) {
        gui.lifeValue -= damage;
        fill(249, 253, 206);
        textSize(20);
        textAlign(CENTER, CENTER);
        text(round(gui.lifeValue), p1.xPos, p1.yPos);
      }
    }
  }
  for (int i = 0; i < 1; i++) {
    food[i].updateF();
  }
  for (int i = 0; i < 2; i++) {
    enemy[0].updateE(food[0].xPos, food[0].yPos);
  }
  if (gui.lifeValue <= 0) {
    level = -1;
  }
  if (gui.foodValueC >= 1) {
    level = 2;
    gui.lifeValue = 10;
    gui.levelValue = 2;
  } 
  gui.levelGui();
}

void levelTwo() {
  noCursor();
  p1.easing = .02;
  p1.updateP(3);
   for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 3; j++) {
        float distE = dist(food[i].xPos, food[i].yPos, enemy[j].xPos, enemy[j].yPos);
        if (distE < 30) {
          food[i].xPos = random(800);
          food[i].yPos = random(400);
          gui.foodValueE += 1;
        }
        float distD = dist(p1.xPos, p1.yPos, enemy[j].xPos, enemy[j].yPos);
        if (distD < 30) {
          gui.lifeValue -= damage;
          fill(249, 253, 206);
          textSize(20);
          textAlign(CENTER, CENTER);
          text(round(gui.lifeValue), p1.xPos, p1.yPos);
        } 
      }
    }
  for (int i = 0; i < 2; i++) {
    food[i].timer1 = 5000;
    food[i].updateF();
  }
  for (int i = 0; i < 3; i++) {
    enemy[i].easing = .004;
    enemy[1].updateE(food[1].xPos, food[1].yPos);
    enemy[0].updateE(food[0].xPos, food[0].yPos);
  }
  if (gui.lifeValue <= 0) {
    level = -1;
  }
  if (gui.foodValueC >= 2) {
    level = 3;
    gui.lifeValue = 10;
    gui.levelValue = 3;
  } 
  gui.levelGui();
}

void levelThree() {
  noCursor();
  p1.easing = .02;
  p1.updateP(3);
   for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 4; j++) {
        float distE = dist(food[i].xPos, food[i].yPos, enemy[j].xPos, enemy[j].yPos);
        if (distE < 30) {
          food[i].xPos = random(800);
          food[i].yPos = random(400);
          gui.foodValueE += 1;
        }
        float distD = dist(p1.xPos, p1.yPos, enemy[j].xPos, enemy[j].yPos);
        if (distD < 30) {
          gui.lifeValue -= damage;
          fill(249, 253, 206);
          textSize(20);
          textAlign(CENTER, CENTER);
          text(round(gui.lifeValue), p1.xPos, p1.yPos);
        } 
      }
    }
  for (int i = 0; i < 3; i++) {
    food[i].timer1 = 5000;
    food[i].updateF();
  }
  for (int i = 0; i < 4; i++) {
    enemy[i].easing = .004;
    enemy[2].updateE(food[2].xPos, food[2].yPos);
    enemy[1].updateE(food[1].xPos, food[1].yPos);
    enemy[0].updateE(food[0].xPos, food[0].yPos);
  }
  if (gui.lifeValue <= 0) {
    level = -1;
  }
  if (gui.foodValueC >= 10) {
    //level = 4;
    //gui.lifeValue = 10;
    gui.levelValue = 4;
  } 
  gui.levelGui();
}

class Enemy {
  float xPos, yPos;
  float targetX;
  float targetY;
  float easing = .005;
  color eC = color(185, 194, 178);
  Enemy(float tempX, float tempY) {
    xPos = tempX;
    yPos = tempY;
  }
  void updateE( float temptargetX, float temptargetY) {
    targetX = temptargetX;
    targetY = temptargetY;
    xPos += (targetX - xPos) * easing;
    yPos += (targetY - yPos) * easing;
    strokeWeight(3);
    stroke(200, 253, 206);
    fill(eC);
    ellipse(xPos, yPos, 30, 30);
   
  }
}

class Food{
  float xPos, yPos;
  int savedTime;
 int timer1 = 3000;
  Food(float tempX, float tempY){
  xPos = tempX;
  yPos = tempY;
  }
  
  void updateF(){
    int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    xPos = random(800);
    yPos = random(400);
    savedTime = millis();
  } 
   strokeWeight(3);
   stroke(249, 253, 206);
   fill(192,185,110);
   ellipse(xPos,yPos,30,30);
    
  }
}
class Gui {
  float startX, startY;
  int foodValueC = 0, foodValueE = 0, countDown = 60, levelValue;
  float lifeValue = 10;
  Gui() {
  }

  void startMenu(float tempstartX, float tempstartY) {
    startX = tempstartX;
    startY = tempstartY;
    textSize(40);
    textAlign(CENTER, CENTER);
    fill(249,253,206);
    text("SURVIVAL OF THE FITTEST", width/2, height/2 - 50);
    textSize(30);
    fill(200, 253, 206);
    text("PRESS START", startX, startY);
    float pStart = dist(mouseX, mouseY, startX, startY);
    if (mousePressed && pStart <= 30) {
      level = 1;
      gui.levelValue = 1;
      gt.start();
    }
  }

  void levelGui() {
    countDown = 60 - (round(gt.second()));
    textSize(20);
    textAlign(LEFT, TOP);
    fill(249,253,206);
    text("LIFE = " + round(lifeValue), 20, 20);
    text("YOU = " + foodValueC, 20, 50);
    text("OTHERS = " + foodValueE, 20, 80);
    text("TIME = " + countDown, 20, 110);
    text("LEVEL = " + levelValue, 20, 140);
  }
  
  void gameOver(float tempstartX, float tempstartY) {
    cursor();
    startX = tempstartX;
    startY = tempstartY;
    textSize(40);
    textAlign(CENTER, CENTER);
    fill(249,253,206);
    text("GAME OVER", width/2, height/2 - 40);
    textSize(30);
    fill(200, 253, 206);
    text("CONTINUE?", startX, startY);
    float pStart = dist(mouseX, mouseY, startX, startY);
    if (mousePressed && pStart <= 30) {
      gt.start();
      gui.lifeValue = 10;
      gui.foodValueE = 0;
      gui.foodValueC = 0;
      level = 1;
      gui.levelValue = 1;
    }
  }
}

class Protagonist {
  float xPos, yPos, speed;
  float easing = .015;
  Protagonist(float tempXpos, float tempYpos) {
    xPos = tempXpos;
    yPos = tempYpos;
  }
  void updateP(float tempSpeed) {
    speed = tempSpeed;
    if (keyPressed) {
      if (key == 'w') {
        yPos -= speed;
      }
      if (key == 's') {
        yPos += speed;
      }
      if (key == 'a') {
        xPos -= speed;
      }
      if (key == 'd') {
        xPos += speed;
      }
    }
    float targetX = mouseX;
    float targetY = mouseY;
    if(mousePressed){
      xPos += (targetX - xPos) + speed;
      yPos += (targetY - yPos) + speed;
    }
    xPos += (targetX - xPos) * easing;
    yPos += (targetY - yPos) * easing;
    
    strokeWeight(3);
    stroke(249, 253, 206);
    fill(185,194,178);
    ellipse(xPos, yPos, 30, 30);
    for (int i = 0; i < food.length; i++) {
      float distP = dist(xPos, yPos, food[i].xPos, food[i].yPos);
      if (distP < 30) {
        food[i].xPos = random(500);
        food[i].yPos = random(500);
        gui.foodValueC += 1;
      }
    }
  }
}

    class StopWatchTimer {
      int startTime = 0, stopTime = 0;
      boolean running = false;
      void start() {
        startTime = millis();
        running = true;
      }
      void stop() {
        stopTime = millis();
        running = false;
      }
      
   
    
      int getElapsedTime() {
        int elapsed;
        if (running) {
          elapsed = (millis() - startTime);
        }
        else {
          elapsed = (stopTime - startTime);
        }
        return elapsed;
      }
      int second() {
        return (getElapsedTime() / 1000) % 60;
      }
      int minute() {
        return (getElapsedTime() / (1000*60)) % 60;
      }
      int hour() {
        return (getElapsedTime() / (1000*60*60)) % 24;
      }
    }


