
//character x and y
 float pX = 255;
 float pY = 255;
//enemy x and y
 float eX = 20;
 float eY = 20;
//secret
 float sX = 260;
 float sY = 260;
//counters
 int lifeValue = 50;
 int enemyLife = 1050;
//easing for enemy
 float easing = .030;
//speed of character
 float speed = 6;
//level
 int level = 0; 
 PImage Snowden;
 PImage Thingy;
 PImage Floor;
 PImage Map;
 
 
void setup(){
  size(500,500);

  noStroke();
  Thingy = loadImage("F1F25EF6.jpg");
    Snowden = loadImage ("66DAC403.jpg");
  Floor = loadImage ("map2.gif");

}
  
void draw(){
  smooth();
  image(Thingy, 45,45);
  image(Snowden, pX,pY);
  image(Floor, 250,250);
  background(255, 50, 100);
    image(Floor, 0, 0, 500, 500);
  levelUp();
   
    
}
  
void character(){
  pX = mouseX;
  pY = mouseY;
  image (Snowden, pX,pY,30,30);

}
  
void enemy() {
  float targetX = pX;
  float targetY = pY;
  eX += (targetX - eX) * easing;
  eY += (targetY - eY) * easing;
  
  image(Thingy, eX, eY, 80, 80);
 
 
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
  text("SAVE SNOWDEN", 255,200);
  text("AVOID THE NSA TRACKER", 255, 150);
  textSize(12);
  text("INSTRUCTIONS: Use the mouse to avoid the tracker",sX,sY);
  text("(Secret Start Button Below Instructions)",mouseX,mouseY);
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
  text("HAVE FUN IN PRISON", 255,200);
  text("TRY AGAIN?",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 30){
    lifeValue = 50;
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
  //WIN THE GAME
if(enemyLife == 10){
  win();
  }
}
  
void gui(){
  //in game info
  textSize(20);
  textAlign(LEFT,TOP);
  fill(255);
  text("FIREWALL = " + lifeValue, 20,30);
  text("NSA POWER = " + enemyLife, 20, 70);
}

void win(){
  //winning screen
  textSize(30);
  textAlign(CENTER,CENTER);
  fill(250);
  text("You were granted Asylum", 255,200);
  text("Would you do it again?",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 30){
    lifeValue = 50;
    level = 1;
  }
}


