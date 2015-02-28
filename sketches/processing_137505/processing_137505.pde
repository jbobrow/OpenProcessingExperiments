
// Copyright Jacklynn Pham 2014
// Homework 7

/*
THE MISSION:
During a routine philanthropic space mission, a squadron of corgis were ambushed and held 
hostage by disgrunted hard science majors. While normally peace-loving, it is up to you, 
Commander Winkie (corgi astronaut) to destroy the prison and save the rest of your troops!

DIRECTIONS:
- Use your arrow keys to navigation your ship
- You have 1 minute to collide into the prison 10x in order to destroy it and release the prisoners.
- Each time you collide into something, you would be randomly ejected into another point in space.
- When you collide into a meteor or mission, you loose strength points. If you loose all 5 of your 
  strength points you have failed the mission.

Good luck, Commander. 

*/

// sounds from freesound.org
/////dog bark: @beerbelly38, plunk: @theta4, background: rjonesxlr8, dun dun: @Simon_Lacelle, success: @grunz

import ddf.minim.*;
Minim minim;
AudioPlayer bark, plunk, background, dundun, success;

int phase;

float mx1, my1, mwd,wd;
float mx2, my2;
float x, y;
float dx, dy;

float xBall, yBall; //Jeannette Subero bouncing ball code
float yPosA, xPosA;
float xVelA, yVelA, xVelB, yVelB;

//timer code from Mary Scahill
int actualSecs; //actual seconds elapsed since start
int actualMins; //actual minutes elapsed since start
int startSec = 0; //used to reset seconds shown on screen to 0
int startMin = 0; //used to reset minutes shown on screen to 0
int scrnSecs; //seconds displayed on screen (will be 0-60)
int scrnMins=0; //minutes displayed on screen (will be infinite)
int restartSecs=0; //number of seconds elapsed at last click or 60 sec interval
int restartMins=0; //number of seconds ellapsed at most recent minute or click
int startMillis = 0; // start when screen starts? I hope. 

int startTime; // start time for phase 1, game start

// player controls
float xdist;
float ydist;
float playerX, playerY;
float bounce;
float strength;
  int hits;
  int hurt;
  
//black hole variables
float bx, by, bwd, bht;

//images
PImage img;
PImage corgi;
PImage rock;
PImage meteor;
PImage prison, victory;

PFont font;
PFont largeFont;

/////////////////////////
/// SETUP //////////////
////////////////////////

void setup()
{
  size(1000, 800);
  background(0);
  smooth();
  noStroke();
  
  x = width;
  y = 0;
  wd = 50;// player size
  mwd = 50;// meteor size
  dx = 6;
  dy = 10;
  
  // my bouncing ball attempt
  xBall = 100; // size
  yBall = 100;
  xPosA=25;
  yPosA=25;
  
  xVelA=5;
  yVelA=7;


  //black hole variables (now the called the corgi prison)
  bx = width-500;
  by = height-750;
  bwd = 430;
  bht = 160;

  // loading font
  textAlign(CENTER);
  
  font = loadFont("BriemAkademiStd-Regular-23.vlw");
  largeFont = loadFont("BriemAkademiStd-Bold-60.vlw");
  textFont(font, 23);
  
  //player stuff
  bounce = random(0,600);
  hits = 0;
  strength= 6; // one more than you the number you want
  
  /////images
  img = loadImage("SpaceCorgis-instructions.jpg"); /// these are the instructions
  corgi = loadImage("corgi.png"); /// this is the player
  rock = loadImage("rock.png"); /// this is the bouncing ball
  meteor = loadImage("meteor.png"); // you know what it is.
  prison = loadImage("prison.png");
  victory = loadImage("victory.png");
  
  //game phases
  phase = 0;
  
  //sounds//////////////
  minim = new Minim(this);
  bark = minim.loadFile("bark.wav");
  plunk = minim.loadFile("plunk.wav");
  dundun = minim.loadFile("dundun.wav");
  success = minim.loadFile("success.wav");
  background = minim.loadFile("background.wav");
  background.play();
}

//////////////////////////////
/// DRAW ////////////////////
//////////////////////////////

void draw()
{
  if (phase == 0) 
  {  
    showInstructions(); 
  }
  else if (phase == 1)
  {
     loadGame();
  }
}

///////////////////////////////////////////

void loadGame()
{
  prepareWindow(); 
  player();
  meteor();
  
  drawBall();
  
  blackhole();
  movePlayer();
  timer();
  hits();
  
  endGame ();
}

void showInstructions()
{
  imageMode (CORNER);
  image(img, 0, 0);
}

////////////////
// TIMER //////////////////////////////
void timer()
{
    if (phase == 1)
    {
      fill(255, 0, 0);
      actualSecs = millis()/1000; //convert milliseconds to seconds, store values.
      actualMins = millis() /1000 / 60; //convert milliseconds to minutes, store values.
      scrnSecs = actualSecs-startMillis; //seconds to be shown on screen
      scrnMins = actualMins; //minutes to be shown on screen 
      text( "MISSION LENGTH > " + nf(scrnMins, 2) + " : " + nf(scrnSecs, 2), width/5, height - 50 );
    }
}


void drawBall()
{
  xPosA = xPosA + xVelA;
  yPosA = yPosA + yVelA;

  ellipse(xPosA,yPosA,xBall,yBall);
  image(rock, xPosA, yPosA);

  
  //Reverse Direction (set the value to Negative multiplying by -1)
  if ( xPosA > width-xBall/2 || xPosA < 0) {
    xVelA = xVelA * -1;
  }
  if (yPosA > height-xBall/2 || yPosA < 0) {
    yVelA = yVelA * -1;
  }

}

void movePlayer() // mark choi's code to controll the player's movements
{
  if (keyPressed == true)
  {
  if (key == CODED)
  {
    if (keyCode == LEFT)
    playerX = playerX-10;
    if (keyCode == RIGHT)
    playerX = playerX+10;
    if (keyCode == UP)
    playerY = playerY-10;
    if (keyCode == DOWN)
    playerY = playerY+10;
  }
  float temp, tempy;
  temp = playerX;
  playerX = constrain(temp, 0, width);
  tempy = playerY;
  playerY = constrain(tempy, 0, height-wd);
}
}

//////////////PLAYER OPTIONS//////////////


void player()
{
  imageMode(CENTER);
  fill (0);
  ellipse(playerX, playerY, wd, wd);
  image(corgi, playerX, playerY);
  
  
  /// attack on the prison :)  ////////////////////////////
 if ( playerX >= bx && playerX <= bx+bwd && playerY >= by && playerY <= by+bht )
   {
      fill(#78C473); // green blink when hit
      rect(bx+10, by, bwd, bht);
      playerX = random(0, width);
      playerY = random(0, height);
      hits++;
      bark.play();
      bark = minim.loadFile("bark.wav");
   }
  /// collision with the meteor :(  /////////////////////////
  if ( dist(x, y, playerX, playerY) <= wd/2+wd/2) 
  {
      background (100);
      strength--;
      playerX = random(0, width);
      playerY = random(0, height);
      plunk.play();
      plunk = minim.loadFile("plunk.wav");
  }
  /// collision with bouncing ball
  if ( dist(xPosA, yPosA, playerX, playerY) <= wd/2+wd/2)
    {
      background (100);
      strength--;
      playerX = random(0, width);
      playerY = random(0, height);
      plunk.play();
      plunk = minim.loadFile("plunk.wav");
    }
}



//////draw the prison/////////////////////////
void blackhole()
{
  fill(0);
  imageMode(CORNER);
  //rect(bx, by, bwd, bht);
  image(prison, bx, by);
  
}
//////draw the meteor/////////////////////////
void meteor()
{
  fill(255,0,0);
  ellipse(x, y, mwd, mwd);
  image(meteor, x, y); //load image
  
  y += dy; 
  if (y > height+mwd*2)
  {
    y = 0;
    x = random(0, width); // randomly falls
  }
}

void hits()
{
  fill(#78C473);
  text("Hits > " + hits, width-width/2, height-50);
  if (hits == 10)
  {
    background (0, 255, 0);
  }   
  fill(255,0,0);
  text("Your strength: " + strength, width-width/5, height-50);
}

/////////////////////////////////
//// END GAME /////////////////// 

void endGame ()
{
  if ( hits == 10) // player wins the game
  {
    background.pause();
    success.play();
    success = minim.loadFile("success.wav");
  background (0);
  textFont(largeFont);
  text ("You saved the day!", width/2, height/2-200);
  textFont(font);
  text ("YOUR HITS: " + hits, width/2-200, height/2-150);
  text ("YOUR FINAL STRENGTH: " + strength, width/2+150, height/2-150);
  imageMode(CENTER);
  image(victory, width/2, height-175);
  
    if (strength <= 2)
     {
       fill(#78C473);
       text("The corgis are free, but your ship needs a repair:", width/2, height/3+50);
       textFont(largeFont);
       text("100 karma points, -$100", width/2, height/3+ 120);
     }
     else {
       fill(#78C473);
       text("You are truly worthy of our respect & admiration:", width/2, height/3+50);
       textFont(largeFont);
       text("1,000,000 karma points", width/2, height/3+ 120);
     }
  
  noLoop(); // stops draw
  }
  if ( actualMins == 1 || strength <= 0)
  {
       background.pause();
       dundun.play();
       dundun = minim.loadFile("dundun.wav");
        background (0);
        textFont(largeFont, 50);
        text ("You have doomed all of the corgis", width/2, height/2-200);
        text ("SAD SPACE CORGIS :*(", width/2, height/2);
        textFont(font);
        text ("YOUR HITS: " + hits, width/2-200, height/2-150);
        text ("YOUR FINAL STRENGTH: " + strength, width/2+150, height/2-150);
         text("Think about what you just did for 20 minutes", width/2, height/2+ 90);
         
  noLoop(); // stops draw
  }
}



void keyPressed()
{
  if (phase == 0)
  {
    startMillis = millis()/1000;
  }
  phase = 1;
}



void prepareWindow()
{
  fill (0, 20);
  rect (0, 0, width, height);
  fill (255,0,0);
}



