
//VARIABLES................................................................................

String gameState = "startScreen"; //make the state to be startscreen so it starts the game with that state

int framerate = 20; // variable for framerate

//PImage variables
PImage gameStart; 
PImage paused;
PImage backbtn;
int backX = 790; // backbtn X and Y posistion
int backY = 70;
PImage exitbtn;
int exitX = 60; // exitbtn X and Y position
int exitY = 70;
PImage pausebtn;
int pauseX = 790; // pause button X and Y position
int pauseY = 70;
PImage gameover;

int posX = 0;  //starting position of background Xaxis
int posY = 60; // starting position of background Yaxis
int posX2 = 1600; // starting position of background2 Xaxis
PImage [] bg; // array for background image

PImage egg;
int eggPos = 1000;

Player Runner;//stating Player class as Runner so the class Player can be called Runner instead
Bully bully;//stating Bully class as bully so the class Bully can be called bully instead

int Score = 0; //strating score

//audio import
import ddf.minim.*;
Minim minim;
AudioPlayer Jump;
AudioPlayer Slide;
AudioPlayer Start;

Collision obs;

//SETUP.................................................................................
void setup() {

  size(1000, 600);
  
 //load images
  gameStart = loadImage("TitleBully.png");
  paused = loadImage("pause.png");
  backbtn = loadImage("backbtn.png");
  exitbtn = loadImage("exitbtn.png");
  pausebtn = loadImage("pausebtn.png");
  gameover = loadImage("Gameover.png");

  minim = new Minim(this); //load the minim for the audios

  bg = new PImage[2]; // bg images
  bg[0] = loadImage ("background0.png");
  bg[1] = loadImage ("background1.png");

  Runner = new Player(); //load the runner from Player class
  Runner.loadImages(); //makes loadImages a function so it can form a void

  bully = new Bully(); //load the bully from the Bully class
  bully.loadImages(); //makes loadImages a function. (Runner.)means the loadImages()was loaded from the Runner class

  egg = loadImage("egg.png");

  obs = new Collision();
}

//DRAW..........................................................................................
void draw() {
  if (gameState == "startScreen") { //condition when the state of the game is changed to startScreen or when game is exited
    startScreen(); //opens startscreen function
    Score = 0; //makes the score 0
    posX = 0; //resets the position of the backgrounds
    posX2 = 1600;
  }
  else if (gameState == "playgame"){ //condition when the state of the game is changed to playgame or when game is played
    playGame(); //opens playGame function
  }
  else if (gameState == "pauseScreen"){ //condition when the state of the game is changed to pauseScreen or when is paused
    paused(); //opens paused function
  }
  else if (gameState == "gameOver"){
    GAMEOVER();
}
}

//START MENU...........................................................................................
void startScreen(){ //startScreen function
  gameState = "startScreen"; //makes the state of the game into startScreen
  
  image(gameStart,0,0);// load image. the start menu
  
  fill(#094CD8); //colour for the text
  textSize(25);
  text("TAP  ANYWHERE  TO  START", 300, 520); //writes text
  
  if (mousePressed && gameState == "startScreen"){ //condition. if the mouse is pressed AND the state of the game is startScreen, 
    gameState = "playgame"; // then change the state to playgame which will run the playGame function
  }
}

//PAUSED........................................................................................
void paused(){ //paused function
  gameState = "pauseScreen"; //makes the state of the game into pauseScreen which is pause
  
  image(paused,0,0); //bg for pause screen
  image(backbtn,backX,backY,140,50); //load image for back button
  image(exitbtn,exitX,exitY,140,50); //load image for exit button
  
  if (mousePressed && gameState == "pauseScreen"){ //condition. if the mouse is pressed AND the state of the game is pauseScreen
    if (mouseX >=backX && mouseX<=930 && mouseY >=backY && mouseY<= 120){ //condition inside a condition. if the mouse pointer is less than or equal to the size of the buttons basiclly
    gameState = "playgame"; //if conditions are met, then it changes the state of the game to playgame which resumes the game
  }
  }
  if (mousePressed && gameState == "pauseScreen"){ //condition. if the mouse is pressed AND the state of the game is pauseScreen
    if (mouseX >=exitX && mouseX<=200 && mouseY >=exitY && mouseY<= 120){ //condition inside a condition. if the mouse pointer is less than or equal to the size of the buttons basiclly
    gameState = "startScreen"; //if conditions are met, then it changes the state of the game to startscreen which will reset the game
  }
  }
}

//GAMEOVER.........................................................................................
void GAMEOVER(){
  gameState = "gameOver";
  
  image(gameover,0,0);
  image(exitbtn,exitX,exitY,140,50);
  
  fill(#FFC000);
  textSize(45);
  text("Score:"+Score, 387, 100);
  
  if (mousePressed && gameState == "gameOver"){
    if (mouseX >=exitX && mouseX<=200 && mouseY >=exitY && mouseY<= 120){ 
    gameState = "startScreen";
  }
  }
}

//PLAY.............................................................................................
void playGame(){  //playGame function
  gameState = "playgame"; //states that the state of the game is playgame
  background(0);
  /*Start = minim.loadFile("184149__wancle__ac-bel.wav");
   Start.play();*/ 
  frameRate(framerate); //framerate. has the variable int framrate so we can change the framrate if needed
  smooth(); //smooths the transition of animations if changing the framerate
  image(bg[0], posX, posY); // loads 1st background
  movebackground(); //calls movebackground function fro the backgroung to move
  image(bg[1], posX2, posY); //loads 2nd background
  loopbg();  //calls loopbg function to loop the background
  Keys(); //calls Keys funstion
  Runner.checkState(); //loads checkstate function from Runner(Player) and bully(Bully) classes
  bully.checkState();

  image(egg, eggPos, 280, 50, 65);
  eggPos-=10;
  
  image(pausebtn,790,70,140,50); // image for the pause button

  if (mousePressed && gameState == "playgame"){ //condition. if the mouse is pressed AND the state of the game is playgame
    if (mouseX >=backX && mouseX<=930 && mouseY >=backY && mouseY<= 120){ //condition inside a condition. if the mouse pointer is less than or equal to the size of the buttons basiclly
     gameState = "pauseScreen"; //if conditions are met then the gamestate changes to pauseScreen to pause the game
  }
  }
  
  if (keyPressed && gameState == "playgame"){
    if (key == 'g'){
      gameState = "gameOver";
    }
  }

//COLLISION...............
 

//SCORE...........................................................................................
  fill(0); // colour of the text for the score
  textSize(25);
  text("Score:"+Score, 40, 100); //loads the score on the screen

  Score++;//score keeps adding 1

  if (Score >= 50) { //if the score reaches 50 or above, it wil start adding 5 each frame so that the score looks more
    Score+=5;
  }
  /*if (Score >=1000) {
    framerate=25;
  }
   if (Score >=1500) {
    framerate=30;
  }
   if (Score >=2000) {
    framerate=40;
  }*/


//PLAYER MOVEMENT.................................................................................
  if (Runner.State == "run") { // if the runner's state is run, load the images of the runner and the bully running
    image(Runner.Runman[Runner.images], Runner.x, Runner.y, 193, 253);
    image(bully.Runman[bully.images], bully.x, bully.y, 193, 253);
  }

  if (Runner.State == "slide") { // if the runner's state is slide, load the images of the runner and the bully sliding
    image(Runner.Runman[9], 300, 360, 253, 193);
    image(bully.Runman[9], 20, 360, 253, 193);
  }

  if (Runner.State == "jump" || Runner.State == "fall") { // if the runner's state is jump and/or fall, load the images of the runner and the bully jumping/falling
    image(Runner.Runman[8], Runner.x, Runner.y, 193, 253);
    image(bully.Runman[8], bully.x, bully.y, 193, 253);
  }
}

//BG..............................................................................................
void movebackground() { // movebackground function
  if (posX <= 1600) { //if posX or posX2 is less than or equal to 1600
    posX-=2; // then the bg move left by to every frame
  }
  if (posX2 <= 1600) {
    posX2-=2;
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

//KEYS...........................................................................................
void keyReleased() { // key released function
  if (keyCode == DOWN) { //makes it so that the player and bully goes back to their original position after sliding and go back to their original state which is run
    Runner.State = "run";
    Runner.y = 270;
    bully.State = "run";
    bully.y = 270;
  }
}

void Keys() { //opens Keys function
  if (keyPressed) {
    if (keyCode == UP && Runner.State == "run") { // if the UP key is pressed and the runner state is run, the player and the bully chages their state into jump
      Runner.State = "jump";
      bully.State = "jump";
      Jump = minim.loadFile("172205__fins__jumping.wav"); //plays jump audio
      Jump.play(); 
    }
    if (keyCode == DOWN && Runner.State == "run") { // if the DOWN key is pressed and the runner state is run, the player and the bully chages their state into slide
      Runner.State = "slide";
      bully.State = "slide";
      Slide = minim.loadFile("95557__robinhood76__01662-cartoon-jump.wav");
      Slide.play(); // plays slide audio
    }
  }
}






class Bully
{ 
  float x = 10;
  float y = 270;
  String State = "run";

  
  int maxImg = 10;
  int images = 0;
  
  PImage [] Runman = new PImage[maxImg];
  
  void loadImages()
  {
    for (int i = 0; i <= 9; i++) {
      Runman[i] = loadImage("Bully" + i + ".png");
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
      if (y <= 150){
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

class Collision{
  int x = 1000;
  int y = 550;
  
}

class Player 
{ 
  float x = 300;
  float y = 270;
  
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
      if (y <= 150){
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

boolean intersect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2)
{
   if (x1+w1 > x2 && x1 < x2+w2 && y1+h1 > y2 && y1 < y2+h2)
  {
    return true;
  }
  else
  {
    return false;
  }
}


