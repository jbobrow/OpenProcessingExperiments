
//Lauren Ruoff lruoff
//copyright 2014
//homework 7

/////Use the left and right arrows to move your fishie towards the food (red line worm)
/////Eat five foods within alloted time to not starve
/////Be munched five times and die

import ddf.minim.*;

Minim sounds;
AudioPlayer eat, beEaten, yipee, noo, jumping;

//float direction;
float maxySpeed;
float pFishx, pFishy, fishDiam;
float xSpeed, ySpeed;
float gravity = 1;
float direction;
float sharkx, sharky, sharkSpeed, sharkDirection, sharkDiam;
float currentTime, timeLimit, timeLeft;
int livesLeft, food, result;
float tunax, tunay, tunadx, tunady, tunaDiam;
float jellyx, jellyy, jellydy, jellyDiam;
float foodx, foody;

//////////////////////////////////////////////////////////////////////////

void setup() {

  size(600, 600);
  background(255);
  frameRate(45);
  textAlign(CENTER);

  livesLeft = 5;

  /////FISH///// 
  fishDiam = 40;
  pFishx = width/2;
  pFishy = height-fishDiam;
  maxySpeed = 3;

  //////SHARK///// 
  sharky = height*.5;
  sharkSpeed = 3;
  sharkx = 20;
  sharkDiam = 50;

  /////TUNA/////
  tunax = random(width);
  tunay = random(height);
  tunaDiam = 30;
  tunadx = 3;
  tunady = 5;

  /////JELLY///// 
  jellyx = 500;
  jellyy = height;
  jellydy = 2;
  jellyDiam = 60;

  /////FOOD/////
  food = 0;
  foodx = random(fishDiam, width-fishDiam);
  foody = random(fishDiam, height-fishDiam);

  /////SOUNDS///// 
  sounds = new Minim(this);
  beEaten = sounds.loadFile("beEaten2.wav");
  eat = sounds.loadFile("eat2.wav");
  jumping = sounds.loadFile("jump2.wav");
  yipee = sounds.loadFile("yipee.wav");
  noo = sounds.loadFile("noo.wav");

  instructions();
}

//////////////////////////////////////////////////////////////////////////

void draw() {

  if (frameCount > 1) {  
    prepareWindow();
    moveFish();
    drawFish();
    eatFood();
    shark();
    tuna();
    jelly();
    collision();
    showScoreandStats();
    endGame();
  }
}


////////////////////STARING AND INPUT///////////////////////////////////// 
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

void prepareWindow() {
  background(255);
}

//////////////////////////////////////////////////////////////////////////

void instructions() {

  fill(0);
  text("You are a hungry little fish", width/2, 150);
  text("Satiate your hunger before being eaten (look for red line worms)", width/2, 170);
  text("Use your left and right arrows to move and avoid other hungry fish", width/2, 190);
  text("Get munched five times and die", width/2, 210);
  text("Press 's' to start", width/2, 300);
  noLoop ();
}

//////////////////////////////////////////////////////////////////////////

void keyPressed() {

  if (key == 's' || key == 'S') {
    loop();
  }
  if (key == CODED) {
    if (keyCode == ENTER) {
      loop();
    }
    if (keyCode == RIGHT) {
      jump(1);
    }
    if (keyCode == LEFT) {
      jump(-1);
    }
  }
}


//////////////////////////MISTER FISH/////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

void drawFish() {

  fill(255, 0, 0);
  if (direction == 0) {
    triangle(pFishx, pFishy, pFishx-30, pFishy-20, pFishx-30, pFishy+20);
  }

  if (direction == 1) {
    triangle(pFishx, pFishy, pFishx-30, pFishy-20, pFishx-30, pFishy+20);
  }

  if (direction == -1) {
    triangle(pFishx, pFishy, pFishx+30, pFishy-20, pFishx+30, pFishy+20);
  }

  stroke(0);
  strokeWeight(1);
  fill(100, 100, 0);
  ellipse(pFishx, pFishy, fishDiam, fishDiam);
  fill(100, 100, 0);
  triangle(pFishx, pFishy+10, pFishx+5, pFishy, pFishx-5, pFishy);
}

//////////////////////////////////////////////////////////////////////////

void moveFish() {

  pFishx += xSpeed;
  pFishy += ySpeed;

  if (pFishy < height-fishDiam && ySpeed < maxySpeed) {
    ySpeed += gravity;
  }
  else {
    ySpeed = 0;
  }

  if (ySpeed == 0) {
    xSpeed = 0;
  }
}

//////////////////////////////////////////////////////////////////////////

void jump(int dir) {

  direction = dir;
  xSpeed = 3*dir;
  ySpeed = -10;
  jumping.play();
  jumping = sounds.loadFile("jump2.wav");
}


///////////////////////THE ENEMIES////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

void shark() {

  sharkx += sharkSpeed;

  if (sharkx > width) {
    sharkSpeed = -sharkSpeed;
  }

  if (sharkx < 0) {
    sharkSpeed = -sharkSpeed;
  } 

  stroke(0);
  strokeWeight(1);
  fill(0, 0, 100);
  ellipse(sharkx, sharky, sharkDiam+70, sharkDiam);

  if (sharkSpeed == 3) {
    fill(255);
    ellipse(sharkx+30, sharky, 5, 5);
  }
  else if (sharkSpeed == -3) {
    fill(255);
    ellipse(sharkx-30, sharky, 5, 5);
  }
}

//////////////////////////////////////////////////////////////////////////

void tuna() {

  tunax += tunadx;
  tunay += tunady;

  if (tunax > width) {
    tunax = 0;
    tunady = tunady*-1;
  }

  if (tunay > height) {
    tunay = 0;
    tunadx = tunadx*-1;
  }

  stroke(0);
  strokeWeight(1);
  fill(100, 100, 200);
  ellipse(tunax, tunay, 30, 30);
}

//////////////////////////////////////////////////////////////////////////

void jelly() {

  jellyy -= jellydy;

  if (jellyy < 0) {
    jellyx = random(width);
    jellyy = height;
  }

  line(jellyx-20, jellyy, jellyx-20, jellyy+35);
  line(jellyx-10, jellyy, jellyx-10, jellyy+30);
  line(jellyx, jellyy, jellyx, jellyy+30);
  line(jellyx+10, jellyy, jellyx+10, jellyy+30);
  line(jellyx+20, jellyy, jellyx+20, jellyy+35);
  fill(200, 200, 200, 200);
  stroke(0);
  ellipse(jellyx, jellyy, jellyDiam-20, jellyDiam-20);
}


/////////////////////EAT OR BE COLLIDED///////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

void collision() {

  if (pFishx+fishDiam/2 > sharkx-sharkDiam/2 && pFishx-fishDiam/2 < sharkx+sharkDiam/2 && pFishy+fishDiam/2 > sharky-sharkDiam/2 && pFishy-fishDiam/2 < sharky+sharkDiam/2) {
    pFishy = height-fishDiam;
    pFishx = width/2;
    livesLeft -=1; 
    beEaten.play();
    beEaten = sounds.loadFile("beEaten2.wav");
  }

  else if (pFishx+fishDiam/2 > tunax-tunaDiam/2 && pFishx-fishDiam/2 < tunax+tunaDiam/2 && pFishy+fishDiam/2 > tunay-tunaDiam/2 && pFishy-fishDiam/2 < tunay+tunaDiam/2) {
    pFishy = height-fishDiam;
    pFishx = width/2;
    livesLeft -=1;
    beEaten.play();
    beEaten = sounds.loadFile("beEaten2.wav");
  }

  else if (pFishx+fishDiam/2 > jellyx-jellyDiam/2 && pFishx-fishDiam/2 < jellyx+jellyDiam/2 && pFishy+fishDiam/2 > jellyy-jellyDiam/2 && pFishy-fishDiam/2 < jellyy+jellyDiam/2) {
    pFishy = height-fishDiam;
    pFishx = width/2;
    livesLeft -=1;
    beEaten.play();
    beEaten = sounds.loadFile("beEaten2.wav");
  }
}

//////////////////////////////////////////////////////////////////////////

void eatFood() {

  strokeWeight(2);
  stroke(255, 0, 0);
  line(foodx, foody, foodx+5, foody+5);

  if (pFishx+fishDiam*.5 > foodx && pFishx-fishDiam*.5 < foodx+5 && pFishy+fishDiam*.5 > foody && pFishy-fishDiam*.5 < foody+5) {
    foodx = random(fishDiam, width-fishDiam);
    foody = random(fishDiam, height-fishDiam);
    food += 1;
    maxySpeed +=1;
    fill(255, 0, 0);
    eat.play();
    eat = sounds.loadFile("eat2.wav");
  }
}


///////////////////SCORES, STATS, AND END GAME////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

void showScoreandStats() {

  stroke(0);
  fill(0);
  timeLimit = 60;

  currentTime = millis()/1000;
  timeLeft = timeLimit - currentTime;
  text("Time Remaining: "+ timeLeft + " seconds", 100, 30);
  text("Lives Left: " + livesLeft, width-70, 30);
  text("Worms Eaten: " + food, width/2, 30);

  noFill();
  rect(360, 17, 50, 17);
  
  if (food >= 1) {
    rectMode(CORNER);
    fill(255, 0, 0);
    rect(360, 17, food*10, 17);
  }
}  


////////////////////////////////////////////////////////////////////////////

void results() {
  
  stroke(0);
  fill(0); 
  
  result = food + livesLeft; 
  text("Final score: " + result, width/2, height/2+40);
  if (result == 10) {
    text("Big fish in small pond eh?", width/2, height/2+60);
  }

  if (result == 9) {
    text("Working your way up the food chain", width/2, height/2+60);
  }

  if (result == 8) {
    text("Good eats", width/2, height/2+60);
  }

  if (result == 7) {
    text("Mighty fine worms today", width/2, height/2+60);
  }

  if (result == 6) {
    text("Mmmmm", width/2, height/2+60);
  }

  if (result == 5) {
    text("just ok", width/2, height/2+60);
  }

  if (result == 4) {
    text("woke up on the wrong side of the rock eh?", width/2, height/2+60);
  }

  if (result < 3) {
    text("better luck being chum", width/2, height/2+60);
  }
}
////////////////////////////////////////////////////////////////////////////

void endGame() {
 
  if (timeLeft == 0) {

    background(255);
    showScoreandStats();
    stroke(0);
    fill(0);
    text("Sooo...hungry....auhhhh (death)", width/2, height/2);
    text("YOU LOSE", width/2, height/2+20);
    results();
    noo.play();
    noo = sounds.loadFile("noo.wav");
    noLoop();
  }

  if (livesLeft == 0) {

    background(255);
    showScoreandStats(); 
    stroke(0); 
    fill(0);
    text("Mmmmmm....munch munch", width/2, height/2);
    text("YOU LOSE", width/2, height/2+20);
    results();
    noo.play();
    noo = sounds.loadFile("noo.wav");
    noLoop();
  }

  if (food == 5) {
    background(255);
    showScoreandStats();
    stroke(0);
    fill(0);
    text("DELISH!", width/2, height/2);
    text("NOT STARVING = WIN!", width/2, height/2+20);
    results();
    yipee.play();
    yipee = sounds.loadFile("yipee.wav");
    noLoop( );
  }
}



