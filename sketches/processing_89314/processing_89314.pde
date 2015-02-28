
// Samantha Ticknor
// id: sticknor
// copyright 2013
// Dino Dash

float dinox, dinoy;

int level, nextLevel, time, lives, hitTime;

ArrayList comets;

boolean splashScreen, instructions, gameOver, dinoHit;
      
PImage gameScreen, dinoGood, dinoBad, titleScreen, instructionPage, 
       comet1, comet2, comet3, comet4, gameOverS;

class Comet {
  PImage name;
  float x;
  float y;
  boolean cometLeft;
  boolean cometUp;
}
        
//array comets; //[x, y, cometLeft, cometUp]

void setup()
{
  size(400, 400);
  noCursor();
  
  gameScreen = loadImage("gameScreen.png");
  dinoGood = loadImage("Trex.png");
  dinoGood.resize(0,55);
  dinoBad = loadImage("Trex2.png");
  dinoBad.resize(0, 55);
  instructionPage = loadImage("instructions.png");
  titleScreen = loadImage("splash.png");
  gameOverS = loadImage("gameOver.png");
  
  comet1 = loadImage("comet1.png");
  comet1.resize(0, 30);
  comet2 = loadImage("comet2.png");
  comet2.resize(0, 30);
  comet3 = loadImage("comet3.png");
  comet3.resize(0, 30);
  comet4 = loadImage("comet4.png");
  comet4.resize(0, 30);
  
  splashScreen = true;
  instructions = false;
  gameOver = false;
  
  lives = 5;
  level = 1;
  nextLevel = 500;
  time = 0;
  
  dinox = 185;
  dinoy = 200;
  dinoHit = false;
  
  comets = new ArrayList();
    Comet newCom = new Comet();
    newCom.name = comet3;
    newCom.x = random(25, 45);
    newCom.y = random(50, 70);
    newCom.cometLeft = false;
    newCom.cometUp = false;
  comets.add(newCom);
}


void draw()
{
  if (splashScreen == true){
    splash();}
  else if (instructions == true){
    instruct();}
  else if (lives == 0){
    gameOver = true;
    gameOver();}
  else {
    runGame();}
}
    
    
void splash(){
 image(titleScreen, 0, 0);
}

    
void instruct(){
  image(instructionPage, 0, 0);
}
    
void gameOver(){
  image(gameOverS, 0, 0);
}

void runGame(){
 time = time+1;
 if (time == nextLevel){
   levelUp();
 }
 if (dinoHit == true && time-hitTime > 30){
   dinoHit = false;}
 image(gameScreen, 0, 0, width, height); 
 textSize(20);
 fill(22, 68, 80);
 text(""+lives, 105, 28);
 text(""+level, 240, 28);
 text(""+(time/100), 360, 28);
 placeDino();
 moveComets();
 drawComets();
 checkForDetection();
}

void checkForDetection(){
  for (int i = 0; i < level; i = i+1){
    Comet ithComet = (Comet) comets.get(i);
    if (ithComet.x >= dinox-10 && ithComet.x <= dinox+35 &&
        ithComet.y >= dinoy && ithComet.y <=dinoy+45 &&
        dinoHit == false){
       lives += -1;
       dinoHit = true;
       hitTime = time;}   
  }
}

void levelUp(){
  nextLevel = nextLevel + 500;
  Comet newCom = new Comet();
    newCom.name = comet3;
    newCom.x = random(25, 45);
    newCom.y = random(50, 70);
    newCom.cometLeft = false;
    newCom.cometUp = false;
  comets.add(newCom);
  level = level+1;
}
  

void placeDino(){
  if (mouseX < 345 && mouseX > 35){
    dinox = mouseX;}
  else if (mouseX >= 345){
    dinox = 345;}
  else {dinox = 35;}
  if (mouseY < 310 && mouseY > 60){
    dinoy = mouseY;}
  else if (mouseY >= 310){
    dinoy = 310;}
  else {dinoy = 60;}   
  drawDino(dinox, dinoy);
}

void drawDino(float x, float y){
  if (dinoHit == false){
    image(dinoGood, x, y);}
  else {image(dinoBad, x, y);}
}

void moveComets(){
  for (int i = 0; i < level; i = i+1){
    Comet ithComet = (Comet) comets.get(i);
    if (ithComet.cometLeft == true && ithComet.x <= 20){
       ithComet.cometLeft = false;}
    else if (ithComet.cometLeft == false && ithComet.x >= 350){
       ithComet.cometLeft = true;}
    if (ithComet.cometUp == true && ithComet.y <= 50){
       ithComet.cometUp = false;}
    else if (ithComet.cometUp == false && ithComet.y >= 345){
       ithComet.cometUp = true;}
    if (ithComet.cometLeft == true && ithComet.cometUp == true){
       ithComet.name = comet1;
       ithComet.x += -level;
       ithComet.y += -level;       
    }
    else if (ithComet.cometLeft == true && ithComet.cometUp == false){
       ithComet.name = comet2;
       ithComet.x += -level;
       ithComet.y += level;       
    }
    else if (ithComet.cometLeft == false && ithComet.cometUp == true){
       ithComet.name = comet4;
       ithComet.x += level;
       ithComet.y += -level;       
    }
    else if (ithComet.cometLeft == false && ithComet.cometUp == false){
       ithComet.name = comet3;
       ithComet.x += level;
       ithComet.y += level;       
    }
  }  
}

void drawComets(){
  for(int i = 0; i < level; i = i+1){
   Comet ithComet = (Comet) comets.get(i);
   image(ithComet.name, ithComet.x, ithComet.y);
  }
} 

void keyPressed(){
  if (splashScreen == true){
    splashScreen = false;
    instructions = true;}
  else if (instructions == true){
    instructions = false;}
}

