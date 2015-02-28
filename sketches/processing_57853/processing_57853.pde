
/*
Controls:
  > W - A - D to mov/ jump
  > Space to Shoot
  > R to Reload
  
Suff:
  > Dont touch Enemies
 */

int cols = 50;
int rows = 50;
int displace = 15;
int gameHeight = 750; //the gameHeight of the game field
int gameHDiff; //differnce between window size and game size
float gravity = 0.50; //player can jump 6 boxes
boolean left, right, up, shoot, reload;
int screenTrans; //screen transparency
int screenFade = 60; //how fast the screen fades

//Objects of my Classes
Grid cell[][];
Player user;
Enemy[] wander = new Enemy[30];
int numWander = 24;
Enemy[] robot = new Enemy[20];
int numRobot = 16;
Item[] healthPack = new Item[10];
int healthPackNum = 5;
//Item highJump;
Item doubleJump;
Item gunUpgrade;
Item speedShoes;
int buttonTransperency = 255;

//Properties for Loading Map Data
String[][] platformData;
String[][] mapData;
String[] input;
int cMap = 1;
int a = 0, z = 0; //a is row z is column
//my 2d array for figuring out which map i am on in relation to other maps
int[][] mapOrder = {
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 1, 4, 7, 0
  }
  , 
  {
    0, 2, 5, 8, 0
  }
  , 
  {
    0, 3, 6, 9, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
};

int gameMode = 0;
PImage titleScreen, gameoverScreen, gameWonScreen; 
PImage uiImage, gameBack, instructions;

void setup() {
  cell = new Grid[cols][rows];

  //loading all my images into properties
  titleScreen = loadImage("tScreen.bmp");
  gameoverScreen = loadImage("gameOverS.bmp");
  gameWonScreen = loadImage("gameWinS.bmp");
  uiImage = loadImage("userIBar.bmp");
  instructions = loadImage("instructions.bmp");

  size(750, 850);
  background(0);
  smooth();
  frameRate(60);
  gameHDiff = height - gameHeight; //game height is the game window and gameHDiff is where the UI is
  loadMap();

  //spawning my grid
  for (int j = 0; j < cols; j++) {
    for (int i = 0; i < rows; i++) {
      cell[j][i] = new Grid(j*displace, i*displace, displace, displace);
      cell[j][i].state = int(platformData[i][j]);
    }
  }
  user = new Player(width/8, gameHeight/8, 8, 10, color(#FF0000), 100); //creating my player
  wanderLocations();
  robotLocations();
  upgradeLocations();
}

void draw() {
  background(255);

  if (gameMode == 0 || gameMode == 2 || gameMode == 3 || gameMode == 4) { //before the game is started, it will show instructions and more
    //making a nice fancy, title screen, game over screen and game winning screen and instructions
    if (gameMode == 2) {
      image(gameoverScreen, 0, 0);
    } 
    else if (gameMode == 3) {
      image(gameWonScreen, 0, 0);
    }
    else if (gameMode == 4) {
      image(instructions, 0, 0);
    }
    else if (gameMode == 0) {
      image(titleScreen, 0, 0);
    }

    //instructions:
    fill(0);
    //clicking button
    if (mouseX > width/2 + 80 + width/10 && mouseX < width/2 + width/10 + 155 && mouseY > gameHeight - 70 && mouseY < gameHeight - 70 + 30) {
      fill(#FF0000);
      if (mousePressed) {
        gameMode = 4;
      }
    }
    rect(width/2 + 80 + width/10, gameHeight - 70, 105, 30);
    fill(255);
    text("Instructions!", width/2 + 100 + width/10, gameHeight - 50 );

    //starting button
    if (mouseX > width/2 + width/10 && mouseX < width/2 + width/10 + 225 && mouseY > gameHeight-gameHeight/4 && mouseY < gameHeight-gameHeight/4 + 100) {
      fill(#FF0516, 255);
      if (mousePressed == true) {
        gameMode = 1;
      }
    }
    else {
      fill(#FF0516, 150);
    }
    rect(width/2 + width/10, gameHeight - gameHeight/4, 225, 100);
    rect(width/2 + 10 + width/10, gameHeight - gameHeight/4 + 10, 205, 80);
    fill(0);
    textSize(50);
    textAlign(CORNER);
    if (gameMode == 2) {
      text("Retry ?", width/2 + width/10 + 35, gameHeight - gameHeight/4 + 70);
    } 
    else if (gameMode == 3) {
      text("Again?", width/2 + width/10 + 35, gameHeight - gameHeight/4 + 70);
    }
    else if (gameMode ==0) {
      text("START", width/2 + width/10 + 35, gameHeight - gameHeight/4 + 70);
    }
    else if (gameMode ==4) {
      text("START", width/2 + width/10 + 35, gameHeight - gameHeight/4 + 70);
    }
    textSize(12);
  }
  else if (gameMode == 1) { //this happens when user tells the game to start

    if (user.health <= 0) {
      gameOver();
    }
    //interpretring the grid code
    for (int k = 0; k < cols; k++) {
      for (int m = 0; m < rows; m++) {

        if (cell[k][m].state == 0) {
          noFill();
          noStroke();
        }
        else if (cell[k][m].state == 1) {
          stroke(150);
          fill(0);
        }
        else if (cell[k][m].state == 2) {
          stroke(255);
          fill(#E35E8C, 100);
        }
        else if (cell[k][m].state == 3) {
          stroke(255);
          fill(#5E82E3, 100);
        }
        cell[k][m].display();
      }
    }
    user.run(); //my player will now work

    for (int u = 1; u <= numWander; u++) {
      if (wander[u].whichMap == cMap) {
        wander[u].eRun(); //making my wnadering enemies work
      }
    }
    for (int r = 1; r <= numRobot; r++) {
      if (robot[r].whichMap == cMap) {
        robot[r].eRun(); //making my robot enemies work
      }
    }

    //upgrades
    for (int i = 1; i <= healthPackNum; i++) {
      healthPack[i].iRun(); //multiple health packs in the game
    }
    doubleJump.iRun();
    gunUpgrade.iRun();
    speedShoes.iRun();
  }
  userInterface();
}

//checking what key was pressed to preform an action
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
  case ' ':
    shoot = true;
    break;
  case 'r':
  case 'R':
    reload = true;
    break;
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
  case ' ':
    shoot = false;
    break;
  }
}

//my function to load maps
void loadMap() {
  input = loadStrings("pData" + str(cMap) + ".txt");
  platformData = new String[input.length][];
  for (int s = 0; s < input.length; s++) {
    platformData[s] = split(input[s], ',');
  }
  //depending on which map i am on, the map order will switch positions
  switch(cMap) {
  case 1:
    a = 1;
    z = 1;
    break;
  case 2:
    a = 2;
    z = 1;
    break;
  case 3:
    a = 3;
    z = 1;
    break;
  case 4:
    a = 1;
    z = 2;
    break;
  case 5:
    a = 2;
    z = 2;
    break;
  case 6:
    a = 3;
    z = 2;
    break;
  case 7:
    a = 1;
    z = 3;
    break;
  case 8:
    a = 2;
    z = 3;
    break;
  case 9:
    a = 3;
    z = 3;
    break;
  }
}

//my function to switch maps
void switchMap() {
  for (int j = 0; j < cols; j++) {
    for (int i = 0; i < rows; i++) {
      cell[j][i].state = int(platformData[i][j]);
    }
  }
}

//This is the bottom area of my screen that will show
//health bars, experince bars, bullet count and pause buttons
void userInterface() {
  float expBarDisplacement = 10;
  String reloadText = "RELOAD";

  screenTrans -= screenFade;
  if (screenTrans <=0) {
    screenTrans = 0;
  }
  fill(#FA0505, screenTrans);
  noStroke();
  rect(0, 0, 750, gameHeight);

  stroke(0);
  //fill(#FF8000);
  fill(100);
  rect(0, height - gameHDiff, width, gameHDiff);
  image(uiImage, 0, gameHeight);
  color hpBarC = color(0, 0, 0); //color of the health bar

  fill(0);
  textSize(15);
  if (user.gunAmmo*user.gunLevel - user.bulletNum > 0) {
    fill(0, 255, 0);
    reloadText = "Bullets Left: " + str(user.gunAmmo*user.gunLevel - user.bulletNum);
  }
  else if (user.gunAmmo*user.gunLevel - user.bulletNum <= 0 || reload) {
    reloadText = "RELOAD";
    fill(255, 255, 255);
    hpBarC = color(255, 0, 0);
    if (reload) {
      if (user.p <=1) {
        reloadText = "RELOAD.";
      } 
      else if (user.p <=2) {
        reloadText = "RELOAD..";
      } 
      else if (user.p <=3) {
        reloadText = "RELOAD...";
      } 
      else if (user.p <=3.7) {
        reloadText = "RELOAD...!";
      }
    }
  }
  text(reloadText, 20, height - 80);

  fill(255);
  text("Health: " + str(user.health), 20, height - 60);
  if (user.health <= 10) {
    hpBarC = color(255, 0, 0);
    fill(hpBarC);
  } 
  else if (user.health == 100) {
    hpBarC = color(0, 255, 0);
    fill(hpBarC);
  } 
  else if (user.health < 100) {
    hpBarC = color(0, 0, 255);
    fill(hpBarC);
  }
  textSize(12);

  //health bar
  noFill();
  strokeWeight(2);
  stroke(255);
  rect(20, height - 50, user.initialHP*3, 12);
  fill(hpBarC);
  rect(20, height - 50, user.health*3, 12);
  strokeWeight(1);

  //experince bar
  if (user.ExperinceToNextLevel == 1000) {
    expBarDisplacement = 3.3;
  }
  else if (user.ExperinceToNextLevel == 5000) {
    expBarDisplacement = 16.5;
  }
  else if (user.ExperinceToNextLevel == 10000) {
    expBarDisplacement = 33;
  }

  noFill();
  strokeWeight(2);
  stroke(255);
  rect(20, height - 30, user.ExperinceToNextLevel/expBarDisplacement - 3, 12);
  fill(#00ECFF);
  rect(20, height - 30, user.playerEXP/expBarDisplacement, 12);
  strokeWeight(1);

  //upgrade toggling:
  //speed shoes button
  fill(255);
  textAlign(CENTER);
  text("Speed Shoes", width/2 + 15, height - 60);
  if (user.sShoes) {
    fill(#FFD500, buttonTransperency);
    stroke(255);
  } 
  else {
    noFill();
    stroke(255);
  }
  rect(width/2, height - 50, 25, 25);

  //double jump confirmation:
  fill(255);
  text("Double Jump", width/2 + 105, height - 60);
  noFill();
  if (user.dJump) {
    fill(#00FFFD, buttonTransperency);
    stroke(255);
  } 
  else {
    noFill();
    stroke(255);
  }
  rect(width/2 + 90, height-50, 25, 25);

  //gun break walls confirmation:
  fill(255);
  text("Gun b/ Walls", width/2 + 195, height - 60);
  noFill();
  if (user.gunBreakWalls) {
    fill(#FF0000, buttonTransperency);
    stroke(255);
  } 
  else {
    noFill();
    stroke(255);
  }
  rect(width/2 + 180, height-50, 25, 25);

  fill(255);
  text("Gun Level:", width/2 + 285, height-60);
  textSize(30);
  text(str(user.gunLevel), width/2 + 285, height - 30);
  textSize(12);

  textAlign(CORNER);

  buttonTransperency -= 10;
  if (buttonTransperency <= 0) {
    buttonTransperency = 255;
  }
}



void gameOver() {
  wanderLocations();
  robotLocations();
  upgradeLocations();

  cMap = 1;
  loadMap();
  switchMap();

  user.health = user.initialHP;
  user.gunLevel = 1;
  user.sShoes = false;
  user.dJump = false;
  user.gunBreakWalls = false;
  user.facingL = false;
  user.oldMap = cMap;
  user.initialX = width/8;
  user.initialY = height/8;
  user.playerLeftMap = true;
  user.x = user.initialX;
  user.y = user.initialY;
  user.yS = 0;
  user.xS = 0;
  user.playerEXP = 0;
  user.playerLevel = 0;

  gameMode = 2;
}

void gameWin() {
  gameOver();
  gameMode = 3;
}

//locations of enemies and items
void wanderLocations() {
  //All the Locations of the Wandering Enemies
  wander[1] = new Enemy(230, gameHeight - 250, 15, 1, 30, 1);
  wander[2] = new Enemy(330, gameHeight -  80, 15, 1, 30, 1);
  wander[3] = new Enemy(440, gameHeight - 190, 15, 1, 30, 4);
  wander[4] = new Enemy( 80, gameHeight - 280, 15, 1, 30, 4);
  wander[5] = new Enemy(280, gameHeight - 360, 15, 1, 30, 4);
  wander[6] = new Enemy(430, gameHeight - 250, 15, 1, 30, 5);
  wander[7] = new Enemy(280, gameHeight - 460, 15, 1, 30, 5);
  wander[8] = new Enemy(400, gameHeight - 460, 15, 1, 30, 5);

  wander[9] = new Enemy(590, gameHeight - 290, 15, 1, 30, 4);
  wander[10] = new Enemy(190, gameHeight - 290, 15, 1, 30, 4);
  wander[11] = new Enemy(590, gameHeight - 560, 15, 1, 30, 4);
  wander[12] = new Enemy(190, gameHeight - 560, 15, 1, 30, 4);

  wander[13] = new Enemy(530, gameHeight - 490, 15, 1, 30, 2);
  wander[14] = new Enemy(280, gameHeight - 430, 15, 1, 30, 2);
  wander[15] = new Enemy(569, gameHeight - 250, 15, 1, 30, 5);
  wander[16] = new Enemy(400, gameHeight - 475, 15, 1, 30, 6);
  wander[17] = new Enemy(160, gameHeight - 560, 15, 1, 30, 6);

  wander[18] = new Enemy(160, gameHeight - 350, 15, 1, 30, 8);
  wander[19] = new Enemy(490, gameHeight - 360, 15, 1, 30, 8);
  wander[20] = new Enemy(530, gameHeight - 685, 15, 1, 30, 8);
  wander[21] = new Enemy(115, gameHeight - 365, 15, 1, 30, 8);
  wander[22] = new Enemy(200, gameHeight - 365, 15, 1, 30, 8);
  wander[23] = new Enemy(580, gameHeight - 365, 15, 1, 30, 8);

  wander[24] = new Enemy(428, gameHeight - 535, 15, 1, 30, 1);
}

void robotLocations() {
  //All locations for my robt shooting enemies
  robot[1] = new Enemy (69, gameHeight - 192, 20, 2, 40, 7);
  robot[2] = new Enemy (640, gameHeight - 380, 20, 2, 40, 5);
  robot[3] = new Enemy (580, gameHeight - 230, 20, 2, 40, 2);
  robot[4] = new Enemy (656, gameHeight - 189, 20, 2, 40, 7);
  robot[5] = new Enemy (518, gameHeight - 482, 20, 2, 40, 7);
  robot[6] = new Enemy (72, gameHeight - 269, 20, 2, 40, 2);
  robot[7] = new Enemy (634, gameHeight - 100, 20, 2, 40, 6);
  robot[8] = new Enemy (634, gameHeight - 269, 20, 2, 40, 6);
  robot[9] = new Enemy (634, gameHeight - 439, 20, 2, 40, 6);
  robot[10] = new Enemy (674, gameHeight - 114, 20, 3, 40, 8);
  robot[11] = new Enemy (399, gameHeight - 269, 20, 3, 40, 8);
  robot[12] = new Enemy (116, gameHeight - 616, 20, 3, 40, 8);


  //final boss room
  robot[13] = new Enemy (116, gameHeight - 666, 20, 3, 40, 9);
  robot[14] = new Enemy (356, gameHeight - 666, 20, 3, 40, 9);
  robot[15] = new Enemy (571, gameHeight - 666, 20, 3, 40, 9);

  //final boss
  robot[16] = new Enemy (493, gameHeight - 282, 200, 4, 400, 9);
}

void upgradeLocations() {
  //upgrades spawned
  healthPack[1] = new Item(697, gameHeight - 656, 8, 1, 6);
  healthPack[2] = new Item(700, gameHeight - 650, 8, 1, 3);
  healthPack[3] = new Item(237, gameHeight - 460, 8, 1, 8);
  healthPack[4] = new Item(686, gameHeight - 196, 8, 1, 8);
  healthPack[5] = new Item(659, gameHeight - 697, 8, 1, 9);

  //highJump = new Item(width-width/3 + 20, gameHeight/8, 8, 2);

  doubleJump = new Item(700, gameHeight - 660, 8, 3, 5);
  gunUpgrade = new Item(93, gameHeight - 60, 8, 4, 2);
  speedShoes = new Item(355, gameHeight - 105, 8, 5, 7);
}

//my class of grid objects
class Grid {
  float x;
  float y;
  int w, h;
  int state;
  //1 = platform, 2 = exit, 3 = destroyable, 4 = teleporter (only if i have time)

  Grid(float iX, float iY, int iW, int iH) {
    x = iX;
    y = iY;
    w = iW;
    h = iH;
  }

  void display() {
    rect(x, y, w, h);
  }

  void clear() {
    state = 0;
  }
}


