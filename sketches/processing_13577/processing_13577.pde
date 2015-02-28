
float paddlex = 100;
float paddley = 750;
float paddlew = 100;
float paddleh = 30;

float balla = 1;
float ballb = 1;
float ballaSpeed = random (2,4);
float ballbSpeed = random (2,4);
int ballRadius = 20;

PImage hummer;
int hummerX = 500;
int hummerY = 50;
int hummerXSpeed = 3;


PImage hummerExplode;
/*int hummerExplodeX = 500;
 int hummerExplodeY = 50;
 int hummerExplodeXSpeed = 3;*/


PImage hummerFire;
/*int hummerFireX = 500;
 int hummerFireY = 50;
 int hummerFireXSpeed = 3;*/


int hummerNormal = 0;
int hummerSmoke = 1;
int hummerFlames = 2;
int gameOver = 3;
int hummerState = hummerNormal++;

import ddf.minim.*;
Minim minim;
AudioPlayer groove;




void setup() {
  size (600, 800);
  smooth();
  hummer = loadImage ("hummer.png");
  hummerExplode = loadImage ("hummerExplode.png");
  hummerFire = loadImage ("hummerFire.png");

  minim = new Minim(this);
  groove = minim.loadFile("8-bit2.wav");
  groove.loop();
}

void draw () {
  background (0);
  fill (0, 255,0);
  rectMode(CENTER);
  fill(150);

  drawHummer();
  drawPaddle();
  drawBall();



  if (checkIfCollision()) {
    //print ("collide");
    ballbSpeed *= -1;
    ballaSpeed *= -1;
  }

  if (checkIfCarCollision()) {
    print ("crash");
    println(hummerFire.height);
    hummerState++;

    if (hummerState == hummerSmoke) {
      hummer = hummerExplode;
    }
    else if (hummerState == hummerFlames) {
      hummer = hummerFire;
    }
    if (hummerState == gameOver) {
      background (255);
      //balla= paddlex - (paddlew/2);
      //ballb= paddley - (paddleh/2);
      // if (keyPressed == true) {
      //loop();
    }
  }
}




//draw paddle
void drawPaddle() {
  paddlex= mouseX;
  paddlex = constrain (paddlex, 0, width);
  rect (paddlex, paddley, paddlew, paddleh);
}

//create ball
void drawBall() {
  fill (255);
  noStroke();
  ellipseMode(CENTER); 

  balla = balla + ballaSpeed;
  ballb = ballb + ballbSpeed;
  balla = constrain (balla, 0+(ballRadius/2), width-(ballRadius/2));
  ballb = constrain (ballb, 0, height-(ballRadius/2));

  if(balla >= width-(ballRadius/2)) {
    ballaSpeed *= -1;
  }

  if (balla <= 0 + (ballRadius/2)) {
    ballaSpeed *= -1;
  }

  if ( ballb <= 0) {
    ballbSpeed *= -1;
  }

  if ((ballb >= height) && (ballb > ballb-paddley)) { 
    ballb = constrain (ballb, 1, 1);
  }

  ellipse (balla, ballb, ballRadius, ballRadius);
}


//check if collision ball and paddle
boolean checkIfCollision () { 
  if ((ballb + (ballRadius/2) >= (paddley-(paddleh/2)) ) && (balla <= (paddlex + paddlew/2)) ) {
    return true;
  }
  else {
    return false;
  }
}


//hummer
void drawHummer() {
  imageMode(CENTER);
  hummerX = hummerX - hummerXSpeed;
  image (hummer, hummerX, hummerY);

  if (hummerX <= -100) { //if hummer drives off, return from other side close to bottom
    hummerX = width - hummerXSpeed;
    hummerY = hummerY + 20;
  }
}

//check if collision ball and hummer
boolean checkIfCarCollision () { 
  if ((ballb +-(ballRadius/2)  <= hummerY + (hummer.height)) && (balla +- (ballRadius/2)  >= hummerX - (hummer.width))) {
    //if ((balla + (ballRadius/2) >= (hummerX+hummer.width)) && (balla<=hummerX-hummer.width) && (ballb + (ballRadius/2) <= hummerY + hummer.height)) {
    return true;
  }
  else {
    return false;
  }
}

/*check if collision ball and hummerexplode
 boolean checkIfCarCollisionExplode () { 
 if ((ballb +-(ballRadius/2)  <= hummerExplodeY + (hummerExplode.height)) && (balla +- (ballRadius/2)  >= hummerExplodeX + (hummerExplode.width))) {
 return true;
 }
 else {
 return false;
 }
 }
 
 //check if collision ball and hummerexplode
 boolean checkIfCarCollisionFire () { 
 
 
 if ((ballb +-(ballRadius/2)  <= hummerFireY + (hummerFire.height)) && (balla +- (ballRadius/2)  >= hummerFireX + (hummerFire.width))) {
 return true;
 }
 else {
 return false;
 }
 }
 
 */

