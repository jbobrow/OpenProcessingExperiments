
PImage imgb;
PImage o;
PImage t;
PImage r;
PImage d;
PImage w;
PShape c;
PShape e;
PShape f;
 
 
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
 int lifeValue = 100;
 int foodValueC = 0;
 int foodValueE = 0;
//easing for enemy
 float easing = .015;
//speed of character
 float speed = 8;
//level
 int level = 0;
  
void setup(){
  size(500,500);
  o = loadImage("hasbkgd.png");
  t = loadImage("hasbkgd2.png");
  r = loadImage("hasbkgd3.png");
  d = loadImage("city.png");
  w = loadImage("winner.png");
  c = loadShape("csnake.svg");
  e = loadShape("eman.svg");
  f = loadShape("fapple.svg");
  //create font
  textFont(createFont("TimesNewRoman", 50));
  //outline
  imgb =loadImage("hasbkgd.png");
  noStroke();
  //strokeWeight(2);
  //milliseconds since start
  savedTime = millis();
}
  
void draw(){
  background(#003300);
  smooth();
  image(imgb,0,0);
  levelUp();
   
   
    
}
void bGround(){
  for(int i = 0; i < width; i += 25){
    for(int j = 0; j < height; j += 25){
      fill(#E1F4F5);
      ellipse(i,j,25,25);
    }
  }
}
 
  
void food(){
  //respawn
 int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    fX = random(500);
    fY = random(500);
    savedTime = millis();
  }
   fill(#FFFFFF);
   shape(f,fX,fY,30,30);
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
  shape(c,x,y,80,80);
}
  
void eat(){
  //distance between character and food
  float distC = dist(x,y,fX,fY);
  //distance between enemy and food
  float distE = dist(eX,eY,fX,fY);
  //distance between character and enemy
  float distD = dist(x,y,eX,eY);
  if(distC < 30){
    fX = random(0);
    fY = random(0);
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
  fill(#FF0000);
  shape(e, eX, eY, 80, 80);
}
    
  
void level1(){
  //level 1
  image(o,0,0,500,500);
  food();
  character();
  eat();
  enemy();
  gui();
  if(foodValueC == 5){
    level = 2;
  }
    
}
void level2(){
  //level 2
  image(t,0,0,500,500);
  food();
  character();
  eat();
  enemy();
  gui();
  if(foodValueC == 15){
    level = 3;
  }
}
void level3(){
  //level 3
  image(r,0,0,500,500);
  food();
  character();
  eat();
  enemy();
  gui();
  if(foodValueC == 30){
    level = 4;
  }
}

    
  
void startMenu(){
  //startMenu
  textSize(20);
  textAlign(CENTER,CENTER);
  fill(0);
  text("Instructions: \nAs you head deeper within the forest... \n1.Preserve nature by starving Man (get 30pts). \n2.Use the snake's tail to catch apples. \n3.Avoid MAN at all costs.", 255,200);
  text("CLICK 'MAN' BEGIN", width/2-10, height/2+80);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 30){
    level = 1;
  }
      
}
  
void gameOver(){
  //gameOver screen
  textSize(30);
  textAlign(CENTER,CENTER);
  background(d);
  fill(#FFFFFF);
  text("Industrialization Prevails", 255,200);
  text("CLICK TO TRY AGAIN",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 30){
    lifeValue = 100;
    level = 1;
  }
}
void winnerMenu(){
  //winnerMenu screen
  textSize(30);
  textAlign(CENTER,CENTER);
  background(w);
  fill(#000000);
  text("We Thank You!!!", 255,200);
  text("CLICK TO REPLAY",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 30){
    lifeValue = 100;
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
  if(level == 2){
    level2();
  }
  if(level == 3){
    level3();
  }
  if(level == -1){
    gameOver();
  }
  if(level == 4){
    winnerMenu();
}
}
  
void gui(){
  //in game info
  textSize(20);
  textAlign(LEFT,TOP);
  fill(0);
  text("ENERGY = " + lifeValue, 20,30);
  text("YOU =  " + foodValueC, 20, 60);
  text("MAN = " + foodValueE, 20, 90);
}



