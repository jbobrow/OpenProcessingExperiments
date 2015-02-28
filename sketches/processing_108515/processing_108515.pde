
//Alex Lee, asl1@andrew.cmu.edu, 60-257, HW3
//Copyright Alex Lee 2013, Pittsburgh PA

import java.awt.geom.*;

//wolf and little red riding hood
float enemyX; 
float enemyY;
float enemyVelX;
float enemyVelY;
float enemyVelChange = .002;
int enemySize = 35;

float playerX;
float playerY;
float playerVelX;
float playerVelY;
float playerVelChange = .006;
int playerSize = 15;

//text: THE FOREST
//wolf is black? 

color playerColor = #F01616;
color enemyColor = #1A0202;
color backgroundColor = #FFF7F7;
color borderColor = #1A0202;
color collisionColor = playerColor;

int borderSize = 30;

String textContent = "The Forest";
PFont textsFont;
int textSize = 48;
color textColor = borderColor;


void setup() {
  size(400, 400);
  frameRate(30);
  noStroke();
  enemyX = width - borderSize - enemySize;
  enemyY = borderSize;
  enemyVelX = 0;
  enemyVelY = 0;
  playerX = width/2 - playerSize/2;
  playerY = height/2 - playerSize/2;
  playerVelX = 0;
  playerVelY = 0;
  textsFont = loadFont("Cambria-Bold-48.vlw");  //createFont("Cambria", textSize, true);
}


void draw() {
  refreshScreen();
  drawPlayer();
  drawEnemy();
  checkCollision();
}


void refreshScreen() {
  background(borderColor);
  fill(backgroundColor);
  rect(borderSize, borderSize, width - borderSize*2, height - borderSize*2);
  //drawTitle();
}

void drawTitle() {
  fill(textColor);
  textAlign(CENTER);
  textFont(textsFont, textSize);
  text(textContent, width/2, height/2 + 14);
}

void drawPlayer() {
  playerVelX += (mouseX - playerX) * playerVelChange;
  playerVelY += (mouseY - playerY) * playerVelChange;
  
  playerX += playerVelX;
  playerY += playerVelY;
  
  if(playerX > (width - borderSize - playerSize)) {
    playerX = width - borderSize - playerSize;
  }
  else if(playerX < borderSize) {
    playerX = borderSize;
  }
  if(playerY > (height - borderSize - playerSize)) {
    playerY = height - borderSize - playerSize;
  }
  else if(playerY < borderSize) {
    playerY = borderSize;
  }
  
  fill(playerColor);
  rect(playerX, playerY, playerSize, playerSize);
}


void drawEnemy() {
  enemyVelX += (mouseX - enemyX) * enemyVelChange;
  enemyVelY += (mouseY - enemyY) * enemyVelChange;
  enemyX += enemyVelX;
  enemyY += enemyVelY;
  
  if(enemyX > (width - borderSize - enemySize)) {
    enemyX = width - borderSize - enemySize;
  }
  else if(enemyX < borderSize) {
    enemyX = borderSize;
  }
  if(enemyY > (height - borderSize - enemySize)) {
    enemyY = height - borderSize - enemySize;
  }
  else if(enemyY < borderSize) {
    enemyY = borderSize;
  }
  
  fill(enemyColor);
  rect(enemyX, enemyY, enemySize, enemySize);
}

void checkCollision() {
  boolean collisionBoolean = false;
  if(playerX + playerSize/2 > enemyX && playerX + playerSize/2 < enemyX + enemySize) {
    if(playerY + playerSize/2 > enemyY && playerY + playerSize/2 < enemyY + enemySize) {
      collisionBoolean = true;
    }
  }
  if(collisionBoolean) {
    background(collisionColor);
  }
}




/*
  if(playerX > mouseX) {
   playerVelX -= playerVelChange;
   }
   else if(playerX < mouseX) {
   playerVelX += playerVelChange;
   }
   if(playerY > mouseY) {
   playerVelY -= playerVelChange;
   }
   else if(playerY < mouseY) {
   playerVelY += playerVelChange;
   }
   */



