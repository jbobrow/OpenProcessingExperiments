
//Note : any functions listed here instead of within the draw function does not loop
PImage bg;

//Color Data
color Green = color(124, 252, 0);
color Blue = color(0, 0, 255);
color Orange = color(255, 140, 0);
color Red = color(255, 0, 0);
color Cyan = color(0, 255, 255);
//Ball Data
float vectorX = 1;
float vectorY = 1;
float BallPosY = 474;
float BallPosX = 250;
float dia = 10;
//Dynamic Speed Data
float speed = 1;
int colCounter = 0;
//Mouse Click Trigger
int ClickCounter = 0;


void setup() {
  size(500, 500);
  frameRate(60);
  smooth();
  PFont font;
  font = loadFont("Impact-48.vlw");
  textFont (font);
  textSize(32);
  bg = loadImage("Breakout Background Img.png");
}

void draw() {
  background(bg);
  //Paddle Data
  float PaddlePosX = mouseX - 40;
  float PaddleLeftEnd = mouseX + 40; 
  float PaddleRightEnd = mouseX - 40;
  float PaddleCenterLeft = mouseX + 5;
  float PaddleCenterRight = mouseX - 5;
  float PaddleCenter = mouseX;
  int PaddlePosY = 480;
  int PaddleWidth = 80;
  int PaddleHeight = 10;
  //Draw Paddle
  strokeWeight(2);
  stroke(Orange); 
  fill (Blue);
  rect(PaddlePosX, PaddlePosY, PaddleWidth, PaddleHeight, 5);
  //Draw Ball
  strokeWeight(1);
  stroke(0);
  fill (Green);
  ellipse(BallPosX, BallPosY, dia, dia);
  //Mouse Click Trigger
    if (mousePressed == true) {
      ClickCounter = 1;
    }  
  //Click to Start Text
    if (ClickCounter == 0) {
      textAlign(CENTER);
      fill (Red);
      text("CLICK TO START" , 0, 200, 500, 500);
    } 
  //Move Ball 
    if (ClickCounter == 1) {
      BallPosX = BallPosX - 1 * vectorX * speed; 
      BallPosY = BallPosY - 1 * vectorY * speed;
      //Angled ball launch to prevent player from taking advantage of PaddleCenter collision
      } else {
      BallPosX = mouseX;
    }
  //Wall Collision
    if (BallPosY <= 0 + dia/2) {
      vectorY = vectorY * -1;
    }
    if (BallPosX >= width - dia/2 || BallPosX <= 0 + dia/2) {
      vectorX = vectorX * -1;
    }
  //Paddle Collision  
    if (BallPosY == PaddlePosY - dia/2 && BallPosX <= PaddleLeftEnd && BallPosX > PaddleCenterLeft) {
      //Bounces more horizontally
      vectorY = vectorY * -1;
      vectorX = vectorX * 1.2;
      //Collision counter for paddle
      colCounter++;
    }
    if (BallPosY == PaddlePosY - dia/2 && BallPosX < PaddleCenterLeft && BallPosX > PaddleCenterRight) {
      //Bounces more vertically
      vectorY = vectorY * -1.1;
      vectorX = vectorX * 0.3;
      //Collision counter for paddle
      colCounter++;
    }
    if (BallPosY == PaddlePosY - dia/2 && BallPosX < PaddleCenterRight && BallPosX >= PaddleRightEnd) {
      //Bounces more horizontally
      vectorY = vectorY * -1;
      vectorX = vectorX * 1.2;
    //Collision counter for paddle
      colCounter++;
    }
  //Speed increases after 3 consecutive paddle hits and counter resets to 0
  if (colCounter == 3) {
    speed++;
    colCounter = 0;
  }
  //If the ball falls out of window, game over
  if (BallPosY > height) { 
    ClickCounter = 2;
  }
  if (ClickCounter == 2) {
    //Game Over, Click to restart text
    textAlign(CENTER);
    fill (Cyan);
    text("GAME OVER" , 0, 200, 500, 500);
    text("CLICK TO RESTART" , 0, 240, 500, 500);
    //Ball resets
    BallPosX = mouseX;
    BallPosY = 474;
    //Speed and colCounter resets
    speed = 1;
    colCounter = 0;
    vectorY = 1;
  }
  if (ClickCounter == 2 && mousePressed == true) {
    ClickCounter = 1;
  }
}


