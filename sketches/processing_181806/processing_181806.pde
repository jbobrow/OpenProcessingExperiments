
PImage villian;
PImage goal;
float heroX;
float heroY;
PImage hero;
float speed;
float villianX;
float villianY;
boolean titleScreen;
boolean LoseScreen;
boolean WinScreen;
void setup () {
  size(900, 900);
  speed = 5;
  heroX = width/2;
  heroY = height/2;
  villianX = 0;
  villianY = 0;
  titleScreen=true;
  WinScreen=false;
  LoseScreen=false;
  villian = loadImage("sharkimage.png");
  goal = loadImage("fishschool.png");
  hero = loadImage("fish.jpg");
}
void draw () {
  if (titleScreen) {
    drawTitle();
  } else if (LoseScreen) {
    drawLoseScreen();
  } else if (WinScreen) { 
    drawWinScreen();
  } else {
    drawGame();
  }
}
void drawWinScreen() {
  background(100,101,211);
  textSize(40);
  text("You Win",300,300);
  textSize(20);
  text("Press Space to Play Again",300,600);
}
void drawLoseScreen() {
  background(185, 26, 66);
  textSize(40);
  text("You Lose", 300, 300);
  textSize(20);
  text("Press Space to Play Again",300,600);
}
void drawTitle() {
  background(255);
  fill(0);
  textSize(48);
  text("FISH SCHOOL GAME", 300, 200);
  textSize(28);
  text("Press any key to play", 300, 600);
}
void drawGame () {
  background (181, 199, 242);
  drawGoal(300, 100);
  moveVillian();
  drawVillian(villianX, villianY);
  drawHero(heroX, heroY);
  if (heroHitVillian()) {
    LoseScreen=true;
  } else if (heroHitGoal()) {
    WinScreen=true;
  }
}
boolean heroHitVillian() {
  float heroBubble = 30;
  float villianBubble = 30;
  if (dist(heroX, heroY, villianX, villianY) <heroBubble+villianBubble) {
    return true;
  }
  return false;
}
boolean heroHitGoal() {
  float heroBubble = 30;
  float GoalBubble = 30;
  if (dist(heroX, heroY, 300, 100 ) <heroBubble+GoalBubble) {
    return true;
  }
  return false;
}
void moveVillianToward(float targetX, float targetY, float howFar) {
  float w = targetX - villianX;
  float h = targetY - villianY;
  float distance = sqrt(w*w+h*h);
  float b = howFar / distance * h;
  float a = howFar / distance * w;
  villianX = villianX + a;
  villianY = villianY + b;
}
void moveVillian() {
  moveVillianToward(heroX, heroY, 2);
}

void keyPressed() {
  if (titleScreen) titleScreen=false;
  if (WinScreen && key==' ') {
    WinScreen=false;
    setup();
  }
  if (LoseScreen && key==' ') {
    LoseScreen=false;
    setup();
  }
  //Press D, move right
  if (key == 'd') {
    heroX = heroX + speed;
  } 
  //Press A, move left
  if (key == 'a') {
    heroX = heroX - speed;
  }
  //Press W, move up
  if (key == 'w') {
    heroY = heroY - speed;
  }
  //Press S, move down
  if (key == 's') {
    heroY = heroY+speed;
  }
}










void drawHero(float x, float y) {
  image(hero, x, y, 80, 50);
}
void drawVillian(float x, float y) {
  image(villian, x, y, 72, 85);
}
void drawGoal (float x, float y) {
  image(goal, x, y, 60, 60);
}



