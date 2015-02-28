
//character x and y
 float pX = 255;
 float pY = 255;
//enemy x and y
 float eX = 20;
 float eY = 20;
//press start x and y
 float sX = 260;
 float sY = 260;
//counters for GUI
 int lifeValue = 50;
 int enemyLife = 1000;
//easing for enemy
 float easing = .025;
//speed of character
 float speed = 6;
//level
 int level = 0;  
 PShape Thingy;
 PImage Floor;
 PImage mtn;

void setup(){
  size(500,500);
  textFont(createFont("LithosPro-Regular-40.vlw", 170));
  noStroke();
  Thingy = loadShape("Thingy.svg");
  Floor = loadImage ("hj_512.png");
  mtn = loadImage("mtn.png");
}
 
void draw(){
  smooth();
  background(#050505);
    image(Floor, 0, 0, 500, 500);
  levelUp();
}
 
void character(){
  pX = mouseX;
  pY = mouseY;
  fill(230, 180, 30);
  ellipse(pX,pY,30,30);
}
 
void enemy() {
  float targetX = pX;
  float targetY = pY;
  eX += (targetX - eX) * easing;
  eY += (targetY - eY) * easing;
  fill(230,200,110);
  shape(Thingy, eX, eY, 80, 80);
}

void Chasing() {
    float distC = dist(pX,pY,eX,eY);
    if(distC < 30){
      lifeValue -= 1;
    }
      if(lifeValue == 0){
    gameOver();
      }
      if(distC > 30) {
        enemyLife -= 1;
      }
}

void level1(){
  background(#050505);
  image(Floor, 0, 0, 500, 500);
  character();
  enemy();
  gui();
  Chasing();
  smooth();
  if (lifeValue == 0){
   level = -1; 
  }
  if(enemyLife == 0){
   level = 4; 
  }
  
}
 
void startMenu(){
  //startMenu
  textSize(30);
  textAlign(CENTER,CENTER);
  fill(250);
  text("Become The Master!", 255,200);
  text("Dodge The Alien!", 255, 150);
  text("START",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed  /*&& pStart <= 50*/){
    level=1;
  }     
}
 
void gameOver(){
  //gameOver screen
  textSize(20);
  textAlign(CENTER,CENTER);
  fill(250);
  text("GAME OVER... Patience is Essential!", 255,200);
  text("PRESS START",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 30){
    lifeValue = 50;
    level = 1;
  }
}

void credits(){
  textSize(50);
  textAlign(CENTER,CENTER);
  fill(250);
  text("Congrats!", 250, 100);
  textSize(14);
  textAlign(CENTER,CENTER);
  fill(250);
  text("Through your patience and agility,", 250, 250);
  text("the monster has incapacitated itself with the surrounding mountains", 250, 280);
  text("along with the Dojo's remains.", 250, 310);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed  /*&& pStart <= 50*/){
    level = 0;
  }  
}

void levelMenu(){
  textSize(30);
  textAlign(CENTER,CENTER);
  fill(250);
  text("He has destroyed the Dojo!", 250, 200);
  text("Outside to the Mountain!", 250, 240);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed  /*&& pStart <= 50*/){
    level = 2;
  }  
}
void level2() { //incomplete
  background(#050505);
  image(mtn, 0, 0, 500, 500);
  character();
  enemy();
  gui();
  Chasing();
  smooth();
  if (lifeValue == 0){
   level = -1; 
  }
  if(enemyLife == -1500){
   level =  3;
  }
}

void levelUp(){
  if(level == 0){
    startMenu();
  }
  if(level == 1){
    level1();
  }
  if(level == 2) {
    level2();
  }
  if(level == 3) {
    credits();
  }
  if(level == 4) {
    levelMenu();
  }
  if (level == -1){
   gameOver(); 
  }
}
 
void gui(){
  //in game info
  textSize(20);
  textAlign(LEFT,TOP);
  fill(255);
  text("LIFE = " + lifeValue, 20,30);
  text("Enemy = " + enemyLife, 20, 70);
}



