
/*Pan/Nic (working title) 2013. Alvaro Salvagno.
1 Player. 

Objective  : Player must survive or destroy the ennemy depending on the
level. As he does this, he acquires the ennemy's abilities and he can use 
them on the next level. 

Rules  : Player has 3 lives and habilities from past ennemy. 
The setting is always the same. Based on Mario Bros (NES). 
Always PvE.

Levels : 

1. Player : Player can only move from left to right.

Ennemy : Ennemy can move and jump. 

  
  
2.

Player : 

Ennemy */
Player myPlayer;
Enemy myEnemy;


void setup(){
boolean lost = false;
noSmooth();
size(600,600);
frameRate(60);
background(255);
myPlayer = new Player(300,570);
myEnemy = new Enemy(100,100,20,20);
}

//uncomment in DrawGame
void DrawLevel(){
fill(0);
rect(0,170,220,10);
rect(600,170,-220,10);
rect(150,290,300,10);
rect(0,410,220,10);
rect(600,410,-220,10);
rect(0,590,600,10);
}


//Creating the game
void DrawGame(){
//DrawLevel();
}



void draw(){
background(255);
DrawGame();
myEnemy.run();
myPlayer.run();}

//Classes

//The Player and the enemy are a class

class Player {
  //GLOBAL VARIABLES
  float posX = 0;
  float posY = 0;
  float wX = 20;
  float hX = 20;


  //CONSTRUCTOR
  Player(float _posX, float _posY) {
    posX = _posX;
    posY = _posY;
  }

  //FUNCTIONS
  void run() {
    display();
//    vibration();
    System();
    pMovement();
  }

  void display() {
    noStroke();
    fill(0);
    rect(posX, posY, wX, hX);
  }

//Ugghh...
void vibration(){
  if(!keyPressed){
  posY = posY + random(-1,1);
}}


void pMovement(){
   if(keyPressed && keyCode == LEFT){
      posX = (constrain(posX-5, 0, 600));}
   if(keyPressed && keyCode == RIGHT){
      posX = (constrain(posX+5, 0, 580));}
   
}



  void System() {
    boolean collision = rectangle_collision(posX, posY, wX, hX, posEx, posEy, wEx, hEy);
    if (collision) {
      posX +=random(-3, 3);
      fill(255, 0, 0, 125);
      rect(0, 0, 1000, 1000);
      fill(255);
      stroke(255);
      text("YOU LOST", width/2, height/2, 9000, 9000);
      ;
    }
  }  
  boolean rectangle_collision(float posX, float posY, float wX, float hX, float posEx, float posEy, float wEx, float hEy)
  {
    return !(posX > posEx+wX || posX+wX < posEx || posY > posEy+hEy || posY+hX < hEy);
  }
}

//Enemy
float posEx = 0;
float posEy = 150;
float wEx = 20;
float hEy = 20;

class Enemy {
  // Constructor
  Enemy(float _posEx, float _posEy, float _wEx, float _hEy) {
    posEx = _posEx;
    posEy = _posEy;
    wEx = _wEx;
    hEy = _hEy;
  }  

  float enSpeed = 0.3;
  float gravity = -3;

  void run() {
    display();
    movement();
    gravity();
    ;
  }


  void display() {
    fill(255, 20, 20);
    rect(posEx, posEy, 20, 20);
  }

  void movement() {
    posEx = posEx + enSpeed;
  }

  void gravity() {
    posEy -=gravity;
    if (posEx==600) {
      enSpeed *=-1;
    }
    else if (posEx==0) {
      enSpeed *=-1;
    }
  }
}
