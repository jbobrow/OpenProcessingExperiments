
//timer for "food"
 int savedTime;
 int timer1 = 4000;
//character x and y
 float x = 300;
 float y = 300;
//food x and y
 float fX = 20;
 float fY = 20;
//enemy x and y
 float eX = 15;
 float eY = 15;
//press start x and y
 float sX = 255;
 float sY = 255;
//counters for GUI
 int lifeValue = 50;
 int foodValueC = 0;
 int foodValueE = 0;
//easing for enemy
 float easing = .005;
//speed of character
 float speed = 10;
//level
 int level = 0;
 
void setup(){
  size(500,500);
  //create font
  textFont(createFont("Langdon", 50));
  //outline
  noStroke();
  //milliseconds since start
  savedTime = millis();
}
 
void draw(){
  smooth();
  background(255);
  levelUp();
  
   
}
 
void food(){
  //respawn
 int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    fX = random(500);
    fY = random(500);
    savedTime = millis();
  }
   fill(0);
   ellipse(fX,fY,55,55);
}
 
 
 
void character(){
  //character movement
    float targetX = mouseX;
float targetY = mouseY;
fX += (targetX - fX) * easing;
fY += (targetY - fY) * easing;
fill(#52DDE8);
ellipse(fX,fY,30,30);
}
 
void eat(){
  //distance between character and food
  float distC = dist(x,y,fX,fY);
  //distance between enemy and food
  float distE = dist(eX,eY,fX,fY);
  //distance between character and enemy
  float distD = dist(x,y,eX,eY);
  if(distC < 30){
    fX = random(500);
    fY = random(500);
    foodValueC += 1;
  }
  if(distE < 30){
    fX = random(500);
    fY = random(500);
    foodValueE += 1;
  }
  if(distD < 30){
    lifeValue -= 1;
  }
  if(lifeValue <= 0){
    level = -1;
  }
}
 
void enemy(){
  //movement and creation of enemy characters
  float targetX = fX;
  float targetY = fY;
  eX += (targetX - eX) * easing;
  eY += (targetY - eY) * easing;
  fill(110, 27, 245);
ellipse(eX, eY, 90,90);
}
   
 
void level1(){
  //level 1
  food();
  character();
  eat();
  enemy();
  gui();
   
}
 
void startMenu(){
  //startMenu
  textSize(30);
  textAlign(CENTER,CENTER);
  fill(0);
  text("PRESS START",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 30){
    level = 1;
  }
     
}
 
void gameOver(){
  //gameOver screen
  textSize(30);
  textAlign(CENTER,CENTER);
  fill(0);
  text("YOU LOSE", 255,200);
  text("CLICK START",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 30){
    lifeValue = 10;
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
  fill(0);
  text("LIFE = " + lifeValue, 20,30);
  text("YOU =  " + foodValueC, 20, 60);
  text("VILLAIN = " + foodValueE, 20, 90);
}
