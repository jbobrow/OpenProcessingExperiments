
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
 int enemyLife = 1500;
//easing for enemy
 float easing = .025;
//speed of character
 float speed = 6;
//level
 int level = 0;  
 PShape Thingy;
 PImage Floor;

void setup(){
  size(500,500);
  textFont(createFont("LithosPro-Regular-40.vlw", 170));
  noStroke();
  Thingy = loadShape("Thingy.svg");
  Floor = loadImage ("hj_512.png");
}
 
void draw(){
  smooth();
  background(255, 50, 100);
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
      if(lifeValue <= 0){
    level = -1;
      }
      if(distC > 30) {
        enemyLife -= 1;
      }
}

   
 
void level1(){
  //level 1
  character();
  enemy();
  gui();
  Chasing();
   
}
 
void startMenu(){
  //startMenu
  textSize(30);
  textAlign(CENTER,CENTER);
  fill(250);
  text("Become The Master!", 255,200);
  text("Defeat The Alien!", 255, 150);
  text("START",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 50){
    level = 1;
  }
     
}
 
void gameOver(){
  //gameOver screen
  textSize(30);
  textAlign(CENTER,CENTER);
  fill(250);
  text("GAME OVER", 255,200);
  text("PRESS START",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 30){
    lifeValue = 50;
    level = 1;
  }
}
 
void levelUp(){
  //checking for level
  if(level == 0){
    startMenu();
  }
  if(level == 1){
    level1();
  }
  if(level == -1){
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



