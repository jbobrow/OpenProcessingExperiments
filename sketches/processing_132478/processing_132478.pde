
// Learning Processing
// Christiaan Endeman
// CMD_1B
// Communicatie & Multimedia Design
// HS ZUYD


//AANVULLING******************
// de aanvulling die ik verder heb gedaan is een menu scherm tussen het spelen in, als de speler af gaat of het spel op start; waar ook de behaalde score in is te zien.
// verder heb ik ook muziek toegevoegd.

PImage bg; //achtergrond image

//classes
Dino dino; //dino Class 
Timer timer; //timer Class
Meteor[] meteors; //meteor class

int allMeteor; //aantal meteors
float make; //random creator

int gameState; //0= pre game menu - 1= game - 2= game over menu

int lives; //levens
int score; //score

PFont myFont, scoreFont;//lettertype

//AUDIO PLAYER
import ddf.minim.*;
AudioPlayer player;
Minim minim; 

void setup(){
  size(400,400); 
  smooth();
  dino = new Dino(50); 
  meteors = new Meteor[1000];
  timer = new Timer(500);
  timer.start();
  
  allMeteor=0;
  gameState=0;
  
  lives = 3;
  score = 0;

//font
  myFont = loadFont ("YuppyTC.vlw");
  textFont(myFont,30);
  scoreFont = createFont("YuppyTC.vlw",20);
  
  bg = loadImage("background.jpg");
  
//audio
  minim = new Minim(this);
  player = minim.loadFile("Game_Song.mp3",2048);
  
}

void draw(){
  background(bg);
  
if (gameState == 0) { //pre game menu
    text("Press 'R'", 150, 200);
    text("To Start The Game",80, 300);
    if (keyPressed  && key == 'r') {
      gameState = 1;
      player.play();
      
    }
  }
    if (gameState == 2) { //game-over menu
    text("Final Score", 200, 100);
    text(score, 200, 200);
    text("Press 'R' To Restart", 200, 300);
    
    if (keyPressed && key == 'r') {
      gameState = 1;
      setup();
    }
  }
  if (gameState == 1) { 
   if (lives <= 0) {
     player.close();
      gameState = 2;
    }
    
  showScore();

  dino.setLocation(mouseX,270); //location character dino

  dino.display();   // Display character dino 
  
  make = random(0,100); 
  
  if (timer.isFinished()) { 
    score = score + 10; //score bijhouden
    meteors[allMeteor] = new Meteor();
    allMeteor ++ ;
    if (allMeteor >= meteors.length) {
      allMeteor = 0; 
    }
    timer.start();
    
  }
  
  // move all meteors and display them
  for (int i = 0; i < allMeteor; i++ ) {
    meteors[i].move();
    meteors[i].display();
    if (dino.intersect(meteors[i])) {
      meteors[i].caught();
    }
  }
}
}

//tekst score bijhouden
  void showScore(){
    textFont(scoreFont);
    textAlign(CENTER);
   text("Lives:" + lives, width-100,25);
   text("Score:" + score,width-350,25);
  }
  
//stop audio
 void stop(){
   player.close();
   minim.stop();
   super.stop();
 }

// Learning Processing
// Christiaan Endeman
// CMD_1B
// Communicatie & Multimedia Design
// HS ZUYD

PImage character;

class Dino {
  float r;   // radius
  float x,y; // location
  
  Dino(float tempR) {
    r = tempR;
    x = 0;
    y = 0;
    character = loadImage("Character.png");
  }
  
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    image(character,x,y);
  }
  
 //check for intersection
  boolean intersect(Meteor d) {
    // Calculate distance
    float distance = dist(x,y,d.x,d.y); 
    
//afstand meten 
    if (distance < r + d.r) { 
      return true;
    } else {
      return false;
    }
  }
}


PImage meteor;


class Meteor{
float x,y;   // locatie variable meteor
float speed; // snelheid van meteor
color c;
// Learning Processing
// Christiaan Endeman
// CMD_1B
// Communicatie & Multimedia Design
// HS ZUYD

float r;     //radius van meteor
float bad;


 Meteor() {

    x = random(10,390);     // willekeurige locatie X as
    y = -10;              // iets boven het scherm beginnen
    speed = 5;   // speed kiezen

   
     meteor = loadImage("meteor.png");

  }

// Move the meteor down
  void move() {
// snelheid versnellen
    y += speed; 
  }

// kijken of het grond aanraakt
  boolean reachedBottom() {
// beyond bottom
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }


  // meteor display
  void display() {
     if  (bad<=0.9){
      image(meteor,x,y);

     }
  }

//als de meteor is gevangen:
  void caught() {
    // stop, en zet snelheid op 0
    speed = 0; 
    //locatie off-screen ergens
    y = - 1000;
    lives = lives -1;
  }
}
// Learning Processing
// Christiaan Endeman
// CMD_1B
// Communicatie & Multimedia Design
// HS ZUYD

class Timer {
 
  int savedTime; // Wanneer timer begint
  int totalTime; // hoelang timer loopt
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // timer beginnen
  void start() {
    // sla tijd op in milliseconden.
    savedTime = millis(); 
  }
  
  // isfinished() is true als de timer voltooid is
  boolean isFinished() { 
    
    // kijken hoeveel tijd is gepasseerd
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}


