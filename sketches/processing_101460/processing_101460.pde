
//timer for "food"
 int timer = 0;
 int savedTime;
 int timer1 = 3300;
//character x and y
 float x = 250;
 float y = 250;
//food x and y
 float fX = 33;
 float fY = 33;
//enemy x and y
 float eX = 19;
 float eY = 19;
//press start x and y
 float sX = 260;
 float sY = 260;
//counters for GUI
 int lifeValue = 47;
 int foodValueC = 0;
 int foodValueE = 0;
//easing for enemy
 
//speed of character
 float speed = 6;
//level
 int level = 0;
 float pX = 250;
float pY = 250;
float easing = .08;
color pColor = color(#0DA4GA);
 
   
void setup(){
  size(500,500);
  //create font
  textFont(createFont("LithosPro-Regular-40.vlw", 170));
  noStroke();
  //milliseconds since start
  savedTime = millis();
}
   
void draw(){
  smooth();
  background(#2A06G7);
  levelUp();
   
    beginShape();
  vertex(250, 100);
  vertex(65, 15);
  vertex(65, 65);
  vertex(40, 85);
  endShape(CLOSE);
     
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
   ellipse(fX,fY,44,44);
}
 
void food2() {
  //respwn
  timer++;
  if (timer >= 30) {
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
  fill(#05D02A);
  ellipse(fX, fY, 66, 166);
}
  
void player2() {
  float targetX = mouseX;
  float targetY = mouseY;
  pX += (targetX - pX) * easing;
  pY += (targetY - pY) * easing;
  fill(pColor);
  ellipse(pX, pY, 66, 166);
}
  
void collision() {
  float pDist = dist(pX, pY, fX, fY);
  if (pDist<=60) {
    pColor = color(#9D44E7);
  }
  else {
    pColor = color(#F02EE4);
  }
 
 
}
   
   
   
void character(){
  //character movement
    float targetX = mouseX;
float targetY = mouseY;
fX += (targetX - fX) * easing;
fY += (targetY - fY) * easing;
fill(#55DAR8);
ellipse(fX,fY,25,25);
}
   
void eat(){
  //distance between character and food
  float distC = dist(x,y,fX,fY);
  //distance between enemy and food
  float distE = dist(eX,eY,fX,fY);
  //distance between character and enemy
  float distD = dist(x,y,eX,eY);
  if(distC < 30){
    fX = random(#0710A1);
    fY = random(#0710A1);
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
  fill(#67E867);
ellipse(eX, eY, 70,70);
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
  fill(250);
  text("BREAK THE CYCLE", 255,200);
  text("AVOID THE ABUSER", 255, 150);
  textSize(20);
  text("INSTRUCTIONS: Use the mouse to avoid the abuser",sX,sY);
  text("(Secret Start Button Below Instructions)",mouseX,mouseY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 40){
    level = 1;
  }
       
}
   
void gameOver(){
  //gameOver screen
  textSize(30);
  textAlign(CENTER,CENTER);
  fill(250);
  text("THE CYCLE CONTINUES", 255,200);
  text("TRY AGAIN?",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 30){
    lifeValue = 40;
    level = 0;
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
  textAlign(RIGHT,BOTTOM);
  fill(0);
  text("THRESHOLD = " + lifeValue, 370,370);
  text("YOU =  " + foodValueC, 390, 390);
  text("ABUSOR = " + foodValueE, 340, 340);
