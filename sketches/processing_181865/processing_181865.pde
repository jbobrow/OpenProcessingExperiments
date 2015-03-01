
//PImage santa;
float heroX;
float heroY;
float enemyX;
float enemyY;
float speed;
boolean TitleMode;
boolean LoseMode;
boolean WinMode;
float goalX;
float goalY;

//make a data folder in the game folder, load the pictures in there
//

void setup () {
  size(500, 500);
  heroX=100;
  heroY=100;
  speed=5;
  enemyX=400;
  enemyY=400;
  goalX=300;
  goalY=300;
  //santa=loadImage("santa.jpg");
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
    drawLoseScreen ();
  } else if (WinMode) {
    drawWinScreen();
  } else {
    drawGame();
  }
}

void drawTitle() {
  background(62,227,206);
  textSize(30);
  fill(0);
  text("Fit a circle in a square",250,100);
  text("(press any key to play)",250,400);
}
void drawLoseScreen() {
textSize(30);
  background(255, 0, 0);
  text("you lose", 250,100);
  text("(let the rain fall down)", 250,300);
  text("press space to continue", 250,400);
}
void drawWinScreen() {
textSize(30);
  background(0, 255, 0);
  text("you win", 250,100);
  text("press space to continue",250,400);

  
}


void drawGame() {
  background(113, 108, 108);
  drawHero(heroX, heroY);
  moveEnemy();
  drawEnemy(enemyX, enemyY);
  drawGoal(goalX, goalY);
  if (enemyTouchedHero()) {
    LoseMode=true;
  }
  if (heroTouchedGoal()) {
    WinMode=true;
  }
}

  boolean heroTouchedGoal() {
    float heroBubbleRadius=20;
    float goalBubbleRadius=20;
    noFill();
    stroke(255, 0, 0);
    //ellipse(heroX, heroY, heroBubbleRadius *2, heroBubbleRadius *2);
    //ellipse(goalX, goalY, goalBubbleRadius *2, goalBubbleRadius *2);
    if (dist(goalX, goalY, heroX, heroY) < goalBubbleRadius + heroBubbleRadius) {
      return true;
    } else {
      return false;
    }
  }


  boolean enemyTouchedHero() {
    float heroBubbleRadius=20;
    float enemyBubbleRadius=20;
    noFill();
    stroke(255, 0, 0);
    //ellipse(heroX, heroY, heroBubbleRadius *2, heroBubbleRadius *2);
    //ellipse(enemyX, enemyY, enemyBubbleRadius *2, enemyBubbleRadius *2);
    if (dist(enemyX, enemyY, heroX, heroY) < enemyBubbleRadius + heroBubbleRadius) {
      return true;
    } else {
      return false;
    }
  }
  void keyPressed() {
    if (TitleMode) TitleMode=false;
    if (LoseMode && key== ' ') {
      LoseMode=false;
      setup();
    }
    if (WinMode && key== ' ') {
      LoseMode=false;
      setup();
    }
    if (key==CODED && keyCode==RIGHT) heroX=heroX+speed; 
    if (key==CODED && keyCode==LEFT) heroX=heroX-speed;
    if (key==CODED && keyCode==DOWN) heroY=heroY+speed; 
    if (key==CODED && keyCode==UP) heroY=heroY-speed;
  }  

  void moveEnemy() {
    //float targetX = (heroX + 350) /2 + random(-50,50);
    //float targetY = (heroY +350) / 2 + random (-50,50);
    float targetX=heroX;
    float targetY=heroY;
    moveEnemyTowardTarget(targetX, targetY, speed/4);
  }

  void moveEnemyTowardTarget(float targetX, float targetY, float s) {
    float h = targetY - enemyY;
    float  w = targetX - enemyX;
    float d = sqrt(h*h + w*w);
    enemyY= enemyY + s / d * h;
     enemyX= enemyX + s / d * w;
  }


  void drawHero(float x, float y) {
    fill(33, 38, 255);
    ellipse(x, y, 20, 20);
  }

  void drawEnemy(float x, float y) {
    fill(255, 0, 0);
    triangle(x, y-8, x-12, y+8, x+13, y+8);
    //image(santa, x , y);
  }

  void drawGoal(float x, float y) {
    fill(252, 255, 90);
    rect(x, y, 20, 20);
  }



