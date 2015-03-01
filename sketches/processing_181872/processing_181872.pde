
PImage harrypotter;
PImage voldemort;
PImage kissing;
PImage ginnydead;
PImage ginny;
PImage dueling;
float heroX;
float heroY;
float enemyX;
float enemyY;
float speed;
boolean TitleMode;
boolean LoseMode;
boolean WinMode;

void setup () {
  size (500, 500);
  //starting location of the hero
  heroX=50;
  heroY=50;
  // starting location of enemy
  enemyX=225;
  enemyY=225;
  speed=3;
  harrypotter= loadImage("harrypotter.jpg");
  voldemort= loadImage("voldemort.jpg");
  kissing= loadImage("kissing.jpg");
  ginnydead= loadImage("ginnydead.jpg");
  ginny= loadImage("ginny.jpg");
  dueling= loadImage("dueling.jpg");
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
  image(dueling, width/2, height/2, width, height);
  textSize(35);
  fill (227, 87, 48);
  text("The Ultimate Battle", 250, 40);
 fill(111,211,102);
  textSize(20);
  text("Help Harry Save Ginny from Voldemort",250, 100);
  textSize(10);
  text("press space bar to start", 250, 135);
  text("use arrow keys to navigate", 250, 170);
 // background(255);
}

void drawLoseScreen() {
  image(ginnydead, width/2, height/2, width, height);
  strokeWeight (10);
  textSize(35);
  fill(134,39,39);
  text ("You Lose", 200,15);
fill(134,39,39);
  strokeWeight(1);
  textSize(15);
  text ("press space bar to continue", 200, 50);
  //background(255, 0, 0);
}

void drawWinScreen() {
  image(kissing,width/2,height/2, width, height);
  strokeWeight(10);
  textSize(30);
  fill(134,39,39);
  text("You Win!", 62, 20);
   fill(134, 39,39);
  strokeWeight(1);
  textSize(15);
  text("press space", 50, 75 );
  text("bar to", 50, 100);
  text("continue", 50, 125);
  //background(0, 255, 0);
}

void drawGame() {
  background(0);
  drawHero(heroX, heroY);
  moveEnemy();
  drawEnemy(enemyX, enemyY);
  drawGoal(400, 400);
  if (enemyTouchedHero()) {
    LoseMode=true;
  }
    if (heroTouchedGoal()) {
      WinMode=true;    
      //if (enemyTouchedHero()) {
      // put game end code here
      // textSize(44);
      // text ("Hit!", 250, 20);
    }
  }
boolean enemyTouchedHero() {
  float heroBubbleRadius=25;
  float enemyBubbleRadius=25;
  noFill();
  stroke(0);
  //ellipse(heroX, heroY, heroBubbleRadius*2, heroBubbleRadius*2);
  //ellipse(enemyX, enemyY, enemyBubbleRadius*2, enemyBubbleRadius*2);
  if (dist(enemyX, enemyY, heroX, heroY) < heroBubbleRadius+enemyBubbleRadius) {
    return true;
  } else {
    return false;
  }
  // if (enemy did in fact touch the hero) {
  //return true;
  //}else{
  //}
}
boolean heroTouchedGoal() {
  float heroBubbleRadius=25;
  float goalBubbleRadius=10;
  noFill();
  stroke(0);
  //ellipse(heroX, heroY, heroBubbleRadius*2, heroBubbleRadius*2);
  //ellipse(400, 400, goalBubbleRadius*2, goalBubbleRadius*2);
  if (dist(heroX, heroY, 400, 400) < heroBubbleRadius+goalBubbleRadius) {
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
  if (WinMode && keyCode==' ') {
    WinMode=false;
    setup();
  }
  if (key==CODED && keyCode==RIGHT) heroX = heroX+speed;
  if (key==CODED && keyCode==LEFT) heroX = heroX-speed;
  if (key==CODED && keyCode==UP) heroY = heroY-speed;
  if (key==CODED && keyCode==DOWN) heroY = heroY+speed;
}

void moveEnemyTowardTarget(float targetX, float targetY, float s) {
  float h= targetY -enemyY;
  float w= targetX- enemyX;
  float d= sqrt(h*h + w*w);
  enemyY = enemyY + s / d * h;
  enemyX = enemyX + s / d * w;
}

void drawHero(float x, float y) {
  fill (255);
  //ellipse(x,y,20,20);
  image(harrypotter, x, y, 27, 54);
}

void drawEnemy(float x, float y) {
  fill (247, 12, 16);
  //rect (x, y, 5, 30);
  image(voldemort, x, y, 30, 60);
}

void drawGoal(float x, float y) {
  fill (255);
  image(ginny, x, y, 30,60);
  //triangle (x, y, x+10, y+10, x-10, y+10);
}

void moveEnemy () {
  //Going toward midpoint with randomization
  //float targetX = (heroX + 300) / 2 + random(-50,50);
  //float targetY = (heroY + 400) / 2 + random(-50, 50);
  moveEnemyTowardTarget(heroX, heroY, speed/3);
}



