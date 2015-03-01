
PImage orc;
PImage frodo;
PImage mountdoom;
float heroX;
float heroY;
float speed;
float enemyX;
float enemyY;
float goalX;
float goalY;
boolean TitleMode;
boolean LoseMode;
boolean WinMode;

void setup () {
  size(500, 500); 
  //starting hero location
  heroX=100;
  heroY=100;
  //starting enemy location
  enemyX=400;
  enemyY=400;
  speed=10;
  goalX=250;
  goalY=250;
  orc = loadImage("orc.jpg");
  frodo = loadImage("frodo.jpg");
  mountdoom = loadImage("mountdoom.jpg");
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  TitleMode=true;
  LoseMode=false;
  WinMode=false;
}

void draw(){
 if(TitleMode){
    drawTitle();
 }else if(LoseMode){
    drawLoseScreen();
 }else if(WinMode){
    drawWinScreen();
 }else{
  drawGame(); 
 }
}

void drawTitle(){
  background(255);
  textSize(32);
  fill(0);
  text("Good Luck",250,250);
  textSize(25);
  text("Push Any Key to Begin",250,350);
}

void drawLoseScreen(){
  background(0);
  fill(255);
  textSize(32);
  String s = "Saruman got the ring and killed you.";
  text(s,125,150, 250,250);
  text("Push Space to Continue",250,450);
}

void drawWinScreen(){
  background(0,255,0);
  fill(0);
  textSize(32);
  String s = "Congratulations You destroyed the ring.";
  text(s,125,150,250,250);
  text("Push Space to Continue",250,450);
}

void drawGame () {
  background(185, 6, 12);
  moveEnemy();
  drawGoal(goalX, goalY);
  drawHero(heroX, heroY); 
  drawEnemy(enemyX, enemyY);
  if(enemyTouchedHero()) {
    LoseMode=true;
  }
  if(heroTouchedGoal()){
    WinMode=true;
  }
}

boolean enemyTouchedHero() {
  float heroBubbleRadius = 20;
  float enemyBubbleRadius = 20;
  noFill();
  noStroke();
  ellipse(heroX,heroY,heroBubbleRadius*4, heroBubbleRadius*4);
  ellipse(enemyX,enemyY,enemyBubbleRadius*4, enemyBubbleRadius*4);
  if (dist(enemyX, enemyY, heroX, heroY) < heroBubbleRadius+enemyBubbleRadius){
    return true;
  }else{
  return false; 
  }
}

boolean heroTouchedGoal(){
  float heroBubbleRadius = 20;
  float goalBubbleRadius=20;
  noFill();
  noStroke();
  ellipse(heroX,heroY,heroBubbleRadius*4, heroBubbleRadius*4);
  ellipse(goalX,goalY,goalBubbleRadius*4, goalBubbleRadius*4);
  if (dist(goalX, goalY,heroX,heroY)< heroBubbleRadius+goalBubbleRadius){
    return true;
  }else{
    return false;
  }
}


void keyPressed() {
  if (TitleMode) TitleMode=false;
  if(LoseMode && key==' '){
    LoseMode=false;
    setup();
  }
  if(WinMode && key==' '){
    WinMode=false;
    setup();
  }
  if (key == CODED && keyCode == RIGHT) heroX = heroX+speed; 
  if (key == CODED && keyCode == LEFT) heroX = heroX-speed;
  if (key == CODED && keyCode == UP) heroY = heroY-speed; 
  if (key == CODED && keyCode == DOWN) heroY = heroY+speed;
}

void drawHero(float x, float y) {
  image(frodo, x, y, 75, 75);
}

void drawEnemy(float x, float y) {
  image(orc, x, y, 75, 75);
}

void drawGoal(float x, float y) {
  image(mountdoom, x, y, 75, 75);
}

void moveEnemy() {
  //going toward midpoint with randomization
  //float targetX = (heroX +300)/2 random(-50,50);
  //float targetY = (heroY + 400)/2 random(-50,50);
  float targetX = heroX;
  float targetY = heroY;
  
  moveEnemyTowardTarget(targetX, targetY, speed/4);
}

void moveEnemyTowardTarget(float targetX, float targetY, float s) {
  float h = targetY - enemyY;
  float w = targetX - enemyX;
  float d = sqrt(h*h + w*w);
  if (d>1){
    enemyY = enemyY + s/d * h;
    enemyX = enemyX + s/d * w;
  } 
}



