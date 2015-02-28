
/*
School Days
 Alyssa Peterson - 2013
 
 Built using:
 
 Gold Digger
 Will Ryan - 2012
 www.willryan.us
 
 Dodge enemies
 Processing Game Building Blocks
 Brad Tober - 2012
 www.bradtober.com
 */

float homeworkY = 0;
int directionX = 1;
int directionY = 1;

float speed1, speed2, speed3, speed4, speed5, speed6, speed7;
float x1, x2, x3, x4, x5, x6, x7, y1, y2, y3, y4, y5, y6, y7, playerY;
float playerX;

PImage bg;
PImage player;
PImage teacher;
PImage hwA;
PImage hwF;
PImage hwF2;
PImage title;
PImage instruct;
PImage extra;
PFont myFont;

boolean splashScreen = true;
boolean gameStart;
boolean enterGame;
boolean profMove;
boolean gradeDrop;
boolean playing;
boolean gameOver;
boolean show4 = true;
boolean show5 = true;
boolean show6 = true;
boolean show7 = true;
boolean good;

float timer = 60000;
int startTime;
int score = 60;
boolean increaseScore;
boolean decreaseScore;
boolean timesUp = false;
int lastScoreFrame;
int playerW = 90; //collision width of player
int playerH = 120; //collision height of player
int enemyW = 50; //F grade width
int enemyH = 50; // F grade height
int goodW = 50; // A grade width
int goodH = 50; // A grade height
int hwDim = 50;
boolean lose = false;

void setup() {  
  size(644, 400);
  bg = loadImage("background.png");
  player = loadImage("boy.png");
  teacher = loadImage("teacher.png");
  hwA = loadImage("hwA.png");
  hwF = loadImage("hwF.png");
  hwF2 = loadImage("hwF2.png");
  title = loadImage("title.png");
  instruct = loadImage("howto.png");
  extra = loadImage("ec.png");
  myFont = loadFont("chalk.vlw");
  playerX = 262;
  playerY = 262;

  x1 = random(0, height-goodH);
  x2 = random(0, height-goodH);
  x3 = random(0, width-enemyH);
  y1 = 0;
  y2 = 0;
  y3 = 0;
  x4 = random(0, height-goodH);
  x5 = random(0, height-goodH);
  x6 = random(0, width-enemyH);
  y4 = 0;
  y5 = 0;
  y6 = 0;                     

  speed1 = random(1.5, 2);
  speed2 = random(1.5, 2);
  speed3 = random(1.5, 2);
  speed4 = random(1.5, 2);
  speed5 = random(1.5, 4);
  speed6 = random(1.5, 2);
}

void draw() { 
  rect(x1, y1, hwDim, hwDim);                        // draw enemy 1
  rect(x2, y2, hwDim, hwDim);                        // draw enemy 2
  rect(x3, y3, hwDim, hwDim);                        // draw enemy 3
  rect(x4, y4, hwDim, hwDim);


  if (splashScreen) {
    image(title, 0, 0);
  }

  if (enterGame) {
    image(instruct, 0, 0, 644, 400);
  } 

  if (gameStart) {
    image(bg, 0, 0, 644, 400);
    image(player, playerX, playerY);
  
    if (playing) {
      enterGame = false;
      hwA = loadImage("hwA.png");
      hwF = loadImage("hwF.png");
      hwF2 = loadImage("hwF2.png");
      extra = loadImage("ec.png");

      if (show4) {
        image(hwA, x4, y4, hwDim, hwDim);
      }
      if (show5) {
        image(hwF, x5, y5, hwDim, hwDim);
      }
      if (show6) {
        image(extra, x6, y6, hwDim, hwDim);
      }
      if (show7) {
        image(hwF2, x7, y7, hwDim, hwDim);
      }


      // hwA START 
      y4+=speed1;
      if (y4 > height-hwDim) {
        y4 = 0;
        x4 = random(0, width-hwDim);
        speed4 = random(1, 2);
        show4 = true;
      }
      y5+=speed2;
      if (y5 > height-hwDim) {
        y5 = 0;
        x5 = random(0, width-hwDim);
        speed5 = random(1.5, 2);
        show5 = true;
      }
      y6+=speed3;
      if (y6 > height-hwDim) {
        y6 = 0;
        x6 = random(0, width-hwDim);
        speed6 = random(1, 2);
        show6 = true;
      }
      y7+=speed4;
      if (y6 > height-hwDim) {
        y7 = 0;
        x7 = random(0, width-hwDim);
        speed7 = random(1, 2);
        show7 = true;
      }
      if ((x4 < playerX + playerW && x4 > playerX && y4 < playerY + playerH && y4 + hwDim > playerY && y4 + hwDim > playerY) ||
        (x4 + hwDim > playerX && x4 +hwDim < playerX + playerW && y4 + hwDim > playerY && y4 + hwDim < playerY)) {
        increaseScore = true;

        show4 = false;
      }
      if ((x5 < playerX + playerW && x5 > playerX && y5 < playerY + playerH && y5 + hwDim > playerY && y5 + hwDim > playerY) ||
        (x5 + hwDim > playerX && x5 +hwDim < playerX + playerW && y5 + hwDim > playerY && y5 + hwDim < playerY)) {
        decreaseScore = true;
        show5 = false;
      }
      if ((x6 < playerX + playerW && x6 > playerX && y6 < playerY + playerH && y6 + hwDim > playerY && y6 + hwDim > playerY) ||
        (x6 + hwDim > playerX && x6 +hwDim < playerX + playerW && y6 + hwDim > playerY && y6 + hwDim < playerY)) {
        increaseScore = true;
        show6 = false;
      }
      if ((x7 < playerX + playerW && x7 > playerX && y7 < playerY + playerH && y7 + hwDim > playerY && y7 + hwDim > playerY) ||
        (x7 + hwDim > playerX && x7 +hwDim < playerX + playerW && y7 + hwDim > playerY && y7 + hwDim < playerY)) {
        decreaseScore = true;
        show7 = false;
      }
      
      // SHOW TIME LEFT AND SCORE
      textSize(18);
      fill(255);
      textFont(myFont);
      text("Grade: " + score + "%", 120, 150);
      text(str(ceil((timer - (millis() - startTime))/1000.0)) + " days left", 400, 150);
      
    } else {
      textFont(myFont);
      text("Press Enter to Begin", 200, 150);
    }

    if (increaseScore) {
      if (lastScoreFrame < frameCount-(hwDim+1)) {
        score++;
        score++;
        lastScoreFrame = frameCount;
        // println(lastScoreFrame);
      }
      increaseScore = false;
    }


    if (decreaseScore) {
      if (lastScoreFrame < frameCount-(hwDim+1)) {
        score = score - 5;
        lastScoreFrame = frameCount;
      }
      decreaseScore = false;
    }


    if (millis() - startTime > timer) {
      timesUp = true;
      playing = false;
    } // END OF PLAYING

    // TIME EXPIRES
    if (timesUp) {
      image(bg, 0, 0, 644, 400);
      //score = 60;
      playing = false;
      timesUp = false;
      gameOver = true;
      textSize(18);
      fill(255);
      text("Final " + score + "%", 200, 145);
      textSize(18);
      fill(255);
      textSize(18);
      text("PRESS ENTER TO PLAY AGAIN", 175, 175);
      if (score >= 60) {
        textSize(18);
        text("YOU PASSED!", 325, 145);
      }
      if (score < 60 && score > 0) {
        textSize(18);
        text("YOU FAILED!", 325, 145);
      }
    }
    if ((key == CODED) && (keyCode == ENTER)) {
      score = 60;
      timer = 60000;
      image(player, playerX, 260);
      x1 = random(0, height-enemyH);
      x2 = random(0, height-enemyH);
      x3 = random(0, width-enemyH);
      y1 = 0;
      y2 = 0;
      y3 = 0;
      x4 = random(0, height-enemyH);
      x5 = random(0, height-enemyH);
      x6 = random(0, width-enemyH);
      y4 = 0;
      y5 = 0;
      y6 = 0;
    }
  }
}


void keyPressed() {
  if (gameOver) {
    if (key == ENTER || key == RETURN) {
      score = 60;
      gameOver = false;
    }
  }  
  if (gameStart) {
    if (key == ENTER || key == RETURN) {
      playing = true;
      startTime = millis();
    }
    if (key == CODED) {
      if (keyCode == RIGHT) {
        playerX += 15;
      }
    }
    if (keyCode == LEFT) {
      playerX -= 15;
    }
  }

  if (enterGame) {
    if (key == ENTER || key == RETURN) {
      enterGame = false;
      gameStart = true;
    }
  }
  if (splashScreen) {
    if (key == ENTER || key == RETURN) {
      splashScreen = false;
      enterGame = true;
      gameStart = false;
    }
  }
}  



