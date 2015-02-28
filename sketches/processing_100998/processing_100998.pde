

//startM
float sX = 400;
float sY = 550;
PImage neko;
//player
float pX;
float pY;
//GUI
int lifeValue = 50;
//easing for cats
float easing = .05;
//cat x and y
float cX = 10;
float cY = 10;
PImage cha;
PImage GO;

//timer WIP-----------------------------------


int level = 0;


void setup() {
  size(800, 600);
  frameRate(60);
  textFont(createFont("Langdon", 50));
  noStroke();
  neko = loadImage("neko.jpg");
  cha = loadImage("cha.jpg");
  GO = loadImage("GO.gif");
  
}



void draw() {
  smooth();
  background(255);
  levelUp();
}



void level1() {
  //level 1
  player();
  gui();
  cat();
  Chasing();
}



void startMenu() {
  //startMenu
  image(neko, cX, cY, 800, 600);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(45);
  text("PRESS START", sX, sY);
  float pStart = dist(mouseX, mouseY, sX, sY);
  if (mousePressed && pStart <= 30) {
    level = 1;
  }
}


void player() {
  pX = mouseX;
  pY = mouseY;
  fill(#FF0808);
  ellipse(pX, pY, 10, 10);
}



void levelUp() {
  //checking for level
  if (level == 0) {
    startMenu();
  }
  if (level == 1) {
    level1();
  }
    if(level == -1){
    gameOver();
  }
}



void gui() {
  //in game info
  textSize(20);
  textAlign(LEFT, TOP);
  fill(0);
  text("LIFE = " + lifeValue, 20, 30);
}




void cat() {
  //movement and creation of enemy characters
  float targetX = pX;
  float targetY = pY;
  cX += (targetX - cX) * easing;
  cY += (targetY - cY) * easing;
  image(cha, cX, cY, 40, 40);
}

void Chasing(){
  //distance between player and cats
    float distC = dist(pX,pY,cX,cY);
    if(distC < 30){
      lifeValue -= 1;
    }
      if(lifeValue <= 0){
    level = -1;
      }
}

void gameOver(){
  //gameOver screen
  image(GO,300, 300, 200, 200);
  textSize(20);
  textAlign(CENTER,CENTER);
  fill(0);
  text("GAME OVER", 400,200);
  textSize(30);
  text("PRESS START",sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 30){
    lifeValue = 50;
    level = 1;
  }
}




