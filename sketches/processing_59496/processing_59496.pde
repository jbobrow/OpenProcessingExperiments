
// Final Project: Just Keep Swimming
//Raeleen Murugan, Sandi Hogan, Brandon Lamson and 
//with help from Oliver Zhang 


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


///
int INTRO = 0;
int RUN_GAME = 1;
int GAMEOVER = 2;
int gameStage;  

PImage fishImage;
PImage mineImage;
PImage waterImage;


int score= 0;

PFont titleFont;
PFont scoreFont;
PFont basicFont;

Shark shark; 
Scoreboard scoreboard;
Mines mines[] = new Mines[1];

Minim minim;
AudioPlayer song;

///---------------------------------------------------------------
void setup() {
  noStroke();
  size(750, 450);

  fishImage = loadImage("nemo.png");
  mineImage= loadImage("mines.png");
  waterImage=loadImage("underwater.jpg");

  // create new shark object: 
  shark = new Shark() ;
  for (int i=0; i< mines.length; i ++) {


    mines[i]= new Mines();
  }


  titleFont = createFont("Calibri", 58);
  basicFont = createFont("Kefa", 30); 
  scoreFont = createFont("14Segment", 14);

  scoreboard= new Scoreboard();


  minim = new Minim(this);

  song= minim.loadFile("nemo.mp3");
  song.play();
  song.loop();
}

void draw() {
  if (gameStage == INTRO) 
    intro(); 

  if (gameStage == RUN_GAME) 
    runGame();

  if (gameStage == GAMEOVER) 
    gameover();
}

//-------------------------------------------------------------------
void intro() {
  background(0, 245, 255);

  fill(255);

  textFont(titleFont); 
  text("Just Keep Swimming", width/5.5, height/2); 
  textFont(basicFont); 
  text("Dodge all the Mines ! Click to start", width/4, height/3*2);
}

//----------------------------------------------------------------------

void gameover() {
  background(0, 245, 255);

  fill(255);

  textFont(titleFont); 
  text("Game Over!", width/10, height/2); 
  textFont(basicFont); 
  text("Click to just keep swimming!", width/3, height/3*2);
}


// THE GAME CODE: MAIN code-----------------------------------------------

void runGame() {

  imageMode(CENTER);
  image(waterImage, 400, 200);

  for (int i= 0; i < mines.length; i ++ ) {
    mines[i].display();
    mines[i].fall(); 
    if ( overlap(shark.x, shark.y, shark.diameter/2, 
    mines[i].x, mines[i].y, mines[i].diameter/2) ) {
      // game over!
      scoreboard.lives -= 1;
    }
  }

  shark.move();
  shark.display();
  scoreboard.displayscore();

  drawScore();

  score++;

  if ( score % 100==0) {
    Mines newEnemy = new Mines();
    mines = (Mines[])append(mines, newEnemy);
  }


  if (scoreboard.lives < 0) gameStage = GAMEOVER;
}

void drawScore() {
  // draw the score 

    fill(0, 255, 0); 
  textFont(scoreFont); 
  text("Score: " + score, 20, 20);
}

boolean overlap(float x1, float y1, float r1, float x2, float y2, float r2) {
  float d = dist(x1, y1, x2, y2);
  if ( d < (r1+r2) ) return true;
  return false;
}



void mousePressed() { 
  if (gameStage == GAMEOVER || gameStage == INTRO) {
    gameStage = RUN_GAME; 

    mines = new Mines[1];
    mines[0] = new Mines();

    scoreboard.lives = 500;
    score = 0;
  }
}

class Scoreboard {
  int score;
  int lives;

  Scoreboard () {
    score=0;
    lives=5;
  }


  void displayscore() {

    text ("health left:" + lives, 10, 40);
  }
}


