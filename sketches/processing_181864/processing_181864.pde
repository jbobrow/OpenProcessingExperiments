
PImage hero;
PImage enemy;
PImage goal; 
PImage title; 
PImage win;
PImage lose; 
float heroX;
float heroY; 
float enemyX;
float enemyY; 
float goalX; 
float goalY; 
float speed;
float enemySpeed; 
boolean TitleMode;
boolean LoseMode; 
boolean WinMode;
int score;

void setup() {
  size(900, 800);
  //starting location of the hero 
  heroX=100;
  heroY=100;
  //starting location of enemy 
  enemyX=500;
  enemyY=600; 
  goalX=700; 
  goalY=600; 
  speed=15;  
  enemySpeed=2;
  hero = loadImage("leslie.jpg");
  enemy = loadImage("greg.jpg"); 
  goal = loadImage("waffles.png"); 
  title = loadImage("parks.jpg"); 
  lose = loadImage("greglose.JPG"); 
  win = loadImage("leslieyes.png");  
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
  image (title, width/2, height/2, width, height);
}

void drawLoseScreen() {
  image (lose, width/2, height/2, width, height);
  fill(0);
  textSize(100);
  text(score, 700, 100); 
}

void drawWinScreen () {
  image (win, width/2, height/2, width, height);
  fill(0);
  textSize(100); 
  text(score, 700, 100); 
}



void drawGame() {
  background (210, 238, 247); 
  drawHero (heroX, heroY); 
  moveEnemy();
  drawEnemy(enemyX, enemyY); 
  drawGoal(goalX, goalY);
  if (enemyTouchedHero()) {
    LoseMode=true;
    score = score-1;
  }
  if (heroTouchedGoal()) {
    WinMode=true;
    score = score+1; 
  }
}

boolean enemyTouchedHero() { 
  float heroBubbleRadiusX=75; 
  float heroBubbleRadiusY=75; 
  float enemyBubbleRadiusX=75;
  float enemyBubbleRadiusY=75; 
  float enemyBubbleRadius=100; 
  noFill(); 
  stroke(255, 0, 0); 
  rect(heroX, heroY, heroBubbleRadiusX*2, heroBubbleRadiusY*2); 
  rect(enemyX, enemyY, enemyBubbleRadiusX*2, enemyBubbleRadiusY*2); 
  if (abs(heroX-enemyX) < heroBubbleRadiusX + enemyBubbleRadiusX && abs(heroY-enemyY) < heroBubbleRadiusY+enemyBubbleRadiusY ) {
    return true;
  } else {
    return false;
  }
}
boolean heroTouchedGoal() {
  float heroBubbleRadiusX=75; 
  float heroBubbleRadiusY=75; 
  float goalBubbleRadiusX=75; 
  float goalBubbleRadiusY=75; 
  float goalBubbleRadius=100; 
  noFill(); 
  stroke(255, 0, 0); 
  rect(heroX, heroY, heroBubbleRadiusX*2, heroBubbleRadiusY*2); 
  rect(goalX, goalY, goalBubbleRadiusX*2, goalBubbleRadiusY*2); 
  if (abs(heroX-goalX) < heroBubbleRadiusX + goalBubbleRadiusX && abs (heroY-goalY) < heroBubbleRadiusY+goalBubbleRadiusY) {
    return true;
  } else {
    return false;
  }
}


  void moveEnemy() {
    //Going toward midpoint with randomization
    //float targetX = (heroX + 700) / 2 + random(-50, 50); 
    //float targetY = (heroY + 600) / 2 + random(-50, 50); 


    moveEnemyTowardTarget(heroX, heroY, enemySpeed);
  }

  void keyPressed() { 
    if (TitleMode) TitleMode = false; 
    if (LoseMode && key== ' ') {
      LoseMode=false;
      setup();
    }
    if (WinMode && key== ' ') {
      WinMode=false;
      setup();
    }
    if (key==CODED && keyCode==RIGHT) heroX = heroX+speed;
    if (key==CODED && keyCode==LEFT) heroX = heroX-speed; 
    if (key==CODED && keyCode==UP) heroY = heroY-speed; 
    if (key==CODED && keyCode==DOWN) heroY = heroY+speed;
  }

  void moveEnemyTowardTarget( float targetX, float targetY, float s) {
    float h = targetY-enemyY; 
    float w = targetX - enemyX; 
    float d = sqrt(h*h + w*w); 
    enemyY = enemyY + s / d * h; 
    enemyX = enemyX + s / d * w;
  }

  void drawHero(float x, float y) {
    fill(255);
    image(hero, x, y, 150, 150);
  }

  void drawEnemy (float x, float y) {
    image(enemy, x, y, 150, 150);
  }

  void drawGoal(float x, float y) {
    image(goal, x, y, 150, 150);
  }




