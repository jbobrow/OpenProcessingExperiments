
//////////////////////////
/////GLOBAL VARIABLES\\\\\
//\\\\\\\\\\\\\\\\\\\\\\\\

//objects of my classes
Ship user;
Enemy[] blorgon = new Enemy[30];
Tower[] refillTowers = new Tower[4];
PowerUp[] dropPower = new PowerUp[400];

//screen scrolling properties
int bloodScreen = 0;
float screenXPos, screenYPos;
float screenXSpeed = 0, screenYSpeed = 0;
float oldSXPos, oldSYPos;
PImage screenImg;
float fieldX, fieldY;
float fieldW, fieldH;
boolean up, left, right, shoot; //keyboard booleans
int screenDir; //1 = up, 2 = down, 3 = left, r = right
//^ is the direction the screen moved w.r.t player

//minimap variables
float miniX, miniY, miniAngle, miniRad = 40; //minimapx and y for radar animation
float miniXPos, miniYPos;
float userDist; //distance from the user
float[] towerDist = new float[refillTowers.length];
float[] towerDX = new float[refillTowers.length];
float[] towerDY = new float[refillTowers.length];

//wave variables
int wave;
boolean switchWave;
boolean waveSwitchAnimation;
float textx = 0, texty = 0;
boolean gameStart = false, gameOver = false, gameWin = false;
int num = 1;
//PImage[] = charSprite = new PImage[10]; //picture array example

void setup() {
  size(480, 270); //1920x1080 picture
  smooth();
  stroke(255);
  noFill();
  screenImg = loadImage("data/space.bmp");
  miniXPos = width/9;
  miniYPos = height - height/6 - 10;
  user = new Ship(width/2, height/2, 10, 20, 600, 200, 300, #FC14F9);
  for (int k = 0; k < refillTowers.length; k++) {
    refillTowers[k] = new Tower(random(-960, 960), random(-540, 540), num);
    if (num == 1) {
      num = 2;
    } 
    else {
      num = 1;
    }
  }
  for (int r = 0; r < dropPower.length; r++) {
    int range = 0;
    if (r >= 0 && r < 100) {
      range = 1;
    } 
    else if (r >= 100 && r < 200) {
      range = 2;
    } 
    else if (r >= 200 && r < 300) {
      range = 3;
    } 
    else if ( r >= 300 && r < 400) {
      range = 4;
    }
    dropPower[r] = new PowerUp(range);
  }
  for (int p = 0; p < blorgon.length; p++) {
    blorgon[p] = new Enemy(random(-960, 960), random(-540, 540), round(random(0.5, 2.5)));
  }
  screenXPos = -960;
  screenYPos = -540;
  fieldX = width/8;
  fieldY = height/6;
  fieldW = width - 2*width/8;
  fieldH = height - 2*height/6;
  wave = 1;
  //charSprite[j] = loadImage("asdf" + j + ".png"); //loading picturs in an array example
}

void draw() {
  if (gameStart == false && gameOver == false) {
    image(loadImage("data/startScreen.bmp"), 0, 0);
    textAlign(CENTER);
    text("Or Read the README", width/2, height - 40);
    textAlign(LEFT);
  }
  else if (gameStart == true && gameOver == false) {
    background(0);
    mapScroll();
    miniMap();
    user.run();
    waves();
    for (int p = 0; p < 5*wave; p++) {
      blorgon[p].eRun();
    }
    for (int k = 0; k < refillTowers.length; k++) {
      refillTowers[k].run();
    }
    for (int r = 0; r < dropPower.length; r++) {
      dropPower[r].run();
    }

    fill(#FF0000, bloodScreen);
    noStroke();
    bloodScreen -= 10;
    if (bloodScreen < 0) {
      bloodScreen = 0;
    }
    rect(0, 0, width, height);
  } 
  else if (gameOver == true) {
    image(loadImage("data/deathScreen.bmp"), 0, 0);
  }
  if (gameWin) {
    image(loadImage("data/winScreen.bmp"), 0, 0);
  }
  noFill();
}

void keyPressed() {
  switch(keyCode) {
  case 'd': 
  case 'D':
    right = true; 
    break;
  case 'a': 
  case 'A':
    left = true; 
    break;
  case 'w':
  case 'W':
    up = true; 
    break;
    /*
  case ' ':
     shoot = true;
     break;
     */
  }
}

//tunring the key off when pressed
void keyReleased() {
  switch(keyCode) {
  case 'd':
  case 'D':
    right = false;
    break;
  case 'a':
  case 'A':
    left = false; 
    break;
  case 'w':
  case 'W':
    up = false; 
    break;
  }
} 

void mapScroll() {
  image(screenImg, screenXPos, screenYPos); //background

  oldSXPos = screenXPos;
  oldSYPos = screenYPos;

  //map scrolling
  if (user.xPos < fieldX) {
    screenXSpeed = 5;
    screenXPos += screenXSpeed; //move screen left
    user.xPos = user.oldX;
  } 
  else if (user.xPos > fieldX + fieldW) {
    screenXSpeed = -5;
    screenXPos += screenXSpeed; //move screen right
    user.xPos = user.oldX;
  }
  if (user.yPos < fieldY) {
    screenYSpeed = 5;
    screenYPos += screenYSpeed; //move screen up
    user.yPos = user.oldY;
  } 
  else if (user.yPos > fieldY + fieldH) {
    screenYSpeed = -5;
    screenYPos += screenYSpeed; //move screen down
    user.yPos = user.oldY;
  }

  //boundaries
  if (screenXPos > width  || screenXPos < -1920) {
    screenXPos = oldSXPos;
  } 
  if (screenYPos > height || screenYPos < -1080) {
    screenYPos = oldSYPos;
  }

  //shift enemies
  for (int p = 0; p < 5*wave; p++) {
    blorgon[p].enemyScreenShift();
  }
  for (int k = 0; k < refillTowers.length; k++) {
    refillTowers[k].towerScreenShift();
  }
  for (int r = 0; r < dropPower.length; r++) {
    dropPower[r].powerUpScreenShift();
  }
  screenXSpeed = 0;
  screenYSpeed = 0;
  //println("(" + screenXPos + ", " + screenYPos +")");
}

void miniMap() {
  float[] pX = new float[5*wave]; 
  float[] pY = new float[5*wave];
  float[] pTX = new float[refillTowers.length];
  float[] pTY = new float[refillTowers.length];
  float[] pPX = new float[dropPower.length];
  float[] pPY = new float[dropPower.length];
  float closestTowerAngle = 0;

  //displaying minimap and animation
  miniAngle += 0.09;
  stroke(#00FF1B);
  miniX = 40*cos(miniAngle) + miniXPos;
  miniY = 40*sin(miniAngle) + miniYPos;
  line(miniXPos, miniYPos, miniX, miniY);
  ellipse(miniXPos, miniYPos, miniRad*2, miniRad*2);
  ellipse(miniXPos, miniYPos, miniRad/10, miniRad/10);

  //closest tower line on minimap
  for (int i = 0; i < refillTowers.length; i++) {
    towerDist[i] = dist(user.xPos, user.xPos, refillTowers[i].x, refillTowers[i].y);
    towerDX[i] = refillTowers[i].x - user.xPos;
    towerDY[i] = refillTowers[i].y - user.yPos;
  }
  bubbleSort(towerDist, towerDX, towerDY);
  closestTowerAngle = atan(towerDY[0] / towerDX[0]);
  stroke(#3199FF);
  if (towerDX[0] < 0) {
    line(miniXPos, miniYPos, -40*cos(closestTowerAngle) + miniXPos, -40*sin(closestTowerAngle) + miniYPos);
  } 
  else {
    line(miniXPos, miniYPos, 40*cos(closestTowerAngle) + miniXPos, 40*sin(closestTowerAngle) + miniYPos);
  }

  //checking for things on the minimap
  // Credit due to Kevin R. helping me
  //enemy positions on minimap
  for (int p = 0; p < 5*wave; p++) {
    userDist = dist(user.xPos, user.yPos, blorgon[p].eX, blorgon[p].eY);
    if (userDist < miniRad*20) {
      float tempX = blorgon[p].eX - user.xPos;
      float tempY = blorgon[p].eY - user.yPos;
      pX[p] = map(tempX, -miniRad*20, miniRad*20, -miniRad, miniRad) + miniXPos;
      pY[p] = map(tempY, -miniRad*20, miniRad*20, -miniRad, miniRad) + miniYPos;
      stroke(blorgon[p].enemyC);
      ellipse(pX[p], pY[p], 1, 1);
    }
  }
  //tower position on mini map
  for (int k = 0; k < refillTowers.length; k++) {
    userDist = dist(user.xPos, user.yPos, refillTowers[k].x, refillTowers[k].y);
    if (userDist < miniRad*20) {
      float tempX = refillTowers[k].x - user.xPos;
      float tempY = refillTowers[k].y - user.yPos;
      pTX[k] = map(tempX, -miniRad*20, miniRad*20, -miniRad, miniRad) + miniXPos;
      pTY[k] = map(tempY, -miniRad*20, miniRad*20, -miniRad, miniRad) + miniYPos;
      stroke(refillTowers[k].towerC);
      ellipse(pTX[k], pTY[k], 3, 3);
    }
  }
  //power up position on minimap
  for (int r = 0; r < dropPower.length; r++) {
    userDist = dist(user.xPos, user.yPos, dropPower[r].xDrop, dropPower[r].yDrop);
    if (userDist < miniRad*20) {
      float tempX = dropPower[r].xDrop - user.xPos;
      float tempY = dropPower[r].yDrop - user.yPos;
      pPX[r] = map(tempX, -miniRad*20, miniRad*20, -miniRad, miniRad) + miniXPos;
      pPY[r] = map(tempY, -miniRad*20, miniRad*20, -miniRad, miniRad) + miniYPos;
      noStroke();
      fill(dropPower[r].powerC, dropPower[r].powerUpTransperency);
      rect(pPX[r], pPY[r], 2, 2);
    }
  }
  noFill();
}

//triple array bubble sort, algorithmic thinking
void bubbleSort(float[] array, float[] array2, float[] array3) {
  int i; 
  float j, j2, j3;
  boolean swapped = false;

  while (!swapped) {
    swapped = true;
    for (i = 0; i < array.length - 1; i++) {
      if (array[i] > array[i + 1]) {
        j = array[i]; //swap
        j2 = array2[i];
        j3 = array3[i];
        array[i] = array[i + 1];
        array2[i] = array2[i + 1];
        array3[i] = array3[i + 1];
        array[i + 1] = j;
        array2[i + 1] = j2;
        array3[i + 1] = j3;
        swapped = false;
      }
    }
  }
}

//wave system of enemies
void waves() {
  if (user.score >= 50 && user.score < 150) {
    if (wave == 1) {
      switchWave = true;
    }
    //waveSwitchAnimation = true;
    wave = 2;
  } 
  else if (user.score >= 150 && user.score < 300) {
    if (wave == 2) {
      switchWave = true;
    }
    wave = 3;
  } 
  else if (user.score >= 300 && user.score < 500) {
    if (wave == 3) {
      switchWave = true;
    }
    wave = 4;
  } 
  else if (user.score >= 500 && user.score < 800) {
    if (wave == 4) {
      switchWave = true;
    }
    wave = 5;
  } 
  else if (user.score >= 800 && user.score < 1100) {
    if (wave == 5) {
      switchWave = true;
    }
    wave = 6;
  }
  if (wave == 6) {
    gameWin = true;
  }

  if (switchWave == true) {
    switchWave = false;
    for (int p = 0; p < blorgon.length; p++) {
      blorgon[p].ressurect();
    }
  }

  //endgame if user dies
  if (user.damageLevel >= user.iDamage) {
    gameOver = true;
  }
}

void mouseReleased() {
  gameStart = true;
  shoot = false;

  if (gameOver) {
    exit();
  }
  if (gameWin) {
    exit();
  }
}


