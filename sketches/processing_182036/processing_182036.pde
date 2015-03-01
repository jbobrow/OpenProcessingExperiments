
float heroX;
float heroY;
float villainX;
float villainY;
float goalX;
float goalY;
float villainSpeed;
float speed;
boolean TitleScreen;
boolean LoseScreen;
boolean WinScreen;
boolean DHeld;
boolean SHeld;
boolean WHeld;
boolean AHeld;
PImage pacman;
PImage pacmanGhost2;
PImage cherry2;


void setup() {
  size(500, 500);
  background(0);
  speed=2.5;
  villainSpeed=3;
  goalX=random(0,width);
  goalY=random(0,height);
  if (heroHitGoal()){
    goalX=goalX+50;
  }
  heroX= width/2;
  heroY= height/2;
  villainX= width/4;
  villainY= height/4;
  TitleScreen=true;
  WinScreen=false;
  LoseScreen=false;
  DHeld=false;
  SHeld=false;
  WHeld=false;
  AHeld=false;
  pacman= loadImage("pacman.png");
  pacmanGhost2= loadImage("pacmanGhost2.png");
  cherry2= loadImage("cherry2.png");
  
}

void draw() {
  if (TitleScreen){
    drawTitle();
  }else if (LoseScreen){
    drawLoseScreen();
  }else if (WinScreen){
    drawWinScreen();
  }else{
    drawGame();
}
}

void drawWinScreen() {
  background (6,206,74);
  stroke(0);
  textSize(48);
  text("Winner!", 150,250);
  textSize(20);
  text("Press space to play again",110,400);
}

void drawLoseScreen(){
  background (200,0,0);
  stroke(0);
  textSize(48);
  text("You Lost", 125,250);
  textSize(20);
  text("Press space to play agian",110,400);
}
void drawTitle(){
  background (2562,243,59);
  fill(0);
  stroke(0);
  textSize(48);
  text("PACMAN",145,200);
  textSize(38);
  text("Press any key to play",60,380);
  text("Get the cherry to win",60,300);}
void drawGame(){
  background(0);
  moveVillain();
  drawVillain(villainX, villainY);
  drawGoal(goalX, goalY);
  if(DHeld) heroX= heroX+speed;
  if(WHeld) heroY= heroY-speed;
  if(AHeld) heroX= heroX-speed;
  if(SHeld) heroY= heroY+speed;
  drawHero(heroX, heroY);
  if (heroHitVillain()){
    LoseScreen=true;
  }else if (heroHitGoal()){
    WinScreen=true;
  }
}
boolean heroHitGoal(){
 float heroBubble=15;
 float goalBubble=15;
 if (dist(heroX, heroY, goalX, goalY)< heroBubble + goalBubble){
  return true; 
}
  return false;
}
boolean heroHitVillain(){
 float heroBubble=15;
 float villainBubble=15;
 if (dist(heroX, heroY, villainX, villainY)< heroBubble + villainBubble){
  return true; 
}
  return false;
}
void moveVillain() {
  moveVillainToward(heroX+random(-50,50), heroY+random(-50,50), villainSpeed);
}
void keyPressed() {
  if(TitleScreen) TitleScreen=false;
  if(WinScreen && key==' '){
    WinScreen=false;
    setup();
  }
  if(LoseScreen && key==' '){
    LoseScreen=false;
    setup();
  } 
  //Press D, move right
  if (key=='d') DHeld=true;
  //Press S, move down
  if (key=='s') SHeld=true;
  //Press A, move left
  if (key=='a') AHeld=true;
  //Press W, move up
  if (key=='w') WHeld=true;
}

void keyReleased(){
  if(key=='d') DHeld=false;
  if(key=='s') SHeld=false;
  if(key=='a') AHeld=false;
  if(key=='w') WHeld=false;
}
  
void moveVillainToward (float targetX, float targetY, float howFar) {
    float w= targetX- villainX;
    float h= targetY-villainY;
    float distance= sqrt(w*w+h*h);
    float b= howFar/ distance *h;
    float a=howFar/ distance *w;
    villainX= villainX +a;
    villainY= villainY +b;
  }
void drawHero(float x, float y) {
 // fill(241, 247, 75);
  //head
 // ellipse (x, y, 20, 20);
  //mouth
  // triangle(110,100,117,95,117,105);
  image(pacman, x, y, 30, 30);
}
void drawVillain (float x, float y) {
  //fill(255);
  //rect(x, y, 10, 10);
  image(pacmanGhost2, x, y, 30, 30);
}

void drawGoal (float x, float y) {
 // fill(247, 35, 53);
 // triangle(300, 10, 310, 20, 290, 20);
 image(cherry2, x, y, 30, 30);
}



