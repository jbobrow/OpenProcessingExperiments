
//Copyright Eric Mackie. October 2011. Pittsburgh PA
//Jim Roberts' Programming in the Arts with Processing (60-257)
//IMPORTANT: The images of a Snowspeeder, Probe Droid, planet Hoth, and all other Star Wars-related images are not mine; They are creations from Star Wars (George Lucas) and I do not own the rights to them.
//Photo credit to multiple Star Wars-affiliated sources and Ralph McQuarrie
float xPos;
float yPos;
float xSpeed;
float ySpeed;
float sChange;
float swDiam;
float pDiam;
float probeX;
float probeY;
float probeXV;
float probeYV;
float probeX2;
float probeY2;
float probeXV2;
float probeYV2;
int colCounter;
boolean score;
int lives;
int intLives;
int currentMillis;
int lostMillis;
PImage droid;
PImage snowSpeeder;
PImage hoth;
PImage crash;
PImage fled;
//int game;

void setup( ) {
  //=============GAME BASIC SETUP=============
  size( 400, 400 );
  //game = 0;
  fill( 0 );
  textAlign( CENTER, CENTER);
  rectMode(CENTER);
  //============STARTING SPEEDER POSITION, SPEED, and SIZE========
  xPos=width/2;
  xSpeed=0;
  yPos=height/2;
  ySpeed=0;
  sChange=.15;
  swDiam = 60;
  //============STARTING DROID POSITION,SPEED, and SIZE==========
  pDiam=40;
  probeX= random(20, 40);
  probeY= random(20, 40);
  probeXV=random(-10, 10);
  probeYV=random(-10, 10);
  probeX2= random(20, 40);
  probeY2= random(20, 40);
  probeXV2=random(-10, 10);
  probeYV2=random(-10, 10);
  //===============GAME MODIFIERS===============
  colCounter=0;
  lives=5;
  intLives =5;
  score = false;
  int currentMillis = 0;
  imageMode( CENTER );
  //===================IMAGES LOAD================
  droid = loadImage("droid.png");
  snowSpeeder = loadImage("snowspeeder.png");
  hoth = loadImage("hoth backdrop.jpg");
  crash = loadImage("crash.png");
  fled = loadImage("fled.png");
}

void draw( ) {
  //if (game == 0) {
  image(hoth, width/2, height/2);
  //background(255);
  probeDroid();
  secondProbeDroid();
  skyWalker();
  returnWarning();
  speederReset();
  setSpeed();
  showInfo();
  collision();
  flee();
  gameOver();
  theScore();
  //resetGame();
  //}
}



void skyWalker() { 
  pushMatrix();
  xPos=xPos+xSpeed;
  yPos=yPos+ySpeed;
  float a = atan2(probeY - yPos, probeX - xPos);
  translate(xPos, yPos);
  rotate(a);
  //rect(0, 0, 30, 30);
  image(snowSpeeder, 0, 0, swDiam, swDiam);
  popMatrix();
}




void setSpeed() {

  if (keyPressed) {
    if (keyCode==RIGHT) {
      xSpeed = xSpeed + sChange;
    }
    if (keyCode==LEFT) {
      xSpeed = xSpeed - sChange;
    }
    if (keyCode==UP) {
      ySpeed=ySpeed - sChange;
    }
    if (keyCode==DOWN) {
      ySpeed=ySpeed + sChange;
    }
  }
}





void speederReset() {
  if (keyPressed) {
    if (key==32) {
      xPos=width/2;
      xSpeed=0;
      yPos=height/2;
      ySpeed=0;
    }
  }
}





void returnWarning() {
  pushMatrix();
  if ((xPos-15>width) || (xPos+15<0)||
    (yPos-15>height) || (yPos+15<0)) {
    if ((millis()/500)%2<1) {
      fill(255, 0, 0);
      stroke(255, 255, 0);
      strokeWeight(1);
    }
    else {
      fill(255, 255, 0);
      stroke(255, 0, 0);
      strokeWeight(1);
    }
    textSize(17);
    text("RETURN TO THE BATTLEFIELD!", width/2, height/2);
    textSize(12);
    text("Distance: " + int(dist(width/2, height/2, xPos, yPos)), width/2, height/2+20);
    line(width/2, height/2, xPos, yPos);
    lostMillis = millis();
  }
  popMatrix();
}




void flee() {
  if (dist(width/2, height/2, xPos, yPos) >= 3500) {
    image (fled, width/2, height/2);
    //rect(width/2, height/2, width, height);
    fill(0);
    textSize(40);
    text("YOU HAVE FLED,", width/2, height/10);
    text("COWARD!", width/2, 9*height/10);
  }
}





void probeDroid () {
  probeX=probeX+probeXV;
  probeY=probeY+probeYV;
  image (droid, probeX, probeY, pDiam, pDiam);
  if ((probeX>=width-10)||(probeX<=10)) {
    probeXV = -1*probeXV;
  }
  if ((probeY>=height-10)||(probeY<=10)) {
    probeYV = -1*probeYV;
  }
}





void secondProbeDroid(){
  if (millis()>=5000) {
    probeX2=probeX2+probeXV2;
    probeY2=probeY2+probeYV2;
    image (droid, probeX2, probeY2, pDiam, pDiam);
    if ((probeX2>=width-10)||(probeX2<=10)) {
      probeXV2 = -1*probeXV2;
    }
    if ((probeY2>=height-10)||(probeY2<=10)) {
      probeYV2 = -1*probeYV2;
    }
  }
}







void showInfo () {
  fill(0);
  textSize(10);
  text ("Hor. Speed is " + int (xSpeed) + " km/h", width/2, 10);
  text ("Ver. Speed is " + int (ySpeed) + " km/h", width/2, 23);
  text ("Collisions " + colCounter, width/2, 36);
  text ("Seconds " +int (millis()/1000), width/2, 49);
  textSize(15);
  text ("LIVES LEFT: " +lives, 5*width/6, 20);
}







void collision() {

  if ((dist(xPos, yPos, probeX, probeY)<=(swDiam/2+pDiam/2)) ||
    (dist(xPos, yPos, probeX2, probeY2)<=(swDiam/2+pDiam/2))) {
    fill(255, 0, 0);
    rect(width/2, height/2, width, height);
    fill(random(150, 255), random(200, 255), 20);
    triangle(random(0, width), random(0, height), random(0, width), random(0, height), random(0, width), random(0, height));
    xPos=width/2;
    xSpeed=0;
    yPos=height/2;
    ySpeed=0;
    probeX= random(20, 40);
    probeY= random(20, 40);
    probeXV=random(-5, 5);
    probeYV=random(-5, 5);
    probeX2= random(20, 40);
    probeY2= random(20, 40);
    probeXV2=random(-5, 5);
    probeYV2=random(-5, 5);
    colCounter=colCounter+1;
    lives=lives-1;
  }
}






void gameOver() {
  if (colCounter >= intLives) {
    image (crash, width/2, height/2);
    //rect(width/2, height/2, width, height);
    fill(0);
    textSize(40);
    text("GAME OVER", width/2, height/15);
  }
}






void theScore() {
  if (colCounter >= intLives) {
    //game=1;
    if (score==false) {
      currentMillis = millis()-lostMillis;
      score = true;
    }
    fill(0);
    textSize(30);
    text("Your Score was " + currentMillis, width/2, 9*height/10);
    //resetGame();
  }
}





//void resetGame() {
//  if (game==1) {
//    if (keyPressed) {
//      if (key==32) {
//        game=0;
//      }
//    }
//  }
//}


