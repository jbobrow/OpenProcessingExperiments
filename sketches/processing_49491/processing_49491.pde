
import processing.video.*;

int x; 
int y;
int xChange;
int yChange;
PImage wallPaper;
PImage typeWBack;
PImage paper;
PImage gorgo;
PImage typeFront;
PImage vignette;

//timing

int savedTime;
int totalTime = 1000;

// sound initialisation

Movie movie;
Movie sound;

// start

boolean startGame = true;

// keySetup

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

//playhead


Player playHead;


void setup() {

  size (1246, 999 );
  smooth();
  noStroke();

  wallPaper = loadImage("wallPaper.jpg");
  typeWBack = loadImage("typeWBack.png");
  paper = loadImage("paper.png");
  vignette = loadImage("vignette.png");



  gorgo = loadImage("gorgo.png");
  typeFront = loadImage("typeFront.png");

  savedTime = millis();
  // sound related stuff

  movie = new Movie (this, "oneForward.wav");
  sound = new Movie (this, "toTheFront2.wav");
} 




void draw () {
  startGame();
  pictures();  
  updatePaper();
 
}



void startGame() {
  //increase xChange by 345 and then start the game

    if ((xChange<305) && startGame) {

    xChange += 10;
  }
  else {

    startGame = false;
  }
}


void updatePaper () {
  if ((!startGame)&&((xChange>-226) || (xChange<305))) {
    int passedTime = millis() - savedTime;
    if (passedTime >totalTime) {

      xChange -=10;
      movie.stop();
      movie.play();
      savedTime = millis();
    }
    if ((xChange <= -226) || (xChange >=305)) {
      
    }
  }
}
  void pictures () {

    //these things are behind the scene
    image (wallPaper, -156, 0);
    image (typeWBack, -156+xChange, 0);
    image (paper, -156+xChange, 0);

    //here comes all the action - Muhahahah




    //these things are n front of the scene
    image (gorgo, -156+xChange, 0);
    image (typeFront, -156, 0);
    image (vignette, -156, 0);
  }
  
  class Bullet {
 
  float xBull;
  float yBull;
 
  float velYBull;
   
  boolean enabled;
 
  Bullet() {
 
    reset();
  } 
 
  void reset() {
    xBull = width/2;
    yBull = height;
 
    velYBull = -4;
     
    enabled = true;
  }
 
  void update() {
    y+=velYBull;
     
    fill(255);
    noStroke();
    ellipse(x, y, 5, 5);
     
     
  }
}



