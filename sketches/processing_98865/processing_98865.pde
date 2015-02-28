
// Joseph Oak joak
// Joseph Oak © 2013
// Final Project 1: Simon Says
// Press 1, 2, 3 or 4 When Prompted

import ddf.minim.*;
Minim minim;
AudioPlayer s1, s2, s3, s4;

int [] gameArray;
int [] userArray;

int i, j;
int score;
int arrayItem;
int startMillis; // GAME COUNTER
int diam;
int gameState;
color sRed, sBlue, sYellow, sGreen, textColor;
String responseText;

void setup() {
  
  size(400,400);
  background(200);
  diam = 80;
  gameState = 0;
  textColor = color(0);
  gameArray = new int[1];
  userArray = new int[0];
  initialize(gameArray, 1, 5);
  minim = new Minim(this);
  s1 = minim.loadFile("t1.mp3");
  s2 = minim.loadFile("t2.mp3"); 
  s3 = minim.loadFile("t3.mp3");
  s4 = minim.loadFile("t4.mp3");
  
}

/* INITIALIZES NUMBERS */

void initialize( int [] initial, int  min, int max ) {
  
  for ( int i = 0; i < initial.length; i++ ) {
    initial[i] = int( random( min, max ));
  }
  
}

void draw() {
  
  background(200);
  drawRects();
  writeScore();
  
  /* START SCREEN */
  
  if (gameState == 0) {
    i = 0;
    j = 0;
    startMillis = 0;
    userArray = new int[0];
    fill(textColor);
    textAlign(CENTER, CENTER);
    text("Press ENTER to Start", width/2, height/2);
  }
    
  /* BOARD PLAY THROUGH */
  
  if (gameState == 1) {
    j = 0;
    fill(textColor);
    textAlign(CENTER, CENTER);
    text("Watch Closely", width/2, height/2);
    playBoard();
  };
  
  /* USER INPUT */
  
  if (gameState == 2) {
    fill(textColor);
    responseText = "Copy Me";
    textAlign(CENTER, CENTER);
    text(responseText, width/2, height/2);
  }
  
  /* BUFFER TIME */
  
  if (gameState == 3) {
    startMillis++;
    if (startMillis >= 100) {
      sRed = color(0);
      sGreen = color(0);
      sYellow = color(0);
      sBlue = color(0);
    }
    fill(textColor);
    responseText = "Good Job";
    textAlign(CENTER, CENTER);
    text(responseText, width/2, height/2);
    if (startMillis >= 150) {
      minim = new Minim(this);
      s1 = minim.loadFile("t1.mp3");
      s2 = minim.loadFile("t2.mp3"); 
      s3 = minim.loadFile("t3.mp3");
      s4 = minim.loadFile("t4.mp3");
      startMillis = 0;
      gameState = 1;
    }
  }
  
  /* GAME END */
  
  if (gameState == 4) {
    fill(textColor);
    textAlign(CENTER, CENTER);
    text("You Lose", width/2, height/2 - (height*.0325));
    text("Press ENTER to Retry", width/2, height/2 + (height*.0325));
  };
 
}

/* WRITES SCORE */

void writeScore() {
  
  score = gameArray.length - 1;
  fill(textColor);
  text("Score: " + score, width/2, height/14);
  text("Score: " + score, width/2, height - height/14);
  
}

/* KEYPRESS COMMANDS */

void keyPressed() {
  
  if (gameState == 0) {
    if (key == ENTER) {
      gameState = 1;
    }
  }
  if (gameState == 4) {
    if (key == ENTER) {
      i = 0;
      j = 0;
      startMillis = 0;
      userArray = new int[0];
      gameArray = new int[1];
      initialize(gameArray, 1, 5);
      gameState = 1;
    }
  }
  if (gameState == 2) {
     minim = new Minim(this);
     s1 = minim.loadFile("t1.mp3");
     s2 = minim.loadFile("t2.mp3");
     s3 = minim.loadFile("t3.mp3");
     s4 = minim.loadFile("t4.mp3");
    if (key == '1') {
      s1.play();
      sRed = color(225,0,0);
      sGreen = color(0);
      sYellow = color(0);
      sBlue = color(0);
      userArray = append(userArray, 1);
      j++;
      if (j >= 1) {
        compare();
      }
    } else if (key == '2') {
      s2.play();
      sRed = color(0);
      sGreen = color(0,225,0);
      sYellow = color(0);
      sBlue = color(0);
      userArray = append(userArray, 2);
      j++;
      if (j >= 1) {
        compare();
      }
    } else if (key == '3') {
      s3.play();
      sRed = color(0);
      sGreen = color(0);
      sYellow = color(250,225,0);
      sBlue = color(0);
      userArray = append(userArray, 3);
      j++;
      if (j >= 1) {
        compare();
      }
    } else if (key == '4') {
      s4.play();
      sRed = color(0);
      sGreen = color(0);
      sYellow = color(0);
      sBlue = color(0,0,225);
      userArray = append(userArray, 4);
      j++;
      if (j >= 1) {
        compare();
      }
    };
  };
  
}

/* COMPARE gameArray and userArray */

void compare() {
  
  arrayItem = j - 1;
  if (userArray[arrayItem] != gameArray[arrayItem]) {
    gameState = 4;
  }
  if (gameState != 4 && j == gameArray.length) {
      gameArray = append(gameArray, int(random(1, 5)));
      userArray = new int[0];
      i = 0;
      j = 0;
      gameState = 3;
  }
  
}

/* PLAYS THROUGH gameArray */

void playBoard() {
  
  if (i < gameArray.length) {
    if (gameArray[i] == 1) {
      s1.play( );
      sRed = color(225,0,0);
      sGreen = color(0);
      sYellow = color(0);
      sBlue = color(0);
    } else if (gameArray[i] == 2) {
      s2.play( );
      sRed = color(0);
      sGreen = color(0,225,0);
      sYellow = color(0);
      sBlue = color(0);
    } else if (gameArray[i] == 3) {
      s3.play( );
      sRed = color(0);
      sGreen = color(0);
      sYellow = color(250,225,0);
      sBlue = color(0);
    } else if (gameArray[i] == 4) {
      s4.play( );
      sRed = color(0);
      sGreen = color(0);
      sYellow = color(0);
      sBlue = color(0,0,225);
    } else {
      sRed = color(0);
      sGreen = color(0);
      sYellow = color(0);
      sBlue = color(0);
    }
    startMillis++;
    if (startMillis >= 50) {
      i += 1;
      startMillis = 0;
      minim = new Minim(this);
      s1 = minim.loadFile("t1.mp3");
      s2 = minim.loadFile("t2.mp3");
      s3 = minim.loadFile("t3.mp3");
      s4 = minim.loadFile("t4.mp3");
    }
  } else if (i >= gameArray.length) {
      sRed = color(0);
      sGreen = color(0);
      sYellow = color(0);
      sBlue = color (0);
      gameState = 2;
  };
  
}

/* DRAWS RECTANGLES */

void drawRects() {
  
  rectMode(CENTER);
  fill(sRed);
  rect(width/4,height/4,diam,diam);
  fill(sGreen);
  rect(width - width/4,height/4,diam,diam);
  fill(sYellow);
  rect(width/4,height - height/4,diam,diam);
  fill(sBlue);
  rect(width - width/4,height - height/4,diam,diam);
  textAlign(CENTER, CENTER);
  fill(255);
  text("1", width/4,height/4);
  text("2", width - width/4,height/4);
  text("3", width/4,height - height/4);
  text("4", width - width/4,height - height/4);
  
}
  
void stop() {
  
  s1.close();
  s2.close();
  s3.close();
  s4.close();
  minim.stop();
  super.stop(); 
  
}

