
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
 int lifeValue = 50;
 int foodValueC = 0;
 int foodValueE = 0;
//easing for enemy
 float easing = .015;
//speed of character
 float speed = 6;
//level
 int level = 0;

void setup(){
  size(500,500);
  //create font
  textFont(createFont("Langdon", 50));
  //outline
  noStroke();
  //strokeWeight(2);
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
   fill(120,180,159);
   ellipse(fX,fY,30,30);
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
  fill(155,200,215);
  ellipse(x,y,30,30);
    if(x>=500){
    x = 500;
  }
  if(x<=0){
    x=0;
  }
  if (y<=0){
    y=0;
  }
  if (y>=500){
    y=500;
  }
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
  fill(230,200,110);
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
  fill(0);
  text("SURVIVAL OF THE FITTEST", 255,200);
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
  fill(0);
  text("LIFE = " + lifeValue, 20,30);
  text("YOU =  " + foodValueC, 20, 60);
  text("ENEMY = " + foodValueE, 20, 90);
}
  
  

    
 
  



