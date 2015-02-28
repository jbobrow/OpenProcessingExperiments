
PImage bg; //start and end image
PImage hammer; //cursor image
PImage hammerdown;
PImage landscape; //background image
PImage mcUp; //mc hammer
PImage mcDown; //whacked
PImage mcHammer;
import ddf.minim.*; //mc hammer - "u can't touch this" music

Minim minim;
AudioPlayer song;

PFont font; //font
PFont plain; //plain font
PFont small; //small font

int startTime;
int interval;
int currentTime;

//timer
int startTimer;
int currentTimer;
int limitTimer;

int currentX; //current ball position x
int currentY; //current ball position y


int gameState; //defines the state of the game
/*Start: gameState = 0;
 Game: gameState = 1;
 Win Screen: gameState = 2;
 Game Over: gameState = 3;*/

//whacking points
int whackPoints;


//ball positions
float[] xPoses = {
  63, 188, 313, 437
}; //ball positions x
float[] yPoses = {
  170, 295, 419
}; //ball positions y

//whack action
boolean isWhacked;

void setup() {
  smooth();
  size(500, 500);
  hammer = loadImage("hammer.png");
  hammerdown = loadImage("hammerdown.png");
  landscape = loadImage("landscape.jpg");
  bg = loadImage("bg.jpg");
  mcUp = loadImage("mcUp.png");
  mcDown = loadImage("mcDown.png");
  font = loadFont("font.vlw");
  plain = loadFont("plain.vlw");
  small = loadFont("small.vlw");
  minim = new Minim(this);
  song = minim.loadFile ("canttouch.mp3");
  song.play();
  isWhacked = false;
  gameState = 0;
  limitTimer = 11000; //duration of each game
  whackPoints = 0;

  interval = 750; //time that balls last

  textAlign(CENTER);
  imageMode(CENTER);
}


void draw() {
  if (gameState == 0) { //game start screen
    background(bg);
    fill(random(255),random(255),random(255));
    textFont(font);
    text("Hammer Time!", width/2, 250);
    fill(255);
    text("Hammer Time!", width/2-2, 248);
    textFont(plain);
    text("to start", width/2, 350);
    text("press 'spacebar'", width/2, 375);
    image(hammer, 390, 330);
    text("Hammer ('click') MC Hammer", width/2, 50);
    text("you have 10 seconds!", width/2, 65);
    textFont(small);
    text("100 points to win", width/2, 75);
  }
  
    if (gameState == 2) { //win screen
      background(bg);
      textFont(font);
      textAlign(CENTER);
      fill(random(255), random(255), random(255));
      text("You Win!", width/2, 300);
      textFont(plain);
      fill(255);
      text("Your Score: "+ whackPoints + " Points", width/2, 350);
      textFont(small);
      text("Copyright Disclaimer: I Do Not Own The Contents Of This Song Or Claim Ownership", width/2, 50);
      text("All Rights Reserved to MC Hammer", width/2, 60);

    }
    if (gameState == 3) { //game over screen
      background(bg);
      textFont(font);
      fill(random(255), random(255), random(255));
      textAlign(CENTER);
      text("U Can't Touch This!", width/2, 200);
      text("U Can't Touch This!", width/2, 225);
      text("U Can't Touch This!", width/2, 250);
      text("U Can't Touch This!", width/2, 275);
      text("U Can't Touch This!", width/2, 300);
      textFont(plain);
      fill(255);
      text("Game Over", width/2, 350);
      text("Your Score: "+ whackPoints + " Points", width/2, 382);
      text("Press 'spacebar' to play again", width/2, 410);
      textFont(small);
      text("Copyright Disclaimer: I Do Not Own The Contents Of This Song Or Claim Ownership", width/2, 50);
      text("All Rights Reserved to MC Hammer", width/2, 60);
    }

  if (gameState == 1) { //game screen
    background(landscape);
    fill(random(255),random(255),random(255));
    textFont(font);
    textAlign(CENTER);
    text("Hammer Time", width/2, 50);
    fill(255);
    text("Hammer Time", width/2-2, 48);

    currentTimer = millis();

    if (currentTime - startTime >= interval) {
      currentX = int(random(4));
      currentY = int(random(3));
      startTime = currentTime;
      isWhacked = false;
    }

    if (gameState == 1) {
      currentTime = millis();
      if ((currentTimer - startTimer >= limitTimer)&&(whackPoints >= 100)) {
        gameState = 2;
      }
      if ((currentTimer - startTimer >= limitTimer)&&(whackPoints < 100)) {
        gameState = 3;
      }     
      textAlign(LEFT);
      textFont(plain);
      fill(255);
      text("Time left: " + (limitTimer - (currentTimer - startTimer))/1000, 10, 120);
    }
    if (gameState == 1) {
      //ellipses
      noStroke();
      fill(255, 50, 50);

      if (isWhacked == false) { //balls
        image(mcUp, xPoses[currentX], yPoses[currentY]);
      }
      if (isWhacked == true) {
        image(mcDown, xPoses[currentX], yPoses[currentY]);
        whackPoints+=10;
        isWhacked = false;
      }
      textAlign(RIGHT);
      fill(255);
      text("Points: " + whackPoints, width-10, 120);
    }
  }

  //to load cursor image just in grass section
  if (mousePressed == true) {
    cursor(hammerdown, 0, 0);
  } 
  else {
    cursor(hammer, 0, 0);
  }
}


//whacking with mouse
void mousePressed() {
  if (dist(mouseX, mouseY, xPoses[currentX], yPoses[currentY]) < 40) {
    isWhacked = true;
  }
}

//starting the game
void keyPressed() {
  if ((key == 32 && gameState == 0) || (key == 32 && gameState ==2) || (key == 32 && gameState == 3)) {
    gameState++;
    if (gameState ==1) {
      startTimer = millis();
       whackPoints = 0;
    }
    if (gameState > 2) {
      gameState = 0;
    }
  }
}


