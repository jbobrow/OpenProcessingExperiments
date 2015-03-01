
float heroX;
float heroY;
float enemyX;
float enemyY;
float targetX;
float targetY;
float speed;
PImage castle;
PImage me;
PImage arrow;
PImage peasant;
PImage throne;
PImage gate;
PImage king;
boolean TitleMode;
boolean LoseMode;
boolean WinMode;

void setup() {
  size(500, 500);
  //starting location of the hero
  heroX=400;
  heroY=100 ; 
  enemyX=100;
  enemyY=100;
  targetX=200;
  targetY=200;
  speed= 6;
  castle=loadImage("castle.jpg");
  me=loadImage("me.PNG");
  arrow=loadImage("arrow.png");
  peasant=loadImage("peasant.gif");
  throne=loadImage("throne.jpg");
  gate=loadImage("gate.jpg");
  king=loadImage("king.jpg");
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  TitleMode=true;
  LoseMode=false;
  WinMode=false;
}

void draw() {
  if (TitleMode) {
    drawTitle();
  } else if (LoseMode) {
    drawLoseScreen();
  } else if (WinMode) {
    drawWinScreen();
  } else {
    drawGame();
  }
}

void drawTitle() {
  image(gate, 250, 250, 500, 500);
}

void drawLoseScreen() {
  image(peasant, 250, 250, 500, 500);
}

void drawWinScreen() {
  image(throne, 250, 250, 500, 500);
  stroke(225, 255, 252);
    textSize(75);
  text("you da QUEEN",250,250);
}


void drawGame() {
  background(225, 255, 252);
  drawHero(heroX, heroY);
  moveEnemy();
  drawEnemy(enemyX, enemyY);
  drawTarget(300, 300);
  if (enemyTouchedHero()) {
    LoseMode=true;
  }
  if(heroTouchedTarget()){
    WinMode=true;
  }
}
boolean enemyTouchedHero() {
  float heroBubbleRadius=20;
  float enemyBubbleRadius=20;
  noFill();
  stroke(255, 0, 0);
  ellipse(heroX, heroY, heroBubbleRadius, heroBubbleRadius);
  ellipse(enemyX, enemyY, enemyBubbleRadius, enemyBubbleRadius);  
  if (dist(enemyX, enemyY, heroX, heroY) < heroBubbleRadius+enemyBubbleRadius) {
    return true;
  } else {
    return false;
  }
}

boolean heroTouchedTarget() {
  float targetBubbleRadius=100;
  float heroBubbleRadius=20;
  noFill();
  stroke(0);
  ellipse(targetX, targetY, targetBubbleRadius, targetBubbleRadius);
  ellipse(heroX, heroY, heroBubbleRadius, heroBubbleRadius);  
  if (dist(heroX, heroY, targetX, targetY) < targetBubbleRadius+heroBubbleRadius) {
    return true;
  } else {
    return false;
  }
}

void moveEnemy() {
  float targetX = (heroX + 300) / 2;
  float targetY = (heroY + 300) / 2;
  moveEnemyTowardTarget(targetX, targetY, speed/30);
}

void keyPressed() {
  if (TitleMode) TitleMode=false;
  if (LoseMode && key==' ') {
    LoseMode=false;
    setup();
  }
  if (WinMode && key==' ') {
    WinMode=false;
    setup();
  }
  if (key==CODED && keyCode==RIGHT) heroX=heroX+speed;
  if (key==CODED && keyCode==LEFT) heroX=heroX-speed;
  if (key==CODED && keyCode==UP) heroY=heroY-speed;
  if (key==CODED && keyCode==DOWN) heroY=heroY+speed;
}


void moveEnemyTowardTarget(float targetX, float targetY, float s) {
  float h = targetY - enemyY;
  float w = targetX - enemyX;
  float d = sqrt(h+h + w+w);
  if (d>1) {
    enemyY = enemyY + s / d * h;
    enemyX = enemyX + s / d * w;
  }
}

void drawHero(float x, float y) {
  stroke(215, 255, 252);
  fill(215, 255, 252);
  ellipse(x, y, 60, 60); 
  image(king, x, y, 150, 80);
}

void drawEnemy(float x, float y) {
  image(arrow, x, y, 100, 100);
  triangle(x, y, x+10, y+10, x-10, y+10);
}

void drawTarget(float x, float y) {
  //rect(x,y,200,200);
  image(castle, x, y, 200, 200);
}




