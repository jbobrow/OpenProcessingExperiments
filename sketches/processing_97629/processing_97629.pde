
// Homework 7, 02-10-13
// Xinran Lu, xinranl@andrew.cmu.edu
// Copyright Xinran Lu Febuary 2013 Pittsburgh PA 15232

//Use LEFT and RIGHT keys to control the car.
//Aim for the middle of the rings to go through. Miss 3 times then gameover.
//Try to be as precise as possible. Game gets harder over time.
//Use the mouse to catch the floating UFO for bonus points.

int countHit, countMiss, countBonus; //keep track of scores
int startTime, endTime; //game time
int gamePhase;
int gameTime;
int ringStartTime, ringTotalTime, ringDisplayTime; //ring time
float od; //check if ring is positioned in the middle, changes to get the game harder over time
float x, xring, y, r, rw; //ring variables
float xBonus, yBonus, v, angle; //ufo variables
float growSpeed, moveSpeed; //ring come near effect
float cloudX, cloudY; //cloud wrap effect
float laneY, laneW, laneH; //road wrap effect
PImage instructions, car, gameover; //background images

void setup()
{
  size(400, 400);
  smooth();
  countHit = countMiss = countBonus = 0;
  x = 200;
  xring = random(50, 350);
  y = 150;
  r = 10;
  rw = .5;
  xBonus = yBonus = random(100, 200);
  growSpeed = .5;
  moveSpeed = .1;
  v = 2;
  angle = .5;
  cloudX = cloudY = 100;
  laneY = 200;
  laneW = 0;
  laneH = 0;
  instructions = loadImage("001.jpg");
  car = loadImage("000.png");
  gameover = loadImage("002.jpg");
  gamePhase = 0;
  gameTime = 30000;
  od = 80;
  ringDisplayTime = 7000;
}

void draw()
{
  background(255);
   if ( gamePhase == 0 )
  {
    showInstructions();
  }
  else if ( gamePhase == 1 )
  {
    playGame();
  }
  else 
  {
    score();
  }
  
}

//gamePhase = 0
void showInstructions()
{
  image(instructions, 0, 0);
  fill(255);
  textSize(12);
  text("Use LEFT and RIGHT keys to control the car.", 20, 20);
  text("Aim for the middle of the rings to go through. Miss 3 times then gameover.", 20, 35);
  text("Use the mouse to catch the floating UFO for bonus points.", 20, 50);
  text("Press SPACE to play", width/2, 350);
}

//gamePhase = 1
void playGame(){
  road();
  checkHit();
  bonus();
  cloudOne();
  cloudTwo();
  ring(xring, y, r, growSpeed);
  movementBonus();
  mouseTarget();
  checkMouseHit();
  image(car, 0, 0);
  showScore();
  fill(200);
  text(millis()/1000, 20, 20); //display how long a player has been playing
  gameOver();
}


//start game, move car
void keyPressed()
{
  if (key == ' ') {
    if (gamePhase == 0)
    {
      gamePhase = 1;
      startTime = millis();
    }
  }
  
   if(key == CODED){
    if (keyCode == LEFT){
    x = x + 5;
    xring = xring + 5;
    // road();
    // ring(x, y, r);
  }
    else if (keyCode == RIGHT){
      x = x - 5;
      xring = xring - 5;
      // road();
      // ring(x, y, r);
    }
  }  
}

// display player's current scores
void showScore( )
{
    fill( 255 );
    text( "Hits " + countHit, width-80, height-70); 
    text( "Miss " + countMiss, width-80, height-50);
    text( "Bonus " + countBonus, width-80, height-30);
}

// check if car went through ring
void checkHit()
{
  float d = dist(200, 180, xring, y); 

    if( r == 400 && d < od){
      countHit++;
      fill(0, 255, 0);
      //rect(0, 0, width, height);
      ellipse(xring, y, r, r);
      //ringStartTime = 0;
    }
    else if ( r == 400 && d > od)
    {
      countMiss++;
      fill(255, 0, 0);
      ellipse(xring, y, r, r);
    }
}

// draw ring
void ring(float ringX, float ringY, float ringR, float growSpeed)
{
 // noStroke();
  //fill(200, 0, 0);
  //ellipse(x, y, r*1.3, r*1.3);
  //fill(255);
//  xring = random(50, 350);
//  y = 180;
//  r = 10;
//  rw = .5;
//  growSpeed = .5;
//  moveSpeed = .1;
//  
  ringTotalTime = millis() - ringStartTime;
    if ( ringTotalTime > ringDisplayTime){
      xring = random(50, 350);
      x = 200;
      y = 180;
      r = 10;
      rw = .5;
      growSpeed = .5;
      moveSpeed = .1;
      ringStartTime = millis();
    }
  
  stroke(200, 0, 0, 100);
  strokeWeight(rw);
  noFill();
  ellipse(xring, y, r, r);
  growSpeed ++;
  r = r + growSpeed;
  y = y + moveSpeed;
  rw = rw + moveSpeed;
  
  if ((millis()-startTime) > gameTime + 30000)
  {
    //od = 2;
    growSpeed = .1;
    moveSpeed = .4;
  }
  else if((millis()-startTime) > gameTime)
  { 
    //od = 20;
    growSpeed = .3;
    moveSpeed = .2;
  }
 
}

//draw ufo
void bonus()
{
  noStroke();
  fill(150);
  ellipse(xBonus, yBonus, 20, 15);
  fill(150);
  ellipse(xBonus, yBonus+7, 30, 5);
  ellipse(xBonus, yBonus+7, 5, 10);
  ellipse(xBonus-5, yBonus+7, 5, 10);
  ellipse(xBonus+5, yBonus+7, 5, 10);
}

//ufo bounce effect
void movementBonus()
{
  xBonus += v;
  yBonus += v*angle;
  if(xBonus > width-5 || xBonus < 5 || yBonus < 80 || yBonus > 260)
  {
    v = -v;
    angle = random (-.9, .9);
  }
}

//draw mouse target
void mouseTarget()
{
  noFill();
  strokeWeight(1);
  stroke(0);
  ellipse(mouseX, mouseY, 30, 30);
  line(mouseX-15, mouseY, mouseX+15, mouseY);
  line(mouseX, mouseY-15, mouseX, mouseY+15);
}

//if mouse hit ufo
void checkMouseHit()
{
  float distBonus = dist( mouseX, mouseY, xBonus, yBonus);
  if(distBonus < 10)
  {
    countBonus++;
    noStroke();
    fill(50, 220, 0, 150);
    ellipse(mouseX, mouseY, 50, 50);  
    v = v + .5; 
  }
}

//draw road
void road()
{
  noStroke();
  rectMode(CORNER);
  fill(28, 180, 203, 200);
  rect(0, 0, 400, 400);
  fill(100, 160, 15);
  rect(-200, 200, 800, 200);
  fill(200);
  quad(x, 200, x, 200, x+600, 400, x-600, 400);
  fill(255);
  quad(x, 200, x, 200, x+40, 400, x-40, 400);
  fill(200);
  rectMode(CENTER);
  rect(x, laneY, laneW, laneH);
  laneY++;
  laneH += .5;
  laneW += 1.5;
  if(laneY > 300)
  {
    laneY = 200;
    laneH = 0;
    laneW = 0;
  }
}

//draw clouds
void cloudOne()
{
  fill(255);
  ellipse(cloudX, cloudY, 30, 30);
  ellipse(cloudX+20, cloudY, 50, 50);
  ellipse(cloudX+40, cloudY, 20, 20);
  
  cloudX = cloudX + .1;
  if(cloudX > width+50)
  {
    cloudX = -50;
  }
}

void cloudTwo()
{
  fill(255);
  ellipse(cloudX-120, cloudY+50, 30, 30);
  ellipse(cloudX-90, cloudY+50, 40, 40);
  ellipse(cloudX-70, cloudY+50, 20, 20);
 
  cloudX = cloudX + .5;
  if(cloudX > width+50)
  {
   cloudX = -50;
  } 
}

//void restart()
//{
//  if(gamePhase == 2)
//  {
//    if(mouseX > 150 && mouseX < 180 && mouseY > 320 && mouseY < 350 && mousePressed == true)
//    {
//      gamePhase = 1;
//    }
//  }
//}

//gamePhase = 2
void gameOver()
{
  if ( countMiss > 2 )
  {
     gamePhase = 2;
  } 
}

void score()
{
  image(gameover, 0, 0);
  fill (255);
  text("Your score: " + countHit*1000 + countBonus*100, width/2-60, 300);
  //rect(width/2-50, 320, 30, 30);
}

