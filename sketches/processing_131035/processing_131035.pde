


String gameState = "gameStart"; //make the state to be startscreen so it starts the game with that state

int framerate = 20;

PImage startScreen; 
PImage pauseScreen;
PImage backbtn;
int backX = 790; // backbtn X and Y posistion
int backY = 70;
PImage exitbtn;
int exitX = 60; // exitbtn X and Y position
int exitY = 70;
PImage pausebtn;
int pauseX = 790; // pause button X and Y position
int pauseY = 70;
PImage gameoverScreen;

int posX = 0;  //starting position of background Xaxis
int posY = 60; // starting position of background Yaxis
int posX2 = 1600; // starting position of background2 Xaxis
PImage [] bg; // array for background image

Player Runner;//stating Player class as Runner so the class Player can be called Runner instead
Bully schoolbully;//stating Bully class as bully so the class Bully can be called bully instead

int Score = 0; //starting score

boolean overBox = false;
boolean locked = false;
float x = 200;
float y = 70;
int w = 260;
float xOffset = 0.0; 
float yOffset = 0.0; 

void setup() {
  size(1000, 600);
  x = width/2.0;
  y = height/2.0;
  rectMode(RADIUS);  
  
  startScreen = loadImage("TitleBully.png");
  pauseScreen = loadImage("pause.png");
  backbtn = loadImage("backbtn.png");
  exitbtn = loadImage("exitbtn.png");
  pausebtn = loadImage("pausebtn.png");
  gameoverScreen = loadImage("Gameover.png");
  
  bg = new PImage[2]; // bg images
  bg[0] = loadImage ("background0.png");
  bg[1] = loadImage ("background1.png");
  
  Runner = new Player(); //load the runner from Player class
  Runner.loadImages(); //makes loadImages a function so it can form a void
  
  schoolbully = new Bully(); //load the bully from the Bully class
  schoolbully.loadbullyImages(); //makes loadImages a function. (Runner.)means the loadImages()was loaded from the Runner class
}

void draw(){
  if (gameState == "gameStart") { //condition when the state of the game is changed to startScreen or when game is exited
    Start(); //opens startscreen function
    Score = 0; //makes the score 0
    posX = 0; //resets the position of the backgrounds
    posX2 = 1600;
  }
  else if (gameState == "gamePlay") { //condition when the state of the game is changed to playgame or when game is played
    PlayGame(); //opens playGame function
  }
  else if (gameState == "gamePause") { //condition when the state of the game is changed to pauseScreen or when is paused
    Pause(); //opens paused function
  }
  else if (gameState == "gameOver") {
    Over();
  }
}

void Start() { //startScreen function
  gameState = "gameStart"; //makes the state of the game into startScreen
  
  image(startScreen, 0, 0);// load image. the start menu

  fill(#094CD8); //colour for the text
  textSize(25);
  text("TAP  ANYWHERE  TO  START", 300, 520); //writes text

  if (mousePressed && gameState == "gameStart") { //condition. if the mouse is pressed AND the state of the game is startScreen, 
    gameState = "gamePlay"; // then change the state to playgame which will run the playGame function
  }
}

void Pause() { //paused function
  gameState = "gamePause"; //makes the state of the game into pauseScreen which is pause
  
  image(pauseScreen, 0, 0); //bg for pause screen
  image(backbtn, backX, backY, 140, 50); //load image for back button
  image(exitbtn, exitX, exitY, 140, 50); //load image for exit button

  if (mousePressed && gameState == "gamePause") { //condition. if the mouse is pressed AND the state of the game is pauseScreen
    if (mouseX >=backX && mouseX<=930 && mouseY >=backY && mouseY<= 120) { //condition inside a condition. if the mouse pointer is less than or equal to the size of the buttons basiclly
      gameState = "gamePlay"; //if conditions are met, then it changes the state of the game to playgame which resumes the game
    }
  }
  if (mousePressed && gameState == "gamePause") { //condition. if the mouse is pressed AND the state of the game is pauseScreen
    if (mouseX >=exitX && mouseX<=200 && mouseY >=exitY && mouseY<= 120) { //condition inside a condition. if the mouse pointer is less than or equal to the size of the buttons basiclly
      gameState = "gameStart"; //if conditions are met, then it changes the state of the game to startscreen which will reset the game
    }
  }
}

void Over() {
  gameState = "gameOver";
  
  image(gameoverScreen, 0, 0);
  image(exitbtn, exitX, exitY, 140, 50);

  fill(#FFC000);
  textSize(45);
  text("Score:"+Score, 387, 100);

  if (mousePressed && gameState == "gameOver") {
    if (mouseX >=exitX && mouseX<=200 && mouseY >=exitY && mouseY<= 120) { 
      gameState = "gameStart";
    }
  }
}

void PlayGame() {  //playGame function
  gameState = "gamePlay"; //states that the state of the game is playgame
  background(0);
  
  if (mouseX > x-w && mouseX < x+w && 
      mouseY > y-w && mouseY < y+w) {
    overBox = true;  
    if(!locked) { 
      fill(153,0);
    } else {
    stroke(153);
    fill(153,0);
    overBox = false;
  }
  fill(255,0);
  noStroke();
  rect(x, y, w, w);
      }
      
  if (y<=65 && Runner.State == "run"){
    Runner.State = "jump";
    schoolbully.BState = "Brun";
    
  }
  if (y>=300 && Runner.State == "run"){
    Runner.State = "slide";
     schoolbully.BState = "Brun";
  }
  
  frameRate(framerate);
  smooth();
  image(bg[0], posX, posY); // loads 1st background
  movebackground(); //calls movebackground function fro the backgroung to move
  image(bg[1], posX2, posY); //loads 2nd background
  loopbg();
  Runner.checkState(); //loads checkstate function from Runner(Player) and bully(Bully) classes
  schoolbully.BcheckState();
  
  image(pausebtn, 790, 70, 140, 50); // image for the pause button
  
  if (mousePressed && gameState == "gamePlay") { //condition. if the mouse is pressed AND the state of the game is playgame
    if (mouseX >=backX && mouseX<=930 && mouseY >=backY && mouseY<= 120) { //condition inside a condition. if the mouse pointer is less than or equal to the size of the buttons basiclly
      gameState = "gamePause"; //if conditions are met then the gamestate changes to pauseScreen to pause the game
    }
  }

  if (mousePressed && gameState == "gamePlay") {
    if (mouseX >=950 && mouseX<=1000 && mouseY >=550 && mouseY<= 600) {
      gameState = "gameOver";
    }
  }
  
  
  
  fill(0); // colour of the text for the score
  textSize(25);
  text("Score:"+Score, 40, 100); //loads the score on the screen
  
  Score++;//score keeps adding 1
  
  if (Score >= 50) { //if the score reaches 50 or above, it wil start adding 5 each frame so that the score looks more
    Score+=5;
  }
  
  
  if (Runner.State == "run") { // if the runner's state is run, load the images of the runner and the bully running
    image(Runner.Runman[Runner.images], Runner.x, Runner.y, Runner.w, Runner.h);
    image(schoolbully.hschbully[schoolbully.Bimages], schoolbully.Bx, schoolbully.By, 193, 253);
  }

  if (Runner.State == "slide") { // if the runner's state is slide, load the images of the runner and the bully sliding
    image(Runner.Runman[9], 300, 360, 253, 193);
    image(schoolbully.hschbully[schoolbully.Bimages], schoolbully.Bx, schoolbully.By, 193, 253);
  }

  if (Runner.State == "jump" || Runner.State == "fall") { // if the runner's state is jump and/or fall, load the images of the runner and the bully jumping/falling
    image(Runner.Runman[8], Runner.x, Runner.y, Runner.w, Runner.h);
    image(schoolbully.hschbully[schoolbully.Bimages], schoolbully.Bx, schoolbully.By, 193, 253);
  }
}


void movebackground() { // movebackground function
  if (posX <= 1600) { //if posX or posX2 is less than or equal to 1600
    posX-=10; // then the bg move left by to every frame
  }
  if (posX2 <= 1600) {
    posX2-=10;
  }
}

void loopbg() { //if the posX2/bg2 reaches -600 posX/bg1 loads at 1000 in the X axis 
  if (posX2 == -600) {
    posX = 1000;
  }
  if (posX == -600) { //if the posX/bg1 reaches -600 posX2/bg2 loads at 1000 in the X axis 
    posX2 = 1000;
  }
}

void mouseReleased() { // key released function
    locked = false;
 
    Runner.State = "run";
    Runner.y = 270;
    schoolbully.BState = "Brun";
    schoolbully.By = 270;
    x = 200;
    y = 70;
    w = 260;
  }


void mousePressed(){
  if(overBox) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-x; 
  yOffset = mouseY-y; 
}

void mouseDragged() {
  if (locked){
    x = mouseX-xOffset; 
    y = mouseY-yOffset; 
  }
}
    /*if (mouseX <= 790 && mouseX>=200 && mouseY<=height/2 && Runner.State == "run") { // if the UP key is pressed and the runner state is run, the player and the bully chages their state into jump
      Runner.State = "jump";
      schoolbully.BState = "Bjump";
    }
    }
    
void keyPressed(){    
    if (keyCode == DOWN && Runner.State == "run") { // if the DOWN key is pressed and the runner state is run, the player and the bully chages their state into slide
      Runner.State = "slide";
      schoolbully.BState = "Bslide";
    }
  }*/



class Bully
{ 
  float Bx = 10;
  float By = 270;
  String BState = "Brun";

  
  int BmaxImg = 10;
  int Bimages = 0;
  
  PImage [] hschbully = new PImage[BmaxImg];
  
  void loadbullyImages()
  {
    for (int j = 0; j <= 9; j++) {
      hschbully[j] = loadImage("Bully" + j + ".png");
    } 
  }
  
  void BRunning()
  {
    if (Bimages < 7){
      Bimages++;
    }
    if (Bimages == 7){
      Bimages = 0;
      By = 270;
  }
  }
  
  void Bjumping(){
    if (BState == "Bjump"){
      By-=15;
      if (By <= 100){
        BState = "Bfall";
      }
    }
  }
  
  void Bfalling(){
    if (BState == "Bfall"){
      By +=10;
      if (By == 270){
        BState = "Brun";
        
      }
    }
  }
      
  
  void BcheckState()
  {
    if (BState == "Brun"){
      BRunning();
    }
    if (BState == "Bjump"){
      Bjumping();
    }
       else if (BState == "Bfall"){
          Bfalling();
       }
  }
}

class Player 
{ 
  float x = 300;
  float y = 270;
  float w = 193;
  float h = 253;
  
  String State = "run";

  
  int maxImg = 10;
  int images = 0;
  
  PImage [] Runman = new PImage[maxImg];
  
  void loadImages()
  {
    for (int i = 0; i <= 9; i++) {
      Runman[i] = loadImage("Player" + i + ".png");
    } 
  }
  
  void Running()
  {
    if (images < 7){
      images++;
    }
    if (images == 7){
      images = 0;
      y = 270;
  }
  }
  
  void jumping(){
    if (State == "jump"){
      y-=20;
      if (y <= 100){
        State = "fall";
      }
    }
  }
  
  void falling(){
    if (State == "fall"){
      y +=20;
      if (y == 270){
        State = "run";
        
      }
    }
  }
      
  
  void checkState()
  {
    if (State == "run"){
      Running();
    }
    if (State == "jump"){
      jumping();
    }
       else if (State == "fall"){
          falling();
       }
  }
}



