
PImage img1;

//timer for "food"
 int savedTime;
 int timer1 = 3000;
//character x and y
 float x = 255;
 float y = 255;
//food x and y
 float fX = 10;
 float fY = 10;
//enemy x and y
 float eX = 10;
 float eY = 10;
//press start x and y
 float sX = 255;
 float sY = 255;
//counters for GUI
 int lifeValue = 40;
 int foodValueC = 0;
 int foodValueE = 0;
//easing for enemy
 float easing = .015;
//speed of character
 float speed = 5;
//level
 int level = 0;
   
void setup(){
  size(700,700);
  //create font
  textFont(createFont("Times New Roman", 70));
  //outline
  img1 = loadImage("fantasy.png");
  noStroke();
  //strokeWeight(2);
  //milliseconds since start
  savedTime = millis();
}
   
void draw(){
  smooth();
  background(#F3D7F5);
  image(img1,0,0);
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
   fill(#E8B8F0);
   rect(fX,fY,30,30);
}
   
   
   
void character(){
  //character movement
   if(keyPressed){
    if(key == 'w'){
      y -= speed;
    }
    if(key == 's'){
      y += speed;
    }
    if(key == 'a'){
      x -= speed;
    }
    if(key == 'd'){
      x += speed;
    }
  }
  fill(255,255,255);
  ellipse(x,y,30,30);
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
  fill(#DAE2E3);
  ellipse(eX, eY, 30, 30);
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
  fill(#C111F7);
  text("Garden Runners",260,200);
  text("Press Start to Play",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 30){
    level = 1;
  }
       
}
   
void gameOver(){
  //gameOver screen
  textSize(30);
  textAlign(CENTER,CENTER);
  fill(#C111F7);
  text("Game Over", 255,200);
  text("Play Again?",sX,sY);
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
  fill(#FF4B8A);
  text("Total Health: " + lifeValue, 20,30);
  text("Your Score:  " + foodValueC, 20, 60);
  text("Enemy Score: " + foodValueE, 20, 90);
}



