
float heroX;

float heroY;

float speed;

float enemyX;

float enemyY;

PImage anon; 

PImage criedwolves; 

PImage rei;

PImage background2; 

PImage winrei;

PImage loseanon; 

boolean LoseMode;
boolean TitleMode;
boolean WinMode;



void setup() {
  size(500, 500);
  //starting location for hero

  heroX=100;
  heroY=100;
  //starting location enemy
  enemyX=400;
  enemyY=400;
  speed=25;
  anon=loadImage("anon.png");
  criedwolves=loadImage("croppedcriedwolves.gif");
  rei=loadImage("rei.png");
  background2= loadImage("newbackground.png");
  winrei= loadImage("winrei.jpg");
  loseanon= loadImage("loseanon.png");

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
  } else if (WinMode) {
    drawWinScreen();
  } else if (LoseMode) {
    drawLoseScreen();
  } else {
    drawGame();
  }
}

void drawTitle() {
  background(0);
  textSize(32);
  text("WELCOME", 250, 100);
  text("Don't Let the haters get you", 250, 300);
  text("Goal: Get to Rei", 250, 200);
  text("use arrow keys", 250, 375);
  textSize(20);
  fill(#58C6FF);
  text("press any key to start", 250, 475);
}

void drawWinScreen() {
  image(winrei, width/2, height/2, width, height);
  //background(winrei);
  text("you won rei's love!", 250, 100);
  text("press the n key", 250, 150);
  textSize(32);
  fill(#170B0B);
}

void drawLoseScreen() {
    image(loseanon, width/2, height/2, width, height);
  //background(loseanon);
  text("ur bl0g suX", 250, 50);
  text("press space bar to continue", 250, 475); 
  textSize(32);
  fill(#170B0B);
}

void drawGame() {
  image(background2, width/2, height/2, width, height);
  //background(background2);
  drawHero(heroX, heroY);
  moveEnemy(); 
  drawEnemy(enemyX, enemyY);
  drawGoal(300, 400);
  if (enemyTouchedHero()) {
    LoseMode=true;
  }
  if (goalTouchedHero()) {
    WinMode=true;
  }
}




boolean enemyTouchedHero() {
  float heroBubbleRadius=30;
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
boolean goalTouchedHero() {
  float heroBubbleRadius=30;
  float enemyBubbleRadius=20; 
  noFill(); 
  stroke(255, 0, 0);
  //ellipse(heroX, heroY, heroBubbleRadius, heroBubbleRadius);
  ellipse(300, 400, enemyBubbleRadius, enemyBubbleRadius);
  if (dist(300, 400, heroX, heroY) < heroBubbleRadius+enemyBubbleRadius) {
    return true;
  } else {
    return false;
  }
} 

void moveEnemy() {

  float targetX = (heroX + 300) / 2;
  float targetY = (heroY+400) / 2;

  moveEnemyTowardTarget(heroX, heroY, speed/10);
}

void keyPressed() {
  if (TitleMode) TitleMode=false;
  if (LoseMode && key==' ') {
    LoseMode=false;
    setup();
  }
  if (WinMode && key=='n') {
    WinMode=false;
    setup();
  }

  if (key==CODED && keyCode==RIGHT) heroX = heroX+speed;
  if (key==CODED && keyCode==LEFT) heroX= heroX-speed;
  if (key==CODED && keyCode==UP) heroY= heroY-speed;
  if (key==CODED && keyCode==DOWN) heroY=heroY+speed;
}

void moveEnemyTowardTarget(float targetX, float targetY, float s) {
  float h= targetY - enemyY;
  float w = targetX-enemyX;
  float d= sqrt(h*h+w*w);
  enemyY = enemyY + s / d *h;
  enemyX = enemyX + s / d *w;
}


void drawHero(float x, float y) {
  // fill(#FFF7F7);
  //ellipse(x,y,20,20);
  //ellipse(x-6,y-12,5,20);
  //ellipse(x+6,y-12,5,20);
  image(criedwolves, x, y, 80, 80);
}

void drawEnemy(float x, float y) {
  //fill(255,0,0);
  //triangle(x,y,x+10,y+10,x-10,y+10);
  image(anon, x, y);
}

void drawGoal(float x, float y) {

  //fill(255,255,0);
  // rect(x,y,20,20);
  image(rei, x, y, 50, 50);
}



