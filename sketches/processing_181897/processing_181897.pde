
PImage cat;
PImage mousePic;
PImage cheese;
PImage mousewin;
PImage meancat;
PImage catandmouse;
float heroX;
float heroY;
float enemyX;
float enemyY;
float goalX;
float goalY;
float speed;
boolean TitleMode; 
boolean LoseMode;
boolean WinMode;


void setup () {
  size(500, 500);
  heroX=100;
  heroY=100;
  enemyX=300;
  enemyY=300;
  goalX=400;
  goalY=400;
  speed=5;
  cat = loadImage("cat1.jpg");
  mousePic= loadImage("mouse.jpg");
  cheese= loadImage("cheese.jpg");
  mousewin= loadImage("mousewin.jpg");
  meancat= loadImage("meancat.jpg");
  catandmouse= loadImage ("catandmouse.jpeg");
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
  image (catandmouse, width/2, height/2, width, height);
  stroke (255);
  textSize (25);
  fill (0);
  text ("Use the arrow keys to get the cheese", 250, 200); 
  text ("before getting caught by the cat!", 250, 250);
  textSize (20);
  text ("Press the spacebar to begin", 250, 300);
}

void drawLoseScreen() {
  image (meancat, width/2, height/2, width, height);
  textSize(44);
  text ("You Lose!", 250, 300);
  textSize(30);
  text ("Press spacebar to try again", 250, 350);
}

void drawWinScreen() {
  image (mousewin, width/2, height/2, width, height);
  textSize(44);
  text ("You Win!", 250, 300);
  textSize(30);
  text ("Press spacebar to play again", 250, 350);
}

void drawGame () {
  background (255);
  drawHero (heroX, heroY);
  drawEnemy (enemyX, enemyY);
  moveEnemy();
  drawGoal (goalX, goalY);
  if (enemyTouchedHero()) {

    LoseMode=true;
  }
   if (heroTouchedGoal()) {
     WinMode=true;
    }
}

boolean enemyTouchedHero() {
  float heroBubbleRadius=25;
  float enemyBubbleRadius=25;
  //ellipse(heroX, heroY, heroBubbleRadius*2, heroBubbleRadius*2);
  //ellipse(enemyX, enemyY, enemyBubbleRadius*2, enemyBubbleRadius*2);
  if (dist(enemyX, enemyY, heroX, heroY) < heroBubbleRadius+enemyBubbleRadius) {
    return true;
  }

  return false;
}

boolean heroTouchedGoal() {
  float heroBubbleRadius=25;
  float goalBubbleRadius=25;
  noFill();
  noStroke();
  ellipse(heroX, heroY, heroBubbleRadius*2, heroBubbleRadius*2);
  ellipse(goalX, goalY, goalBubbleRadius*2, goalBubbleRadius*2);
  if (dist(goalX, goalY, heroX, heroY) < heroBubbleRadius+goalBubbleRadius) {
    return true;
  } else {
    return false;
  }
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
  if (key==CODED && keyCode==RIGHT) heroX = heroX+speed;
  if (key==CODED && keyCode==LEFT) heroX= heroX-speed;
  if (key==CODED && keyCode==UP) heroY= heroY-speed;
  if (key==CODED && keyCode==DOWN) heroY = heroY+speed;
}

void drawHero (float x, float y) {
  //ellipse(x,y,20,20);
  image(mousePic, x, y, 50, 50);
}

void drawEnemy (float x, float y) {
  //ellipse(x,y,20,20);
  image(cat, x, y, 75, 80);
}

void drawGoal (float x, float y) {
  //  ellipse(x,y,20,20);
  image(cheese, x, y, 50, 50);
}

void moveEnemy () {
  //float targetX= (heroX+400)/2 + random (-50, 50);
  //float targetY = (heroY+400)/2 + random (-50, 50);
  //float targetX=200;
  moveEnemyTowardTarget(heroX, heroY, speed/4);

  //moveEnemyTowardTarget(targetX, targetY, speed/4);
}

void moveEnemyTowardTarget(float targetX, float targetY, float s) {
  float h=targetY-enemyY;
  float w=targetX-enemyX;
  float d=sqrt(h*h + w*w);
  if (d>1) {
    enemyY=enemyY + s / d * h;
    enemyX=enemyX + s / d * w;
  }
}





