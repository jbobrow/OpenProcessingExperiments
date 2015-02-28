
PImage img;
PImage ball;
PImage cloud;
PImage cloud2;
PImage cloud3;

int timeCount;

float cloudx;
float cloud2x;
float cloud3x;

import ddf.minim.*;
Minim minim;
Minim minim2;
Minim minim3;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
int numBlocks = 500;
int PFont;
int gameState; //0 = pre game, 1 = in game, 2 = game over
float ballPosX;
float ballPosY;
float ballSpeed[] = new float[numBlocks];

float blockPos[] = new float[numBlocks];
float heightBlocks[] = new float[numBlocks];
float gravity = 1;
float ballSize = 20;
int blockWidth = 10;
int blockHeight = 10;
int xSpeed;
int ySpeed;
float blockSpeed = 2.5;


int groundHeight = 20;

boolean gameON = false;


void setup() {
  size(750, 600);
  background(img = loadImage("background.jpg"));
  ball = loadImage("ball.png");

  cloudx=width-20;
  cloud2x=width-50;
  cloud3x=width-30;
  gameState = 0;


  //fill block positions and the height of blocks
  for (int i = 0; i < numBlocks; i++) {
    heightBlocks[i] = 15;


    //if i = 0, add random block position
    blockPos[i] = random(200, 80);


    //for all other blocks, position = random amount + position of previous block 
    if (i > 0) {
      blockPos[i] = blockPos[i - 1] + int(random(50, 120));
    }
  }
  minim = new Minim(this);
  player = minim.loadFile("backgroundmusic.mp3");
  minim2 = new Minim(this);
  player2 = minim2.loadFile("jump.mp3");
  minim3 = new Minim(this);
  player3 = minim3.loadFile("gameover.mp3");
  player.play();
}

void draw() {
  //  image (cloud, random(100, 400), random(100,400));



  noStroke();
  { 
    fill(0, 0, 255);
    rect(0, height - 20, width, 20);
  }

  //if express the keybord, add speed to block positons
  if (gameState == 0) {
    background(0);
    PFont font;


    text(" PLEASE PRESS  'B'  TO START GAME!", 20, 250);
    textSize(40);
    if (keyPressed && key== 'b') {
      gameState = 1;
    }
  }
  if (gameState == 1) {
    image(img, 0, 0);
    text("SCORE:"+ timeCount, 280, 30);
    timeCount+=1; 

    cloud();
    cloud2();
    cloud3();
    jump();

    //
    //    ellipse(ballPosX, ballPosY, ballSize, ballSize);
    ballPosY += ySpeed;
    ySpeed += gravity;


    //check if ball on ground
    if (ballPosY > height - ballSize/2 - groundHeight) {
      ballPosY = height - ballSize/2 - groundHeight;
      ySpeed = 0;
      gravity = 0;
    }



    if (keyPressed) {
      gameON = true;
    }

    if (gameON) {
      for (int i = 0; i < numBlocks; i++) {
        blockPos[i] -= blockSpeed;
      }
    }


    fill(15, 126, 21);
    //draw all blocks
    for (int i = 0; i < numBlocks; i++) {
      rect(blockPos[i], height - groundHeight - heightBlocks[i], blockWidth, heightBlocks[i]);
      //ground under blocks
      rect(0, height - groundHeight, width, groundHeight);
    }

    //check for collision with blocks

    for (int i = 0; i < numBlocks; i++) {

      //          if (ballPosX > blockPos[i] - ball.width) {
      //        blockSpeed = 0;
      //        fill(0);
      //      
        //println(ballPosY);
        if (ballPosX > blockPos[i] - ball.width && ballPosY > height - 35 - ball.height+49 && ballPosX < blockPos[i] + blockWidth) {
          println(ball.height + " " + ballPosY + " hit!");
          
          //          fill(255, 0, 0);
          //          ellipse(width/2, height/2, 200, 200);
          gameState = 2;
          //player.stop();
        }
    }
  }
  else if (gameState == 2) {
    minim.stop();
    player3.play();
    background(0);
    PFont font;
    //    font = loadFont("LetterGothicStd-32.vlw");
    //    textFont(font, 32);
    text(" GAME OVER!", 210, 250);
    textSize(50);


    //      if (ballPosY > height - 20 - blockHeight - ball.height){
    //        blockSpeed = 0;
    //        fill(0);
    //      }
  }


  if (keyPressed) {
    if (key ==CODED) {
      if (keyCode == UP) {
        if (ballPosY > height - groundHeight - 20) {
          player2.play();
          player2.rewind();
          ySpeed = -20;
          gravity = 1;
        }
      }
      if (keyCode == RIGHT) {
        ballPosX += 4;
      }
      if (keyCode == LEFT) {
        ballPosX -= 4;
      }
    }
  }
}
void cloud() {
  PImage cloud=loadImage("cloud.png");
  image(cloud, cloudx, 30);
  if (cloudx<0) {
    cloudx=width;
  }
  else {
    cloudx=cloudx-0.3;
  }
}

void cloud2() {
  PImage cloud2=loadImage("cloud2.png");
  image(cloud2, cloud2x, 170);
  if (cloud2x<0) {
    cloud2x=width;
  }
  else {
    cloud2x=cloud2x-0.7;
  }
}

void cloud3() {
  PImage cloud3=loadImage("cloud3.png");
  image(cloud3, cloud3x, 130);
  if (cloud3x<0) {
    cloud3x=width;
  }
  else {
    cloud3x=cloud3x-0.5;
  }
}

void jump() {
  image (ball, ballPosX, ballPosY-49);
  //  imageMode (CENTER);
}
