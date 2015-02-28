
//  Maya Tanaka
//  Desma 28 - Interactivity
//  Project06 - Play
//  2010/12/02
//  v.2.2

//  Collision function code taken from circleboxCollide


//  Variable Declaration---------------------------------------------------------------
PFont fontSmall, fontBig;
int page = 0;
int score = 0;
int highScore = 0;
int level = 1;
int scoreTrigger = 0;

float playerX;
float playerY;
float playerWidth = 25.0;
float playerHeight = 25.0;
float easing = 0.15;
float currX = 0.0;

int reachBottom01 = 0;
float ellipse01X;
float ellipse01Y = -10.0;
float ellipse01Speed = 2.0;
float ellipse01Radius = 10.0;
int ellipse01Make = 0;
float xoff = 0.0;
float xincrement = 0.005;

int reachBottom02 = 0;
float ellipse02X;
float ellipse02Y = -10.0;
float ellipse02Radius = 10.0;
int ellipse02Make = 0;

int reachBottom03 = 0;
float ellipse03X;
float ellipse03Y = -10.0;
float ellipse03Radius = 10.0;
int ellipse03Make = 0;

int reachBottom04 = 0;
float ellipse04X;
float ellipse04Y = -10.0;
float ellipse04Radius = 10.0;
int ellipse04Make = 0;

//  Setup----------------------------------------------------------------------------
void setup () {
  size (320,480);
  fontSmall = loadFont ("AgencyFB-Reg-24.vlw");
  fontBig = loadFont ("AgencyFB-Reg-48.vlw");
  ellipseMode (CENTER);
  rectMode (CORNER);
  noStroke ();
  smooth ();
}

//  Draw-----------------------------------------------------------------------------
void draw () {
  if (page == 0) {
    menuScreen ();
  }
  else if (page == 1) {
    gameScreen ();
  }
  else if (page == 2) {
    gameOverScreen ();
  }
  else if (page == 3) {
    gameClearedScreen ();
  }
}

//  KeyPressed------------------------------------------------------------------------
void keyPressed () {
  if (keyCode == ENTER || keyCode == RETURN) {
    if (page == 0) {
      ellipse01Speed = 2.0;
      page = 1;
    }
    else if (page == 2) {
      ellipse01Speed = 2.0;
      score = 0;
      level = 1;
      page = 1;
    }
    else if (page == 3) {
      ellipse01Speed = 2.0;
      score = 0;
      level = 1;
      page = 1;
    }
  }
  if (key == '1'){
    score = 9;
  } else if (key == '2'){
    score = 19;
  } else if (key == '3'){
    score = 29;
  } else if (key == '4'){
    score = 39;
  } else if (key == '5'){
    score = 49;
  }
}

//  Menu Screen------------------------------------------------------------------------
void menuScreen () {
  background (0);

  ////  Collect------------------------------------------------------------------------
  textFont (fontBig);
  fill (255);
  text ("COLLECTION", 75,100);

  ////  Ellipse01----------------------------------------------------------------------
  textFont (fontSmall);
  fill (255);
  text ("Collect",160,190);
  float gradientRadius01 = 10.0;
  for (int i = 0; i < 200; i += 40) {
    noStroke ();
    fill (255, i);
    ellipse (120,180, gradientRadius01*2.0,gradientRadius01*2.0);
    gradientRadius01 -= 3;
  }
  ////  Ellipse02----------------------------------------------------------------------
  textFont (fontSmall);
  fill (255);
  text ("Don't Collect", 160,250);
  float gradientRadius02 = 10.0;
  for (int j = 0; j < 200; j += 40) {
    noStroke ();
    fill (255,0,0, j);
    ellipse (120,240, gradientRadius02*2.0,gradientRadius02*2.0);
    gradientRadius02 -= 3;
  }
  ////  Player-------------------------------------------------------------------------
  textFont (fontSmall);
  fill (255);
  text ("Controls: Left & Right Arrow Keys", 30,370);
  if (keyPressed) {
    if (keyCode == LEFT) {
      playerX -= 5;
    }
    else  if (keyCode == RIGHT) {
      playerX += 5;
    }
  }
  float targetX = playerX;
  float dX = (targetX - currX);
  currX += dX * easing;
  fill (255);
  rect (currX,400, playerWidth,playerHeight);
  if (currX >= width - 40.0) {
    playerX = width - 40.0;
  }
  if (currX <= 15) {
    playerX = 15;
  }

  fill (255);
  text ("Enter to Start", 110,460);
}

//  Game Screen------------------------------------------------------------------------
void gameScreen () {
  background (0);
  playerY = 400;

  ////  Player-------------------------------------------------------------------------
  if (level < 5) {
    if (keyPressed) {
      if (keyCode == LEFT) {
        playerX -= 5.0;
      }
      else  if (keyCode == RIGHT) {
        playerX += 5.0;
      }
    }
    float targetX = playerX;
    float dX = (targetX - currX);
    currX += dX * easing;
    fill (255);
    rect (currX,playerY, playerWidth,playerHeight);
    if (currX >= width - (playerWidth + 15.0)) {
      playerX = width - (playerWidth + 15.0);
    }
    if (currX <= 15.0) {
      playerX = 15.0;
    }
  }

  ////  Random Ellipses01----------------------------------------------------------------
  if (ellipse01Make == 0) {
    int ellipse01Random = int (random (0,100));
    if (ellipse01Random == 0) {
      ellipse01Make = 1;
    }
  } 
  else if (ellipse01Make == 1) {
    ellipse01 ();
  }

  ////  Random Ellipses02----------------------------------------------------------------
  if (ellipse02Make == 0) {
    int ellipse02Random = int (random (0,100));
    if (ellipse02Random == 0) {
      ellipse02Make = 1;
    }
  } 
  else if (ellipse02Make == 1) {
    ellipse02 ();
  }

  ////  Random Ellipses03-----------------------------------------------------------------
  if ((level >= 2) && (level < 4)) {
    if (ellipse03Make == 0) {
      int ellipse03Random = int (random (0,100));
      if (ellipse03Random == 0) {
        ellipse03Make = 1;
      }
    } 
    else if (ellipse03Make == 1) {
      ellipse03 ();
    }
    ellipse01Speed = 4.0;
  }

  ////  Random Ellipses04-----------------------------------------------------------------
  if (level >= 4) {
    if (ellipse03Make == 0) {
      int ellipse03Random = int (random (0,100));
      if (ellipse03Random == 0) {
        ellipse03Make = 1;
      }
    } 
    else if (ellipse03Make == 1) {
      ellipse03 ();
    }
    if (ellipse04Make == 0) {
      int ellipse04Random = int (random (0,100));
      if (ellipse04Random == 0) {
        ellipse04Make = 1;
      }
    } 
    else if (ellipse04Make == 1) {
      ellipse04 ();
    }
    ellipse01Speed = 6.0;
  }

  ////  Bar01----------------------------------------------------------------------------
  if (level == 3) {
    fill (0);
    rect (0,80, width, 75);
  }


  ////  Bar02----------------------------------------------------------------------------
  if (level == 4) {
    fill (0);
    rect (0,80, width, 75);
    rect (0,235, width,75);
  }

  ////  Vertical Bars--------------------------------------------------------------------
  if (level == 5) {
    fill (0);
    rect (0,80, width, 75);
    rect (0,235, width,75);
    if (keyPressed) {
      if (keyCode == LEFT) {
        playerX -= 5.0;
      }
      else  if (keyCode == RIGHT) {
        playerX += 5.0;
      }
    }
    float targetX = playerX;
    float dX = (targetX - currX);
    currX += dX * easing;
    fill (255);
    rect (currX,playerY, playerWidth,playerHeight);
    if (currX >= width - (playerWidth + 80.0)) {
      playerX = width - (playerWidth + 80.0);
    }
    if (currX <= 80.0) {
      playerX = 80.0;
    }
  }

  ////  Score--------------------------------------------------------------------------
  textFont (fontSmall);
  fill (255);
  text ("Score: " + score, 10,450);
  text ("Level: " + level, 10,475);

  if ((score >= 10) && (score < 20)) {
    level = 2;
  } 
  else if ((score >= 20) && (score < 30)) {
    level = 3;
  } 
  else if ((score >= 30) && (score < 40)) {
    level = 4;
  }
  else if ((score >= 40) && (score < 50)) {
    level = 5;
  }
  else if (score >= 50){
    page = 3;
  }
}

//  Game Over Screen-------------------------------------------------------------------
void gameOverScreen () {
  background (0);

  ////  Game Over----------------------------------------------------------------------
  textFont (fontBig);
  fill (255);
  text ("Game Over", 80,160);

  ////  Highscore----------------------------------------------------------------------
  if (score > highScore) {
    highScore = score;
  }
  textFont (fontSmall);
  fill (255);
  text ("Score: " + score, 125,210);
  text ("Highscore: " + highScore, 110,235);

  ////  Player-------------------------------------------------------------------------
  textFont (fontSmall);
  fill (255);
  if (keyPressed) {
    if (keyCode == LEFT) {
      playerX -= 5;
    }
    else  if (keyCode == RIGHT) {
      playerX += 5;
    }
  }
  float targetX = playerX;
  float dX = (targetX - currX);
  currX += dX * easing;
  fill (255);
  rect (currX,400, playerWidth,playerHeight);
  if (currX >= width - 40.0) {
    playerX = width - 40.0;
  }
  if (currX <= 15) {
    playerX = 15;
  } 

  ////  Replay--------------------------------------------------------------------------
  fill (255);
  text ("Enter to Replay", 105,470);
}

//  Game Cleared Screen-----------------------------------------------------------------
void gameClearedScreen () {
  background (0);

  ////  Game Cleared--------------------------------------------------------------------
  textFont (fontBig);
  fill (255);
  text ("Game Cleared!", 50,160);


  ////  Highscore-----------------------------------------------------------------------
  if (score > highScore) {
    highScore = score;
    score = 0;
  }

  ////  Player--------------------------------------------------------------------------
  textFont (fontSmall);
  fill (255);
  if (keyPressed) {
    if (keyCode == LEFT) {
      playerX -= 5;
    }
    else  if (keyCode == RIGHT) {
      playerX += 5;
    }
  }
  float targetX = playerX;
  float dX = (targetX - currX);
  currX += dX * easing;
  fill (255);
  rect (currX,400, playerWidth,playerHeight);
  if (currX >= width - 40.0) {
    playerX = width - 40.0;
  }
  if (currX <= 15) {
    playerX = 15;
  } 

  ////  Start---------------------------------------------------------------------------
  fill (255);
  text ("Enter to Replay", 105,470);
}

//  Ellipse Functions--------------------------------------------------------------------
void ellipse01 () {
  if (reachBottom01 == 1) {
    ellipse01X = random (15,width - 15);
    ellipse01Y = -10.0;
    ellipse01Make = 0;
    reachBottom01 = 0;
  } 
  else {
    ellipse01Y += ellipse01Speed;

    float gradientRadius01 = 10.0;
    float noise01 = noise (xoff) * width;
    for (int i = 0; i < 200; i += 40) {
      noStroke ();
      fill (255, i);
      ellipse (noise01,ellipse01Y, gradientRadius01*2.0,gradientRadius01*2.0);
      gradientRadius01 -= 3;
    }
    xoff += xincrement;

    boolean collisionDetected01 = isColliding (noise01,ellipse01Y, ellipse01Radius, 
    playerX,playerY, playerWidth,playerHeight);

    if (collisionDetected01 == true) {
      score ++;
      reachBottom01 = 1;
    }

    if (ellipse01Y >= height - 60) {
      reachBottom01 = 1;
    }
  }
  println("Ellipse01 Check");
}

void ellipse02 () {
  if (reachBottom02 == 1) {
    ellipse02X = random (15,width - 15);
    ellipse02Y = -10.0;
    ellipse02Make = 0;
    reachBottom02 = 0;
  } 
  else {
    ellipse02Y += ellipse01Speed;
  }

  float gradientRadius02 = 10.0;
  float noise02 = noise (xoff+6.0) * width;
  for (int i = 0; i < 200; i += 40) {
    noStroke ();
    fill (255,0,0, i);
    ellipse (noise02,ellipse02Y, gradientRadius02*2.0,gradientRadius02*2.0);
    gradientRadius02 -= 3;
  }

  boolean collisionDetected02 = isColliding (noise02,ellipse02Y, ellipse02Radius, 
  playerX,playerY, playerWidth,playerHeight);

  if (collisionDetected02 == true) {
    page = 2;
    reachBottom02 = 1;
  }
  if (ellipse02Y >= height - 60) {
    reachBottom02 = 1;
  }
  println("Ellipse02 Check");
}

void ellipse03 () {
  if (reachBottom03 == 1) {
    ellipse03X = random (15,width - 15);
    ellipse03Y = -10.0;
    ellipse03Make = 0;
    reachBottom03 = 0;
  } 
  else {
    ellipse03Y += ellipse01Speed;
  }

  float gradientRadius03 = 10.0;
  float noise03 = noise (xoff-4.0) * width;
  for (int i = 0; i < 200; i += 40) {
    noStroke ();
    fill (255,0,0, i);
    ellipse (noise03,ellipse03Y, gradientRadius03*2.0,gradientRadius03*2.0);
    gradientRadius03 -= 3;
  }

  boolean collisionDetected03 = isColliding (noise03,ellipse03Y, ellipse03Radius, 
  playerX,playerY, playerWidth,playerHeight);

  if (collisionDetected03 == true) {
    page = 2;
    reachBottom03 = 1;
  }
  if (ellipse03Y >= height - 60) {
    reachBottom03 = 1;
  }
  println("Ellipse03 Check");
}

void ellipse04 () {
  if (reachBottom04 == 1) {
    ellipse04X = random (15,width - 15);
    ellipse04Y = -10.0;
    ellipse04Make = 0;
    reachBottom04 = 0;
  } 
  else {
    ellipse04Y += ellipse01Speed;
  }

  float gradientRadius04 = 10.0;
  float noise04 = noise (xoff-10.0) * width;
  for (int i = 0; i < 200; i += 40) {
    noStroke ();
    fill (255,0,0, i);
    ellipse (noise04,ellipse04Y, gradientRadius04*2.0,gradientRadius04*2.0);
    gradientRadius04 -= 3;
  }

  boolean collisionDetected04 = isColliding (noise04,ellipse04Y, ellipse04Radius, 
  playerX,playerY, playerWidth,playerHeight);

  if (collisionDetected04 == true) {
    page = 2;
    reachBottom04 = 1;
  }
  if (ellipse04Y >= height - 60) {
    reachBottom04 = 1;
  }
  println("Ellipse04 Check");
}





//  Collision Checker-----------------------------------------------------------------
boolean isColliding (float circleX, float circleY, float radius, float rectangleX,
float rectangleY, float rectangleWidth, float rectangleHeight) {

  float circleDistanceX = abs (circleX - rectangleX - rectangleWidth/2);
  float circleDistanceY = abs (circleY - rectangleY - rectangleHeight/2);

  if (circleDistanceX > (rectangleWidth/2 + radius)) {
    return false;
  }
  if (circleDistanceY > (rectangleHeight/2 + radius)) {
    return false;
  }

  if (circleDistanceX <= (rectangleWidth/2)) {
    return true;
  }
  if (circleDistanceY <= (rectangleHeight/2)) {
    return true;
  }

  float cornerDistance_sq = pow (circleDistanceX - rectangleWidth/2, 2) + 
    pow (circleDistanceY - rectangleHeight/2, 2);

  return (cornerDistance_sq <= pow (radius,2));
}


