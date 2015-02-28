
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// 257/757  Spring 2014
// HW #7
// 2/27/14

//*********************************************

// OBJECTIVE: 
// Reach the other side of the desert (go right)
// Avoid the obstacles (tumbleweed, scorpion, and rattlesnake)
// Collect as many points as possible!

// USER CONTROLS: 
// Left and right arrows to walk left or right
// Up arrow to jump

// PROGRAM INFORMATION
// All images copyright Shannon Impellicceiri 2014

// The following sound effects were obtained from www.soundbible.com:
// Rattlesnake: Public domain license
// Pain: Sampling Plus 1.0 license (Recorded by thecheeseman)
// Jump: Attribution 3.0 license (Recorded by snottyboy)
// Winner: Attribution 3.0 license (Recorded by Mike Koenig)
// Score points: Attribution 3.0 license (Recorded by Popup Pixels)

// The following sound effects were obtained by www.freesound.org:
// Walking: Non-commercial use license (Recorded by stintx)

//*********************************************
/*// Import library
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;
*/
//*********************************************
// Declare game state variables
int gameState;
// 1 = start screen;
// 2 = game mode;
// 3 = start over screen;
// 4 = game over YOU LOSE screen;
// 5 = game over YOU WIN screen;

// Declare figure movement variables
float backgroundX;
float figX; // x position of center
float figXvelocity;
float figY0; // original y position of base
float figY; // y position of base
float figYvelocity0;
float figYvelocity;
float figJumpTime;
boolean jumping;
boolean keyup;
boolean keyleft;
boolean keyright;
float bootRotationL;
float bootRotationR;
float deltaBootRotation;
float hatY;
float deltaHatY;
boolean hatFall;
float hatFallSpeed0;
float hatFallSpeed;

// Declare obstacle variables
float tumbleweedX;
float tumbleweedY0;
float tumbleweedY;
float tumbleweedXspeed;
float tumbleweedYspeed0;
float tumbleweedYspeed;
float scorpionX;
float scorpionY;
float scorpionYspeed;
float scorpionYmin;
float scorpionYmax;
float snakeY;
float snakeTop;
float snakeBottom;
float snakeSpeed;
float snakeRattleX;
float snakeRattleSpeed;
float snakeRattleLeft;
float snakeRattleRight;

// Declare color variables
color colSky = color(135,206,250);
color colSand = color(240,230,140);

// Declare time variables
int startTime;
int endTime;
int[] totFrames = new int[5];

// Declare score variables
int myScore;
int myLives;
float[] pointsX = new float[10];
float[] pointsY = new float[10];
int[] pointsValue = new int[10];
int[] pointsAllValues = new int[3];
boolean[] pointsOn = new boolean[10];

// Declare image variables
PImage cactus1;
PImage cactus2;
PImage grass1;
PImage grass2;
PImage scorpion;
PImage rock1;
PImage rock2;
PImage skull;
PImage tumbleweed;
PImage cowboy;
PImage bootrt;
PImage bootlt;
PImage hat;
PImage snakebody;
PImage snaketail;
PImage snakehead;
PImage star;
PImage startSign;
PImage finishSign;
/*
// Declare sound variables
AudioPlayer soundWalking, soundJump, soundPoints, soundDeath, soundWinner, soundRattle;
boolean walkingSoundOn;
boolean rattleSoundOn;
*/
//*********************************************
void setup(){
  size(800,600);
  
  // initialize variables
  resetVariables();
  myLives = 5;
  keyup = false;
  keyleft = false;
  keyright = false;
  
  // start game
  gameState = 1;
  frameRate(30);
  
  // load images
  cactus1 = loadImage("cactus1.png");
  cactus2 = loadImage("cactus2.png");
  grass1 = loadImage("grass1.png");
  grass2 = loadImage("grass2.png");
  scorpion = loadImage("scorpion.png");
  rock1 = loadImage("rock1.png");
  rock2 = loadImage("rock2.png");
  skull = loadImage("skull.png");
  tumbleweed = loadImage("tumbleweed.png");
  cowboy = loadImage("cowboy.png");
  bootrt = loadImage("bootrt.png");
  bootlt = loadImage("bootlt.png");
  hat = loadImage("hat.png");
  snakebody = loadImage("snakebody.png");
  snakehead = loadImage("snakehead.png");
  snaketail = loadImage("snaketail.png");
  star = loadImage("star.png");
  startSign = loadImage("startsign.png");
  finishSign = loadImage("finishsign.png");
  imageMode(CENTER);
  
  /*// load audio
  minim = new Minim(this);
  soundWalking = minim.loadFile("R107624_stintx_running-02.wav");
  soundJump = minim.loadFile("Jump-SoundBible.com-1007297584.wav");
  soundPoints = minim.loadFile("Ting-Popup_Pixels-349896185.wav");
  soundDeath = minim.loadFile("Pain-SoundBible.com-1883168362.wav");
  soundWinner = minim.loadFile("Ta Da-SoundBible.com-1884170640.wav");
  soundRattle = minim.loadFile("Rattlesnake Rattle-SoundBible.com-892839920.wav");
  */
}

//*********************************************
void draw(){
  switch(gameState){
    case 1:
    // 1 = start screen
      startGame();
      break;
    case 2:
    // 2 = game mode
      playGame();
      break;
    case 3:
    // 3 = start over screen
      retryGame();
      break;
    case 4:
    // 4 = game over YOU LOSE screen
      gameOverLoser();
      break;
    case 5:
    // 5 = game over YOU WIN screen
      gameOverWinner();
      break;
  }
}

//*********************************************
void startGame(){
  // declare
  float lineSize;
  
  // initialize variables
  lineSize = 18;
  
  // start screen
  fill(0);
  rect(0,0,width,height);
  
  // text
  textSize(60);
  textAlign(CENTER);
  fill(255);
  text("On the Lam!", width/2,height*.15);
  
  // obstacles
  textSize(20);
  text("OBJECTIVE:", width/2,height/4+(1*lineSize));
  textSize(16);
  text("Reach the other side of the desert and avoid the obstacles:",width/2,height/4+(2*lineSize));
  image(tumbleweed, width/3,height*.41, 100,100);
  image(scorpion, width/2,height*.41, 100,100);
  image(snaketail, (width*2/3)+35,(height*.41),50,50);
  image(snakehead, (width*2/3)-10,(height*.41)-23,50,50);
  image(snakebody, width*2/3,(height*.41)+20,80,80);
  fill(150);
  textSize(13);
  text("Tumbleweed", width/3,height/3+(6*lineSize));
  text("Scorpion", width/2,height/3+(6*lineSize));
  text("Rattlesnake", width/3*2,height/3+(6*lineSize));
  
  // points
  textSize(16);
  fill(255);
  text("Collect as many points as possible along the way!",width/2,height/3+(8*lineSize));
  textSize(20);
  text("CONTROLS:", width/2,height/3+(14*lineSize));
  textSize(16);
  text("Left and right arrows to walk", width/2,height/3+(15*lineSize));
  text("Up arrow to jump", width/2,height/3+(16*lineSize));
  
  // start message flashing
  if(frameCount%50<=25){
    text("PRESS 'ENTER' TO START", width/2,height-50);
  }
  
  // start game when user presses enter
  if(keyPressed == true){
    if(key == ENTER || key == RETURN){
      gameState = 2;
      startTime = frameCount;
    }
  }
}
//*********************************************
void playGame(){
  drawLandscape();
  drawFigure();
  checkIfDead();
  scorePoints();
}
//*********************************************
void retryGame(){
  // declare variables
  String tempSec;
  String tempMin;
  int totalTime;
  
  // try again screen  
  fill(0);
  rect(0,0,width,height);
  textSize(60);
  fill(255);
  textAlign(CENTER);
  text("You Died!",width/2,height/2);
  
  // points message
  textSize(18);
  if(myScore>0){
    text("You must forfeit the " +myScore+ " points you collected!",width/2,height/2+25);
  }else{
    text("Score: 0",width/2,height/2+25);
  }
  
  // lives
  textSize(24);
  text("Lives Remaining: " + myLives, width/2, height/2+75);
  
  // show time elapsed
  totalTime = totFrames[0]+totFrames[1]+totFrames[2]+totFrames[3]+totFrames[4];
  text("Total Time Elapsed: " + framesToMin(totalTime) + ":" + framesToSec(totalTime), width/2, height/2+105);
  textSize(18);
  if(myLives <4){
    // user has made multiple attempts
    for(int i = 0; i<(5-myLives); i++){
      text("Attempt #" + (i+1) + ": " + framesToMin(totFrames[i]) + ":" + framesToSec(totFrames[i]),width/2,height/2+135+(i*20));
    }
  }
  
  // start message flashing
  if(frameCount%50<=25){
    text("PRESS 'ENTER' TO CONTINUE", width/2,height-50);
  }
  
  // start game when user presses enter
  if(keyPressed == true){
    if(key == ENTER || key == RETURN){
      gameState = 2;      
      resetVariables();
    }
  }
}
//*********************************************
void gameOverLoser(){
  // declare variables
  String tempSec;
  String tempMin;
  int totalTime;
  
  // game over screen  
  fill(0);
  rect(0,0,width,height);
  textSize(60);
  fill(255);
  textAlign(CENTER);
  text("GAME OVER",width/2,height/2);
  textSize(24);
  text("Lives Remaining: " + myLives, width/2, height/2+50);
  
  // show time elapsed
  totalTime = totFrames[0]+totFrames[1]+totFrames[2]+totFrames[3]+totFrames[4];
  text("Total Time Elapsed: " + framesToMin(totalTime) + ":" + framesToSec(totalTime), width/2, height/2+80);
  textSize(18);
  for(int i = 0; i<(5-myLives); i++){
    text("Attempt #" + (i+1) + ": " + framesToMin(totFrames[i]) + ":" + framesToSec(totFrames[i]),width/2,height/2+110+(i*20));
  }
  
  // start message flashing
  if(frameCount%50<=25){
    text("PRESS 'ENTER' TO START A NEW GAME", width/2,height-50);
  }
  
  // start game when user presses enter
  if(keyPressed == true){
    if(key == ENTER || key == RETURN){
      gameState = 2;      
      resetVariables();
      myScore = 0;
      myLives = 5;
      totFrames[0] = 0;
      totFrames[1] = 0;
      totFrames[2] = 0;
      totFrames[3] = 0;
      totFrames[4] = 0;
      startTime = frameCount;
    }
  }
}
//*********************************************
void gameOverWinner(){
  
  // declare variables
  String tempSec;
  String tempMin;
  int totalTime;
  
  // game over screen (final points) 
  fill(0);
  rect(0,0,width,height);
  textSize(60);
  fill(255);
  textAlign(CENTER);
  text("Winner!",width/2,height/2);
  
  // points message
  textSize(24);
  text("Score: " + myScore, width/2,height/2+50);
  
  // lives
  text("Lives Remaining: " + myLives, width/2, height/2+75);
  
  // show time elapsed
  totalTime = totFrames[0]+totFrames[1]+totFrames[2]+totFrames[3]+totFrames[4];
  text("Total Time Elapsed: " + framesToMin(totalTime) + ":" + framesToSec(totalTime), width/2, height/2+105);
  textSize(18);
  if(myLives <5){
    // user has made multiple attempts
    for(int i = 0; i<(6-myLives); i++){
      text("Attempt #" + (i+1) + ": " + framesToMin(totFrames[i]) + ":" + framesToSec(totFrames[i]),width/2,height/2+135+(i*20));
    }
  }
  
  // start message flashing
  if(frameCount%50<=25){
    text("PRESS 'ENTER' TO PLAY AGAIN", width/2,height-50);
  }
  
  // start game when user presses enter
  if(keyPressed == true){
    if(key == ENTER || key == RETURN){
      gameState = 2;      
      resetVariables();
      myLives = 5;
      for(int i=0;i<5;i++){
        totFrames[i] = 0;
      }
    }
  }
}

//*********************************************
void drawLandscape(){
  // declare variables
  float hills1;
  float hills2;
  float hills3;
  float hills4;
  float hills5;
  String timeSecStr;
  String timeMinStr;

  // intitialize variables
  hills1 = height*.4;
  hills2 = height*.45;
  hills3 = height*.5;
  hills4 = height*.55;
  hills5 = height*.6;
  
  // draw sky
  noStroke();
  fill(colSky);
  rect(0,0,width,height);
  fill(colSand);
  
  // draw scrolling background
  //--------------------------------
  pushMatrix();
    translate(backgroundX,0);
    //-xxxxxxxxxxxxxxxxxxxxxxxxx-
    // draw sand
    stroke(70);
    beginShape();
      curveVertex(width*4.5,height*2);
      curveVertex(-width,height*2);
      curveVertex(-width,hills3);
      // start horizon
      curveVertex(-width/4,hills2);
      curveVertex(width*.25,hills4);
      curveVertex(width*.7,hills1);
      curveVertex(width*1.3,hills3);
      curveVertex(width*1.6,hills2);
      curveVertex(width*2.1,hills5);
      curveVertex(width*2.8,hills2);
      curveVertex(width*3.5,hills4);
      // end horizon
      curveVertex(width*4.5,hills3);
      curveVertex(width*4.5,height*2);
      curveVertex(-width,height*2);
    endShape();
    
    //-xxxxxxxxxxxxxxxxxxxxxxxxx-
    // SCENERY
    image(cactus1,width*.12,hills1,250,250);
    image(rock2,width*.5,hills3,150,150);
    image(grass1,width*.83,hills2,90,90);
    image(rock1,width*1.45,hills3,100,100);
    image(cactus2,width*1.7,hills1,250,250);
    image(grass2,width*2.4,hills3,90,90);
    image(skull,width*2.65,height*.5,100,100);
    image(cactus1,width*2.8,hills1,250,250);
    
    //-xxxxxxxxxxxxxxxxxxxxxxxxx-
    // OBSTACLE 3: Snake
    // snake rattle
    pushMatrix();
      translate((width*2.1)+50+snakeRattleX,height*.5);
      rotate(radians(snakeRattleX*2));
      image(snaketail,0,0,100,100);
    popMatrix();
    // snake head
    pushMatrix();
      translate(0,(height*.5)+snakeY);
      image(snakehead,(width*2.1)+.5,0,100,100);
    popMatrix();
    // mask for head lowering
    fill(colSand);
    noStroke();
    rectMode(CORNER);
    rect(width*2.1-100,height*.6,200,200);
    // snake body
    image(snakebody,width*2.1,height*.6,150,150);
    
    // move snake head
    if(snakeY<snakeTop){
      snakeY = snakeTop;
      snakeSpeed *= -1;
    }else if(snakeY>snakeBottom){
      snakeY = snakeBottom;
      snakeSpeed *=-1;
    }
    snakeY += snakeSpeed;
    
    // move snake tail
    if(snakeY < 80){
      // rattle the tail if the head is showing
      if(snakeRattleX<snakeRattleLeft){
        snakeRattleX = snakeRattleLeft;
        snakeRattleSpeed *= -1;
      }else if(snakeRattleX>snakeRattleRight){
        snakeRattleX = snakeRattleRight;
        snakeRattleSpeed *=-1;
      }
      snakeRattleX += snakeRattleSpeed;
    }else{
      snakeRattleX = 0;
    }
    
    //-xxxxxxxxxxxxxxxxxxxxxxxxx-
    // POINTS STARS
    stroke(0);
    textSize(16);
    for(int i=0;i<10;i++){
      if(pointsOn[i]){
        // if points is available
        image(star,pointsX[i],pointsY[i],75,75);
        fill(0);
        textAlign(CENTER,CENTER);
        text(pointsValue[i],pointsX[i],pointsY[i]);
      }
    }
    textAlign(CENTER,BOTTOM);
    
    //-xxxxxxxxxxxxxxxxxxxxxxxxx-
    // OBSTACLE 1: Tumbleweed
    pushMatrix();
      translate(tumbleweedX,tumbleweedY);
      rotate(radians(-4*frameCount));
      image(tumbleweed,0,0,100,100);
    popMatrix();
    tumbleweedX -= tumbleweedXspeed;
    // wrap tumbleweed
    if(tumbleweedX < 0){
      tumbleweedX = width*3;
    }
    // bounce tumbleweed
    tumbleweedY -= tumbleweedYspeed;
    tumbleweedYspeed --;
    if(tumbleweedY == tumbleweedY0){
      // re-start bounce
      tumbleweedYspeed = tumbleweedYspeed0;
    }
    //-xxxxxxxxxxxxxxxxxxxxxxxxx-
    // OBSTACLE 2: Scorpion
    image(scorpion,scorpionX,scorpionY,125,125);
    // move scorpion
    scorpionY += scorpionYspeed;
    if(scorpionY < scorpionYmax){
      // too high
      scorpionY = scorpionYmax;
      scorpionYspeed *= -1;
    }
    if(scorpionY > scorpionYmin){
      // too low
      scorpionY = scorpionYmin;
      scorpionYspeed *= -1;
    }
    //-xxxxxxxxxxxxxxxxxxxxxxxxx-
    // SIGN POSTS
    image(startSign,width*.1,height*.74,150,150);
    image(finishSign,width*2.9,height*.74,150,150);
    
  popMatrix();
  //--------------------------------
  
  // draw status bar
  fill(0);
  rect(0,height-70,width,70);
  textAlign(LEFT);
  textSize(18);
  fill(255);
  text("Score: " + myScore,50,height-25);
  textAlign(RIGHT);
  text("Lives Remaining: " + myLives,width-50,height-25);
  
  // show time elapsed
  timeMinStr = framesToMin(frameCount-startTime);
  timeSecStr = framesToSec(frameCount-startTime);
  textAlign(CENTER);
  textSize(30);
  text(timeMinStr + ":" + timeSecStr,width/2,height-25);
}

//*********************************************
String framesToMin(int framesElapsed){
  // return number of minutes elapsed (in string form) based on number of frames
  int timeMin;
  
  timeMin = round(framesElapsed/30/60);
  return(nf(timeMin,2));
}
//*********************************************
String framesToSec(int framesElapsed){
  // return number of minutes elapsed (in string form) based on number of frames
  int timeSec;
  
  timeSec = round((framesElapsed/30)%60);
  return(nf(timeSec,2));
}

//*********************************************
void drawFigure(){
  
  //--------------------------------
  // DRAW COWBOY
  // torso
  image(cowboy,figX,figY-50,150,150);
  // right boot
  pushMatrix();
    translate(figX,figY);
    rotate(radians(bootRotationR));
    image(bootrt,-35,20,80,80); 
  popMatrix();
  // left boot
  pushMatrix();
    translate(figX,figY);
    rotate(radians(bootRotationL));
    image(bootlt, 35,20,80,80);
  popMatrix();    
  // hat
  pushMatrix();
    translate(figX, figY-100+hatY);
    image(hat,0,0,150,150);
  popMatrix();
  
  // MOVE FIGURE 
  //--------------------------------
  // MOVE RIGHT
  if(keyright){
    // move figure or background?
    if(figX < width/2){
      // figure is in left half of screen
      // move figure right
      figX+= figXvelocity;
    }else if(backgroundX>=-width*2){
      // figure is in middle
      // background is not yet at right limit
      // move background
      figX = width/2;
      backgroundX -= figXvelocity;
    }else{
      // figure is in right half of screen
      // background is at right limit
      // move figure
      figX+= figXvelocity;
    }
  }
  //--------------------------------
  // MOVE LEFT
  if(keyleft){
    // move figure or background?
    if(figX<=width/10){
      //figure is at left limit
      figX = width/10;
      // move background
      backgroundX +=figXvelocity;
      if(backgroundX >=0){
        // don't allow background to reverse past starting position
        backgroundX = 0;
      }
    }else{
      // move figure
      figX-=figXvelocity;
    }
  }
  //--------------------------------
  // JUMP IN PROGRESS
  if(jumping == true){
    figY -= figYvelocity;
    figYvelocity--;
    // jumping boot position
    if(figYvelocity >= 0){
      // jump is on the way up
      // move feet out
      if(bootRotationR < 60){
        bootRotationL -= 3;
        bootRotationR +=3;
      }
      // move hat up
      if(hatY > -50){
        hatY -= deltaHatY;
      }
    }else{
      // jump is on the way down
      // move feet in
      if(bootRotationR > 15){
        bootRotationL += 3;
        bootRotationR -= 3;
      }
      // move hat down
      hatY += deltaHatY;
    }

    if(figY >= figY0){
      // back to starting position on ground
      figY = figY0;
      // check for whether to drop hat
      if(jumping == true){
        // upon first landing, launch the hat fall sequence
        hatFall = true;
        hatFallSpeed = deltaHatY/8;
      }
      // end of jump
      jumping = false;
      // return boot and hat position
      bootRotationL = -15;
      bootRotationR = 15;
    }
  }
  
  //--------------------------------
  // ROTATE BOOTS
  if((keyright || keyleft) && jumping == false){
    // if figure is walking, move boots
    bootRotationL += deltaBootRotation;
    bootRotationR += deltaBootRotation;
    if(bootRotationR >= 30 || bootRotationR <= 0){
      // if boot rotation is out of range, switch direction
      deltaBootRotation *= -1;
    }
  }else if(jumping == false){
    // figure is not walking
    // return boots to original positon
    bootRotationL = -15;
    bootRotationR = 15;
  }
  
  //--------------------------------
  // HAT FALL IN PROGRESS
  if(hatFall == true){
    hatY += hatFallSpeed;
    hatFallSpeed -= deltaHatY;
    // check for hat fall finished
    if(hatY <= 0){
      // hat is back in original position
      hatFall = false;
      hatFallSpeed = 0;
      hatY = 0;
    }
  }
  /*
  // TURN SNAKE RATTLE ON OR OFF
  //--------------------------------
  if(backgroundX<-800 && snakeY < 70){
    playRattleSound();
  }else{
    pauseRattleSound();
  }*/
  //--------------------------------
  // CHECK FOR GAME WINNER
  if(figX>width){
    // winner!
    // record time elapsed
    endTime = frameCount;
    totFrames[5-myLives] = endTime-startTime;
    // winner screen
    gameState = 5;
    // winner sound
    //soundWinner.play();
    //soundWinner = minim.loadFile("Ta Da-SoundBible.com-1884170640.wav");
    //pauseRattleSound();
    gameOverWinner();
  }
}
//*********************************************
void keyPressed(){
  if(gameState == 2){
    // check for game in progress
    if(key == CODED){
      // UP ARROW = JUMP
      // ------------------------
      if(keyCode == UP){
        keyup = true;
        // check for duplicate key press
        if(figY == figY0){
          // the figure is on the ground! allow jump
          // jump sound
          //soundJump.play();
          //soundJump = minim.loadFile("Jump-SoundBible.com-1007297584.wav");
          // jump parameters
          figJumpTime = frameCount;
          figYvelocity = figYvelocity0;
          jumping = true;
          // start boots in neutral position
          bootRotationL = -15;
          bootRotationR = 15;
          // stop walking sound
          //pauseWalkingSound();
        }
      }
      // LEFT/RIGHT ARROWS = WALK
      // ------------------------
      if(keyCode == LEFT){ 
        //playWalkingSound();
        keyleft = true;
      }
      if(keyCode == RIGHT){
        //playWalkingSound();
        keyright = true;
      }
    }
  }
}
//*********************************************
void keyReleased(){
  
  if(key == CODED){
    if(keyCode == UP){
      keyup = false;
    }
    if(keyCode == LEFT){
      // pause walking sound
      keyleft = false;
      //pauseWalkingSound();
    }
    if(keyCode == RIGHT){
      // pause walking sound
      keyright = false;
      //pauseWalkingSound();
    }
  }
}
//*********************************************
void checkIfDead(){
  boolean amIdead;
  amIdead = false;

  // ----------------------------------
  // Check for intersections with obstacles
  if(checkIntersect(figX,figY-50,80,160,tumbleweedX+backgroundX,tumbleweedY,80,80)){
    // OBSTACLE 1: Tumbleweed
    amIdead = true;
  }else if(checkIntersect(figX,figY-50,80,160,scorpionX+backgroundX,scorpionY,80,125)){
    // OBSTACLE 2: Scorpion
    amIdead = true;
  }else if(snakeY<70){
    // OBSTACLE 3: Snake
    // Snake can only kill if head is out and rattle is going
    if(checkIntersect(figX,figY-50,80,160,(width*2.1)+backgroundX,(height*.6)-32.5+(snakeY/2),150,90+(65-snakeY))){
      amIdead = true;
    }
  }
  
  // ----------------------------------
  // If intersecting a deadly object...
  if(amIdead==true){
    /*// play death sound 
    soundDeath.play();
    soundDeath = minim.loadFile("Pain-SoundBible.com-1883168362.wav");
    pauseRattleSound();*/
    
    // lose a life
    // record time elapsed
      endTime = frameCount;
      totFrames[5-myLives] = endTime-startTime;
      myLives--;
      // continue or game over?
      if(myLives>0){
        gameState = 3;
      }else{
        gameState = 4;
      }
  }
}
//*********************************************
void resetVariables(){
  // initialize background variables
  backgroundX = 0;
  
  // initialize figure variables
  figX = width*.3;
  figXvelocity = 4.5;
  figY0 = height*2/3;
  figY = figY0;
  figYvelocity0 = 23;
  figYvelocity = 0;
  jumping = false;
  bootRotationL = -15;
  bootRotationR = 15;
  deltaBootRotation = 5;
  hatY = 0;
  deltaHatY = 3;
  hatFall = false;
  hatFallSpeed = 0;
  //walkingSoundOn = false;
  //rattleSoundOn = false;
  
  // initialize obstacle variables
  tumbleweedX = width*1.5;
  tumbleweedY0 = height*2/3;
  tumbleweedY = tumbleweedY0;
  tumbleweedXspeed = 7.5;
  tumbleweedYspeed0 = 5;
  tumbleweedYspeed = tumbleweedYspeed0;
  scorpionX = width*1.2;
  scorpionYmin = figY0;
  scorpionYmax = 60;
  scorpionY = scorpionYmin;
  scorpionYspeed = -4;
  snakeY = 0;
  snakeTop = -20;
  snakeBottom = 150;
  snakeSpeed = 1;
  snakeRattleX = 0;
  snakeRattleSpeed = 4;
  snakeRattleLeft = -2;
  snakeRattleRight = 2;
  
  // initialize game variables
  myScore = 0;
  startTime = frameCount;
  
  // INITIALIZE POINT VARIABLES
  //-------------------------
  // possible point star values
  pointsAllValues[0] = 250;
  pointsAllValues[1] = 500;
  pointsAllValues[2] = 1000;
  
  // assign point star positions
  //-------------------------
  // values for star #1
  pointsX[0] = random(width*.25,width*.9); // random x,y positions within figure movement boundaries
  pointsY[0] = random(height*.25,figY0);
  pointsValue[0] = pointsAllValues[int(random(pointsAllValues.length))]; // random point value based on 3 possible star values
  pointsOn[0] = true; // star starts as visible
  // values for stars #2-10
  for(int i=1; i<10; i++){
    pointsX[i] = pointsX[i-1] + random(width*.15,width*.75);
    pointsY[i] = random(height*.25,figY0);
    pointsValue[i] = pointsAllValues[int(random(pointsAllValues.length))];
    pointsOn[i] = true;
  }
}
//*********************************************
boolean checkIntersect(float myX, float myY, float myWd, float myHt, float itsX, float itsY, float itsWd, float itsHt){
  // check whether my figure intersects with another object
  // variables based on figure and object center point, width, height
  
  // declare variables
  boolean intersection;
  
  // check left/right intersection
  if((myX + (myWd/2)) < (itsX - (itsWd/2))){
    // I am to the left of the object?
    intersection = false;
  }else if((myX - (myWd/2)) > (itsX + (itsWd/2))){
    // I am to the right of the object?
    intersection = false;
  }else if((myY - (myHt/2)) > (itsY + (itsHt/2))){
    // I am below the object?
    intersection = false;
  }else if((myY + (myHt/2)) < (itsY - (itsHt/2))){
    // I am above the object?
    intersection = false;
  }else{
    // figure is intersecting the object
    intersection = true;
  }
  
  // return true for intersecting, false for not intersecting
  return(intersection);
}
//*********************************************
void scorePoints(){
  for(int i = 0; i<10;i++){
    // check for points scored
    if(pointsOn[i]){
      // points must be visible (true indicates not previously collected)
      if(checkIntersect(figX,figY-50,80,160,pointsX[i]+backgroundX,pointsY[i],12.5,12.5)){
        // figure is intersecting points
        myScore += pointsValue[i];
        pointsOn[i] = false;
        // point score sound
        //soundPoints.play();
        //soundPoints = minim.loadFile("Ting-Popup_Pixels-349896185.wav");
      }
    }
  }
}
/*
//*********************************************
void pauseWalkingSound(){
  soundWalking.pause();
  walkingSoundOn = false;
}
//*********************************************
void playWalkingSound(){
  if(walkingSoundOn == false && !jumping){
    // sound isn't already on
    // turn sound on
    walkingSoundOn = true;
    soundWalking.loop();
  }
}
//*********************************************
void pauseRattleSound(){
  soundRattle.pause();
  rattleSoundOn = false;
}
//*********************************************
void playRattleSound(){
  if(rattleSoundOn == false){
    // sound isn't already on
    // turn sound on
    rattleSoundOn = true;
    soundRattle.loop();
  }
}
//*********************************************
*/



