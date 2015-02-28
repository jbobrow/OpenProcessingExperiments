
//Dan Sztanga
//dan.sztanga@gmail.com
//(C) 2012. Pittsburgh, PA. All Rights Reserved.
//HW7_A Game
//
//Keep the Ball Up!
//Drag the mouse to hit the bottokm of the ball.

int count, gameTime, time, gamePhase, mouseBtn;
float ballDiam, xBall, yBall, yDelta, xDelta, gravity;
color ballColor;

void setup(){
  smooth();
  noCursor();
  size(800, 500);
  background(255);
  textAlign(CENTER);
  count = 0;
  //sets time to 30 seconds
  gameTime = 30000;
  gamePhase = 0;
  ballColor = color(0);
  ballDiam = width*.075;
  xBall = width/2;
  yBall = 0+ballDiam;
  xDelta = 0;
  yDelta = 5;
  //acceleration due to "gravity"
  gravity = .3;
}

void draw(){
    background(255);
    ballCursor();
  if (gamePhase == 0){
    showInstructions( );
  }
  else if (gamePhase == 1){
     playGame( );
  }
  else if (gamePhase == 2){
    gameOver( );
  }
}

void showInstructions(){
  fill(0);
  textSize(24);
  text("keep the ball up!", width/2, 50);
  textSize(16);
  text("drag the mouse to hit the bottom of the ball", width/2, 400);
  text("press any key to start", width/2, 450);
}

void playGame(){
  timer();
  ball();
  score();
}

void gameOver(){
  fill(0);
  textSize(24);
  text("game over!", width/2, 50);
  textSize(16);
  text(count, width/2, 100);
  text("press any key to restart", width/2, 400);
}

//counts down from 30
void timer(){
  fill(0);
  time = gameTime/1000-millis()/1000;
  text("time_ " + time, 750, 50);
  if (gameTime/1000-millis()/1000 < 0){
     gamePhase = 2;
  } 
}

void ball(){
  //returns ball size and color to default
  if (yDelta > 0){
    ballColor = color(0);
    ballDiam = width*.075;
  }
  fill(ballColor);
  ellipse(xBall, yBall, ballDiam, ballDiam);
  xBall = xBall+xDelta;
  //"gravity" effect
  //simulates acceleration
  yDelta = yDelta+gravity;
  yBall = yBall+yDelta;
  //sets bounce limit to edge of window
  if (yBall < 0){
    yDelta = -yDelta;
  }
  if (yBall+ballDiam/2 > height){
    gamePhase = 2;
    xBall = width/2;
    yBall = 0+ballDiam;
    xDelta = 0;
    yDelta = 5;
  }
  if (xBall+ballDiam/2 > width){
    xDelta = - xDelta;
  }
  if (xBall-ballDiam/2 < 0){
    xDelta = - xDelta;
  }
}

void ballCursor(){
  noStroke();
  fill(225);
  ellipse(mouseX, mouseY, 20, 20);
  fill(200);
  ellipse(mouseX, mouseY, 10, 10);
}

void score(){
  fill(0);
  text("score_ "+count, 50, 50);
}

void keyPressed (){
 if (gamePhase == 0){
   gamePhase = 1;
 }
 if (gamePhase == 2){
   gamePhase = 1;
   count = 0;
   gameTime = millis()+30000;
 }
}

//test for successful hit
void mousePressed(){
  if (dist(mouseX, mouseY, xBall, yBall) < ballDiam/2){
    //changes ball color and size to alert player of successful hit
    ballColor = color(255,0,0,100);
    ballDiam = width*.1;
    count++;
    //shoots ball up after hit
    yDelta = -12;
    //sends ball to the left of right depending on where the cursor was
    //relative to the center of the ball
    if (mouseX < xBall){
      xDelta = 2;
    }
    else if (mouseX > xBall){
      xDelta = -2;
    }
  }
}

