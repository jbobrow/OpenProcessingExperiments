
float heroX;
float heroY;
float speed;
float villainX;
float villainY;
float villainX2;
float villainY2;
boolean TitleScreen;
boolean LoseScreen;
boolean WinScreen;
PImage fire;
PImage snowflake2;
PImage snowman;

void setup() {
  size(500, 500);
  heroX = 20;
  heroY = 40;
  villainX=width/2;
  villainY2=height/2;
  villainX2=300;
  villainY=400;
  speed = 5;
  TitleScreen=true;
  WinScreen=false;
  LoseScreen=false;
  fire = loadImage("fire.png");
  snowflake2 = loadImage("snowflake.png");
  snowman = loadImage("snowman.jpg");
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
}

void draw() {
  if (TitleScreen) {
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
  background(70, 226, 255);
  textSize(30);
  fill(0);
  text("You Win:)", 250, 100);
  textSize(20);
  text("Press Any Key to Play Again", 240, 250);
}

void drawLoseScreen() {
  background(200, 0, 0);
  textSize(30);
  fill(0);
  text("You Lose:(", 250, 100);
  textSize(20);
  text("Press Any Key to Play Again", 240, 250);
}

void drawTitle() {
  background(70, 77, 255);
  stroke(193, 207, 242);
  textSize(30);
  fill(193, 207, 242);
  text("Save Your Snowman!", 250, 100);
  textSize(20);
  text("Press Any Key To Play", 240, 250);
}

void drawGame() {
  background(198, 236, 240);
  moveVillain();
  moveVillain2();
  drawHero(heroX, heroY);
 drawVillain(villainX, villainY);
  drawVillain(villainX2, villainY2);
  drawGoal(400, 400);
  if (heroHitVillain()) {
    //End the game
    LoseScreen=true;
  } else if (heroHitGoal()) {
    WinScreen=true;
  }
}

boolean heroHitVillain() {
  noFill();
  noStroke();
  float heroBubble = 35;
  float villainBubble = 15;
  ellipse(heroX, heroY, heroBubble*2, heroBubble*2);
  ellipse(villainX, villainY, villainBubble*2, villainBubble*2);
  if (dist(heroX, heroY, villainX, villainY) < heroBubble + villainBubble) {
    return true;
  }

  if (dist(heroX, heroY, villainX2, villainY2) < heroBubble + villainBubble) {
    return true;
  }
  return false;
}
boolean heroHitGoal() {
  noFill();
  noStroke();
  float heroBubble = 35;
  float goalBubble = 15;
  noFill();
  noStroke();
  ellipse(heroX, heroY, heroBubble*2, heroBubble*2);
  ellipse(400, 400, goalBubble*2, goalBubble*2);
  if (dist(heroX, heroY, 400, 400) < heroBubble + goalBubble) {
    return true;
  }
  return false;
}

void moveVillaintoward(float targetX, float targetY, float howFar) {
  float w = targetX - villainX;
  float h = targetY - villainY;
  float w2 = targetX - villainX2;
  float h2 = targetY - villainY2;
  float distance = sqrt(w*w + h*h);
  float b = howFar / distance * h;
  float a = howFar / distance * w;
  villainX = villainX + a;
  villainY = villainY + b;
  villainX2 = villainX2 + a;
  villainY2 = villainY2 + b;
}

void moveVillain() {
  //villainX = villainX + random(-speed, speed);
  //villainY = villainY + random(-speed, speed);
  //if (villainX < 0) villainX = bb0;
  //if (villainY < 0) villainY = 0;
  //moveVillaintoward(heroX, heroY, 1);
  moveVillaintoward((400+heroX)/2+random(-100, 100), (400+heroY)/2+random(-50, 50), 0.5);
}

void moveVillain2() {
  //villainX = villainX + random(-speed, speed);
  //villainY = villainY + random(-speed, speed);
  //if (villainX < 0) villainX = bb0;
  //if (villainY < 0) villainY = 0;
  //moveVillaintoward(heroX, heroY, 1);
  moveVillaintoward((400+heroX)/2+random(-50, 50), (400+heroY)/2+random(-60, 50), 0.5);
}
void keyPressed() {
  if (TitleScreen) TitleScreen=false;
  if (WinScreen && key==' ') {
    WinScreen=false;
    setup();
  }
  if (LoseScreen && key==' ') {
    LoseScreen=false;
    setup();
  }
  //pressD, move right
  if (key == 'd') {
    heroX = heroX + speed;
  }
  //pressS, move down
  if (key == 's') {
    heroY = heroY + speed;
  }
  if (key == 'a') {
    heroX = heroX - speed;
  }
  if (key == 'w') {
    heroY = heroY - speed;
  }
}

void drawHero(float x, float y) {
  //fill(255);
  //noStroke();
  //firsthead
  //ellipse(x, y-16, 12, 12);
  //secondhead
  //ellipse(x, y, 20, 20);
  //thirdhead
  //ellipse(x, y+28, 35, 35);
  image(snowman, x, y, 70, 70);
}

void drawVillain(float x, float y) {
  //fill(255, 0, 0);
  //triangle(x, y, x-12, y-12, x+12, y-12);
  image(fire, x, y, 30, 30);
}
void drawVillain2(float x, float y) {
  image(fire, x, y, 30, 30);
}

void drawGoal(float x, float y) {
  //fill(202, 205, 51);
  //ellipse(x, y, 20, 20);
  image(snowflake2, x, y, 30, 30);
}



