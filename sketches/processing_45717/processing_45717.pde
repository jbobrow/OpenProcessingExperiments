
float ballX=50, ballY=50, ballW=25, ballH=25; 
float oldx, oldy; 
float gravity, xspeed=3.0 ,yspeed=3.0; 
boolean pressedW=false, pressedA=false, pressedD=false, pressedS=true;
int gravSwitch=1;   //2nd game mode of gravity  pong
int gameMode = 0, score, theHighScore; 
boolean gameStart = false;  
int[] barrierAlpha = new int[5], barrierLevel = new int[6], buttonAlpha = new int[5]; //put one extra to counteract out of bounds 
color[] barrierC = new color[5]; 
PImage target, gravPongT, gravPuzzleT, testGravT, backgroundImage, gravHandbook; 
float tarX=width/2, tarY=height/2, tarW=50, tarH=50; 
String gravLevel, missionStatement; 
boolean switchGrav = false; 
int puzzleLevel = 0, lives = 10; 
float[] obstacleX = new float[5], obstacleY = new float[5]; 
float obstacleW=50, obstacleH=50; 
float shiftBox = 0, shiftBoxY; //i need this to change the box position when you hit target
float rad=0, deg=0, ampShift=300; 
int buttonW = 400, buttonH = 200; 
float levelUp=1.5; 
PFont titleF, myFont, scoreFont; 
int[] newScore = new int[3], highScore = new int[3]; 
int counter;
String[] lines; 


// an array of my own class
Paddle[]  pad = new Paddle[5];

void setup() {
  String[] lines = new String[3]; //mainly for my high scores
  
  int j; 
  
  size(1000,700); 
  background(0); 
  frameRate(60); 
  stroke(255); 
  smooth(); 
  frameRate(40); 
  
  //load up my fonts
  titleF = loadFont("BritannicBold-48.vlw"); 
  myFont = loadFont("CalifornianFB-Bold-48.vlw"); 
  scoreFont = loadFont("Calibri-Bold-48.vlw");
  
  //initilize picture variables, and my main text
  missionStatement ="Click Mouse To Begin"; 
  target = loadImage("targetPic.png"); 
  gravPongT = loadImage("GravityPongTitle.png"); 
  gravPuzzleT = loadImage("GravityPuzzle.png");
  testGravT = loadImage("testGravityTitle.png"); 
  
  //my two bg images
  backgroundImage = loadImage("backgroundPic.png"); 
  gravHandbook = loadImage("gameInstructions.png"); 
  
  //initilize my paddle class
  for (j=1; j<= 4; j++) { 
    pad[j] = new Paddle(50, 50, 50,50, color(#1BF200), j);
    barrierC[j] = color(#00D324); 
    barrierAlpha[j] = 255;
    barrierLevel[j] = 5; 
    buttonAlpha[j] = 50; 
    //the main thing i need for each paddle is the version number on end
    //otherwise properties are altered in pad[j].display()
  }
  
  //opening my savefile for Score
  lines = loadStrings("highScores.sav"); 
  highScore[1] = int(lines[1]); 
  highScore[2] = int(lines[2]); 
  
  
   
}

void draw() {
  int j=1;
  background(0); 
  image(backgroundImage, 0,0);
   
  if (gameStart == false) { //this is the title screen that will look better
     
    textAlign(CENTER); 
    fill(255); 
    textFont(titleF, 60); 
    text("Gravity Lord Training v1.03", width/2 - 10, 70);
    textFont(myFont, 50);  
    text(missionStatement, width/2 -5, height/2 + 40);
    textSize(20); 
    textAlign(LEFT); 
    text("Press R In Games, To Quit", 20, height-20); 
    
    //displaying high scores
    textFont(scoreFont, 20); 
    text("Gravity Puzzle HighScore is: " +str(highScore[1]), 20, 550); 
    text("Gravity   Pong HighScore is: " +str(highScore[2]), 20, 580); 
    textAlign(CENTER); 
    textFont(myFont);
    
     
    fill(#FF00E6,buttonAlpha[1]); //fill for rectangles
    //line(width/2, 0, width/2, height); 
    
    //button for Gravity Puzzle
    rectMode(CORNER); 
    rect(50, 100, buttonW, buttonH); 
    image(gravPuzzleT, 75, 125); 
    
    //button for Gravity Pong
    fill(#FF00E6,buttonAlpha[2]); //fill for rectangle
    rect(width-buttonW - 50, 100, buttonW, buttonH); 
    image(gravPongT, width-buttonW - 50 + 25,100 + 25); 
    
    //button for Gravity Testing
    fill(#FF00E6,buttonAlpha[3]); //fill for rectangle
    rect(width/2 - buttonW/2, height-buttonH - 50, buttonW, buttonH); 
    image(testGravT, width/2 - buttonW/2 + 25, height-buttonH - 50 + 25); 
    
    //button for instructions
    fill(#FF00E6,buttonAlpha[4]); //fill for rectangle
    rect(width-175, height-75, 150, 50); 
    textSize(25); 
    fill(255); 
    text("Instructions", width-100, height-42); 
    textSize(50); 
    
    
    buttonOver(); 
    if (mousePressed == true) {
     if (mouseY > 100 && mouseY < 100 + buttonH && mouseX > 50 && mouseX < 50 + buttonW) { //makes it so players can choose which game to play at start
      gameStart = true; 
      gameMode = 1;
      puzzleLevel = 0; 
      //println("Hi" + str(mouseX)); //checking if the event worked
      buttonAlpha[1] = 150; 
     }else if (mouseY > 100 && mouseY < 100 + buttonH && mouseX > width-450 && mouseX < width-450 + buttonW) {
        gameStart = true; 
        gameMode = 2; 
        score =0; 
    }else if(mouseY > height-250 && mouseY < height-250 + buttonH && mouseX > width/2-400/2 && mouseX < width/2-400/2 + buttonW) {
      gameStart = true; 
      gameMode = 3; 
    } else if (mouseY > height-75 && mouseY < height-25 && mouseX > width-175 && mouseX < width-175 + 100) {
      gameMode = 4; 
      gameStart = true; 
    }
    }
  }if (gameStart==true && gameMode == 1) { //first game mode of gravity Puzzle
    //noCursor(); 
    gravityBall(); 
    fill(#FF0303); 
    rect(ballX,ballY,ballW,ballH); 
    strokeWeight(2); 
    line(width/2, height, width/2, 0);  
    line(0, height/2, width, height/2);  
    
    //sets up the screen text
    fill(255); 
    textSize(20); 
    textAlign(LEFT); 
    text("Target Is Yellow!!", 20, height-20); 
    textAlign(CENTER); 
    textSize(50); 
    noFill();
    ellipse(width/2, height/2, width/2, height/2); 
    strokeWeight(1); 
    barriers(); 
    target(); 
    
    if (keyPressed) {
      //my key events are all done in method
      keyEvent(); 
    }
  } else if (gameStart == true && gameMode ==2) { //Second Game Mode of Gravity Pong
      noCursor(); 
      gravityPong(); 
      fill(#FF0303); 
      rect(ballX,ballY,ballW,ballH);
      fill(255); 
      textSize(40); 
      text("Score Is: " + str(score) + " points", width/2, height/2); 
      
      counter++; 
      text("Time Spent Is: " + str(counter/60) + "s", width/2, height/2 + 40); 
      if (counter/60 == 120) {
        missionStatement = "Game Over, Score Was: " + str(score); 
        resetGame(); 
      }
      
      line(mouseX, mouseY +height, mouseX, mouseY-height); 
      line(mouseX - width, mouseY, mouseX + width, mouseY); 
      //textSize(30); 
      textAlign(CENTER); 
      text("Gravity Level is: " + gravLevel, width/2, 150); 
      for (j=1; j<=4; j++) {
        pad[j].display();
        pad[j].hitBall();
      }
    }else if (gameStart ==  true && gameMode ==3) { //A Testing Mode So People can Get Used to Gravity
      gravTest(); 
      fill(#FF0303); 
      rect(ballX,ballY,ballW,ballH); 
      if (keyPressed) {
        keyEvent(); 
    }
    fill(255); 
    textAlign(LEFT); 
    text("Press R To Quit", 20, height-20); 
  }else if (gameStart==true && gameMode ==4) { // my instructions were easier to put in as another mode
    image(gravHandbook, 0, 0); 
    gravTest(); 
      fill(#0000FF); 
      rect(ballX,ballY,ballW,ballH); 
      if (keyPressed) {
        keyEvent(); 
    }
  }
}

void keyPressed() {
  if (keyPressed) {
    if (key == 'r' || key =='R') {
      resetGame(); //my main method that resets my game/ variables (self explanatory)
    }
  }
}

void buttonOver() { //checks if the mouse is over a button, then makes button more opaque
  if (mouseY > 100 && mouseY < 100 + buttonH && mouseX > 50 && mouseX < 50 + buttonW) { //makes it so players can choose which game to play at start
      buttonAlpha[1] = 150; 
  }else {buttonAlpha[1] = 50; 
  }if (mouseY > 100 && mouseY < 100 + buttonH && mouseX > width-450 && mouseX < width-450 + buttonW) {
       buttonAlpha[2] = 150;
  }else {buttonAlpha[2] = 50; 
  }if(mouseY > height-250 && mouseY < height-250 + buttonH && mouseX > width/2-400/2 && mouseX < width/2-400/2 + buttonW) {
      buttonAlpha[3] = 150;
  }else {buttonAlpha[3] = 50; 
  } if (mouseY > height-75 && mouseY < height-25 && mouseX > width-175 && mouseX < width-175 + 100) {
    buttonAlpha[4] = 150; 
  }else {buttonAlpha[4] = 50;
  }
}

int i=0; 
void barriers() {
  
  stroke(255); 
  for (i=1; i<=4; i++) {
    barrierC[i] = color(#00D324); 
  }
  
  
  rectMode(CORNER); 
  //noStroke(); 
  fill(barrierC[1], barrierAlpha[1]); 
  rect(0,0,10, height); //left barrier
  
  fill(barrierC[2], barrierAlpha[2]); 
  rect(width-10, 0,10, height); //right barrier
  
  fill(barrierC[3], barrierAlpha[3]); 
  rect(0,0, width,10);  //top barrier
  
  fill(barrierC[4], barrierAlpha[4]); 
  rect(0,height-10, width, 10); //bottom barrier
}

void gravityBall() {
  //good to store for bouncing ball back
  oldx = ballX ;
  oldy = ballY;
  
  //fixes the sticking to bottom glitch
  ballY = ballY + yspeed*2; 
  ballX = ballX + xspeed*2;
  
  //borders involve the dampening effect to bring down ball
  if (ballY < 0) {
    ballY = oldy;
    yspeed = -0.8*yspeed;
    barrierAlpha[3] = barrierAlpha[3] - 51; 
    barrierLevel[3] --; 
    if (barrierLevel[3] <=0) {
      barrierAlpha[3] =0;
      hitObstacle(); 
      barrierLevel[3] = 0; 
    }
  }else if (ballY + ballH > height) {
    ballY = oldy;
    yspeed = -0.8*yspeed;
    barrierAlpha[4] = barrierAlpha[4] - 51; 
    barrierLevel[4] --;
    if (barrierLevel[4] <=0) {
      barrierAlpha[4] =0;
      hitObstacle(); 
      barrierLevel[4] = 0; 
    }
  }else if (ballX < 0) { 
    ballX = oldx;
    xspeed = -0.8*xspeed;  
    barrierLevel[1] --; 
    barrierAlpha[1] = barrierAlpha[1] - 51;
    if (barrierLevel[1] <=0) {
      barrierAlpha[1] =0;
      hitObstacle(); 
      barrierLevel[1] = 0; 
    }
  } else if (ballX + ballW > width) {
    ballX = oldx;
    xspeed = -0.8*xspeed;  
    barrierLevel[2]--; 
    barrierAlpha[2] = barrierAlpha[2] - 51;
    if (barrierLevel[2] <=0) {
      barrierAlpha[2] =0;
      hitObstacle(); 
      barrierLevel[2] = 0; 
    }
    }

  //after knowing which key was pressed
  //make it bounce off of walls
  
  if (pressedS == true) {
    yspeed = yspeed +0.4;
    if (ballY + ballH > height) {
      barrierAlpha[4] = barrierAlpha[4] - 51; //decrease barrier
      barrierLevel[4]--; 
      yspeed = -0.6*yspeed; //reverse bounce
      ballY = height - ballH;
    } if (ballX <0) {
      ballX = -ballX;
      xspeed = -0.6*xspeed;
    }else if (ballX + ballW > width) {
      ballX = width-ballW;
      xspeed = -0.6*xspeed;
    }
  }
  if (pressedW == true) {
    yspeed = yspeed +-0.4;
    if (ballY + ballH > height) {
      yspeed = 0.6*yspeed; //reverse bounce
      ballY = height - ballH;
      barrierAlpha[3] = barrierAlpha[3] - 51;  //decrease barrier
      barrierLevel[3]--; 
    } if (ballX <0) {
      ballX = -ballX;
      xspeed = -0.6*xspeed;
    }else if (ballX + ballW > width) {
      ballX = width-ballW;
      xspeed = -0.6*xspeed;
    }
  }
    if (pressedA == true) {
      xspeed = xspeed + -0.4; 
      if (ballY + ballH > height) {
        xspeed = -0.6*xspeed; 
        ballY = height - ballH; 
      } if (ballX < 0) { 
        ballX = -ballX;
        xspeed = -0.6*xspeed;
        barrierAlpha[1] = barrierAlpha[1] - 51; //decrease barrier
        barrierLevel[1]--; 
      } else if (ballX + ballW > width) {
        ballX = width - ballW; 
        xspeed = -0.6*xspeed;
      }
    }
    if (pressedD == true) {
      xspeed = xspeed +0.4; 
      if (ballY + ballH > height) {
        xspeed = 0.6*xspeed; 
        ballY = height - ballH; 
      } if (ballX < 0) { 
        ballX = -ballX;
        xspeed = -0.6*xspeed;
      } else if (ballX + ballW > width) {
        ballX = width - ballW; 
        xspeed = -0.6*xspeed;
        barrierAlpha[2] = barrierAlpha[2] - 51; //decrease barrier
        barrierLevel[2]--; 
      }
    }
}

class Paddle {
  int xpos, ypos, rectW, rectH; 
  color c; 
  //whatSide is the main parameter that must be fufilled for paddles to do anything
  int whatSide; //1 = top, 2=bottom, 3=left, 4=right
  
  Paddle(int tempX, int tempY, int tempW, int tempH, color tempC, int tempSide) {
     ypos = tempY; 
     xpos = tempX;  
     rectW = tempW;
     rectH = tempH;
     c = tempC; 
     whatSide = tempSide;
  }
  
  void display() {
    stroke(255); 
    rectMode(CENTER); 
    fill(c); 
    // my display class is version specific
    if (whatSide ==1) {
      xpos = mouseX; 
      ypos = 30; 
      rectW = 140;
      rectH = 25;
    }else if (whatSide ==2) {
      xpos = mouseX; 
      ypos = height-30; 
      rectW = 140;
      rectH = 25;
    } else if (whatSide == 3) {
      xpos = 30; 
      ypos = mouseY; 
      rectW=25;
      rectH=140;
    } else if (whatSide == 4) {
      xpos = width-30; 
      ypos = mouseY; 
      rectW=25;
      rectH = 140; 
    }
    rect(xpos, ypos, rectW, rectH); 
  }
  
  void hitBall() {
    if (whatSide ==1) {
        //reflects ball for top paddle
        if (ballX>xpos-rectW/2 &&  ballX<xpos-rectW/2+rectW && ballY< ypos-rectH/2+rectH) {
        yspeed = -0.8*yspeed; 
        ballY = rectH + ypos+ballH;
        if (gravSwitch==1) {
        score++;
        switchGrav = false; 
        }
      }
    }
    if (whatSide ==2) {
      //reflects ball for bottom paddle
      if (ballX>xpos-rectW/2 && ballY >ypos-rectH/2-rectH && ballX<xpos-rectW/2+rectW && ballY< ypos-rectH/2+rectH) {
        yspeed = -0.8*yspeed; //reverse bounce
        ballY = ypos - ballH-ballH;
        if (gravSwitch ==2) {
          score++;
          switchGrav = false;  
        }
      }
    }
    if (whatSide ==3) {
      //reflect ball for left paddle
      if (ballY >ypos-rectH/2 && ballX < xpos-rectW/2 + rectW && ballY < ypos-rectH/2 + rectH && ballX - ballW < xpos-rectW/2 + rectW) {
        xspeed = -0.8*xspeed; 
        ballX = xpos + rectW+ballW;
        if (gravSwitch==3) {
          score++;
          switchGrav = false;
        } 
      }
   }
    if (whatSide ==4) {
      //reflects ball for right paddle
      if (ballY >ypos-rectH/2 &&  ballY < ypos-rectH/2 + rectH && ballX < xpos - rectW/2 && ballX + ballW > (xpos-rectW/2) /*+ rectW*/) {
        xspeed = -0.8*xspeed; 
        ballX = xpos - ballW - ballW;
        if (gravSwitch==4) {
          score++;
          switchGrav = false; 
        }
      }
    }
  }
}

void gravityPong() {
  
  
  //makes ball move
  ballY = ballY + yspeed*levelUp;
  ballX = ballX + xspeed*levelUp;
  
  if (score >=10 && score < 20) {
    levelUp=2.5;
 }else if (score >=20&& score < 30) {
    levelUp = 3.5;
 }else if (score >=30&& score < 40) {
    levelUp = 4.0;
   }
  
  if (score%2 == 1 && switchGrav == false || score%2 == -1 &&switchGrav ==false) {
    gravSwitch = int(random(1, 5)); 
    switchGrav = true; 
    xspeed = 2;
    yspeed = 2;
    ballY = random(height/2- height/6 + ballH, height/2 + height/6 + ballH); 
    ballX = random(width/2- width/6 + ballW, width/2 + width/6 + ballW); 
  }
  
 if (gravSwitch == 1) {
    wGravity(); 
    gravLevel = "Up";
  }else if(gravSwitch == 2) {
    sGravity(); 
    gravLevel = "Down";
  }else if (gravSwitch ==3) {
    aGravity(); 
    gravLevel = "Left";
  }else if (gravSwitch ==4) {
    dGravity();
    gravLevel = "Right";
  }
}

//make it bounce off of walls
//done in differnt methods for clarity
void sGravity() {
    yspeed = yspeed +0.4;
    if (ballY + ballH > height) {
      yspeed = -0.6*yspeed;
    }if (ballY + ballH > height) {
      yspeed = -0.6*yspeed; //reverse bounce
      ballY = height - ballH;
      score = score - 1;
      switchGrav = false;
      ballY = width/2 ;
      ballX = height/2;
    } if (ballX <0) {
      ballX = -ballX;
      xspeed = -0.6*xspeed;
    }else if (ballX + ballW > width) {
      ballX = width-ballW;
      xspeed = -0.6*xspeed;
    }
  }
  
  void dGravity() {
      xspeed = xspeed +0.4; 
      if (ballY + ballH > height) {
        yspeed = -0.6*yspeed;
      }if (ballY + ballH > height) {
        xspeed = 0.6*xspeed; 
        ballY = height - ballH; 
      } if (ballX < 0) { 
        ballX = -ballX;
        xspeed = -0.6*xspeed;
      } else if (ballX + ballW > width) {
        ballX = width - ballW; 
        xspeed = -0.6*xspeed;
        score = score - 1;
        switchGrav = false;
        ballY = width/2 ;
        ballX = height/2;
      }
    }
    
    //the left paddle will always make you lose score
    void aGravity() {
      xspeed = xspeed + -0.4; 
      if (ballY + ballH > height) {
        yspeed = -0.6*yspeed;
      }if (ballY + ballH > height) {
        xspeed = -0.6*xspeed; 
        ballY = height - ballH; 
      } if (ballX < 0) { 
        ballX = -ballX;
        xspeed = -0.6*xspeed;
        score = score - 1;
        switchGrav = false;
        ballY = width/2 ;
        ballX = height/2;
      } else if (ballX + ballW > width) {
        ballX = width - ballW; 
        xspeed = -0.6*xspeed;
      }
    }
void wGravity() {
  yspeed = yspeed +-0.4;
  if (ballY + ballH > height) {
    yspeed = -0.6*yspeed;
 }if (ballY < 0) {
    yspeed = 0.6*yspeed; //reverse bounce
    ballY = height - ballH;
    score = score - 1;
    switchGrav = false;
    ballY = width/2 ;
    ballX = height/2;
  } if (ballX <0) {
      ballX = -ballX;
      xspeed = -0.6*xspeed;
  }else if (ballX + ballW > width) {
      ballX = width-ballW;
      xspeed = -0.6*xspeed;
    }
    }
    
     void gravTest() {
 
  //good to store for bouncing ball back
  oldx = ballX ;
  oldy = ballY;
  
  //fixes the sticking to bottom glitch
  ballY = ballY + yspeed*2; 
  ballX = ballX + xspeed*2;

  //borders involve the dampening effect to bring down ball
  if (ballY < 0) {
    ballY = oldy;
    yspeed = -0.8*yspeed;
  }else if (ballY + ballH > height) {
    ballY = oldy;
    yspeed = -0.8*yspeed;
  }else if (ballX < 0) { 
    ballX = oldx;
    xspeed = -0.8*xspeed;  
  } else if (ballX + ballW > width) {
    ballX = oldx;
    xspeed = -0.8*xspeed;  
  }

  //after knowing which key was pressed
  //make it bounce off of walls
  
  if (pressedS == true) {
    yspeed = yspeed +0.4;
    if (ballY + ballH > height) {
      yspeed = -0.6*yspeed; //reverse bounce
      ballY = height - ballH;
    } if (ballX <0) {
      ballX = -ballX;
      xspeed = -0.6*xspeed;
    }else if (ballX + ballW > width) {
      ballX = width-ballW;
      xspeed = -0.6*xspeed;
    }
  }
  if (pressedW == true) {
    yspeed = yspeed +-0.4;
    if (ballY + ballH > height) {
      yspeed = 0.6*yspeed; //reverse bounce
      ballY = height - ballH;
    } if (ballX <0) {
      ballX = -ballX;
      xspeed = -0.6*xspeed;
    }else if (ballX + ballW > width) {
      ballX = width-ballW;
      xspeed = -0.6*xspeed;
    }
  }
    if (pressedA == true) {
      xspeed = xspeed + -0.4; 
      if (ballY + ballH > height) {
        xspeed = -0.6*xspeed; 
        ballY = height - ballH; 
      } if (ballX < 0) { 
        ballX = -ballX;
        xspeed = -0.6*xspeed;
      } else if (ballX + ballW > width) {
        ballX = width - ballW; 
        xspeed = -0.6*xspeed;
      }
    }
    if (pressedD == true) {
      xspeed = xspeed +0.4; 
      if (ballY + ballH > height) {
        xspeed = 0.6*xspeed; 
        ballY = height - ballH; 
      } if (ballX < 0) { 
        ballX = -ballX;
        xspeed = -0.6*xspeed;
      } else if (ballX + ballW > width) {
        ballX = width - ballW; 
        xspeed = -0.6*xspeed;
      }
    }
}

void keyEvent() {
  //determining what key was pressed
   if (key == 'W' || key == 'w') {
    pressedS = false;
    pressedW = true;
    pressedD = false;
    pressedA = false;
  }
  if (key == 'D' || key == 'd') {
    pressedS = false;
    pressedW = false;
    pressedD = true;
    pressedA = false;
  }
  if (key == 'S' || key == 's') {
    pressedS = true;
    pressedW = false;
    pressedD = false;
    pressedA = false;
  }
  if (key == 'A' || key == 'a') {
    pressedS = false;
    pressedW = false;
    pressedD = false;
    pressedA = true;
  }
  
  //incase of glitch resummon ball
  if (key == ENTER || key==RETURN) {
    ballX = mouseX;
    ballY = mouseY;
  }
}

void target() {
  int i =0, fix=1; //the fix variable fixes my array so it will work for only the obstacles that are active
  
  rectMode(CORNER); 
  tarX = width/2- tarW/2;
  tarY= height/2 - tarH/2;
  fill(#FA3932); 
  rect(tarX, tarY, tarW, tarH); 
  image(target, tarX, tarY); 
  fill(255); 
  stroke(255, 0, 0); 
  text("PuzzleLevel is: " + str(puzzleLevel), width/2, height-80);
  text("Lives Remaining: " + str(lives), width/2, 90); 
  
  if (ballY + ballH > tarY && ballY < tarY + tarH && ballX + ballW > tarX && ballX < tarX + tarW) {
    if (oldy + ballH  > tarY && oldy < tarY + tarH) {
              hitTarget(); 
    }else if (oldx + ballW > tarX && oldx<tarX + tarW) {
              hitTarget(); 
    }
  }

  //obstacles attached to target
  fill(0,0,255); 
  stroke(255);
  
  //first obstacle

  obstacleX[1] = tarX -100 /*(75 + 50)*/  + shiftBox;
  obstacleY[1] = tarY /*- tarH/2*/ + shiftBox; 
  rect(obstacleX[1], obstacleY[1] , obstacleW, obstacleH); 
  
  if (puzzleLevel > 2) {
    //second one
    obstacleX[2] = tarX + 100 - shiftBox; 
    obstacleY[2] = tarY - shiftBox; 
    rect(obstacleX[2], obstacleY[2],obstacleW, obstacleH);  
    fix =2; 
  } if (puzzleLevel >= 6) {
    // spinning Obstacle Three
    spinBall();
    ellipseMode(CENTER); 
    ellipse(obstacleX[3], obstacleY[3], 50, 50); 
    fix=3; 
  }
  
  //obstacle barriers in a method because in a for loop
  for (i=1; i<=fix; i++) {
    if (ballY + ballH > obstacleY[i] && ballY < obstacleY[i] + obstacleH) { 
      if (ballX + ballW > obstacleX[i] && ballX < obstacleX[i] + obstacleW) {
        hitObstacle(); 
      }
    }
  }
}
        
void hitTarget() {
  puzzleLevel ++; 
   
  ballX = 50;
  ballY = 50; 
  if (shiftBox == 0){
    shiftBox =100; 
    shiftBoxY = 200; 
  }else if (shiftBox ==100) {
    shiftBox = 0; 
    shiftBoxY = 100;
  }
  
    if (puzzleLevel >=6 ) {
      ampShift = ampShift-20;  
    if (ampShift == 0) {
      ampShift = -20; 
    }
    if (ampShift == -300) {
      ampShift =300;
      obstacleW = obstacleW + 10;
      obstacleH = obstacleH + 10;
    }
  }
  if (puzzleLevel%5 == 0) {
    for (i=1; i<=4; i++) {
      barrierAlpha[i] = 255;
      barrierLevel[i] = 5;
    }
  }
}

void spinBall() {
  deg = deg+5; 
  if (deg == 360) {
    deg =0; 
  }
  rad = (PI/180)*deg; // the formula
  
  obstacleX[3] = sin(rad)*ampShift+(tarX); 
  obstacleY[3] = cos(rad)*ampShift+(tarY); 
}

void hitObstacle() {
  lives--; 
  ballX = 50;
  ballY = 50;
  if (lives==0) {
    resetGame(); 
    missionStatement = "You lost At level : " + str(puzzleLevel); 
  }
}

void resetGame() {
  String[] lines = new String[3]; //mainly for my high scores
  
  int b = 1; 
  cursor(); 
  gameStart = false; 
  
  //resetting ball
  ballX = 50; 
  ballY= 50; 
  xspeed=3.0;
  yspeed=3.0; 
  
  //resetting gravity
  pressedS = true;
  pressedW = false;
  pressedD = false;
  pressedA = false;
  
  gravSwitch=1;
  switchGrav = false; 
  if (gameMode == 2) {
    missionStatement = "Your Gravity Pong Score Was: " + str(score); 
  } else if (gameMode == 3) {
    missionStatement = "You Have Practiced, Now Play the Real Game"; 
  }else if (gameMode == 1) {
    missionStatement = "GameOver You Died At puzzleLevel: " + str(puzzleLevel); 
  }
  gameMode=0; 
  lives=10; 
  
  //resetting barriers
  for (b=1; b<= 4; b++) { 
    barrierAlpha[b] = 255;
    barrierLevel[b] = 5; 
  }
  
  shiftBox =0;
  shiftBoxY=0;
  
  rad=0;
  deg=0;
//  puzzleLevel =0; 
//  score=0; 
  fill(255); 
  rect(50, 100, 400, 200); 
  rect(width-450, 100, 400, 200); 
  rect(width/2 - 400/2, height-250, 400, 200);
  levelUp = 1.5; 
  strokeWeight(1); 
  obstacleW = 50; 
  obstacleH = 50; 
  counter = 0; 
  ampShift = 300;
 
  
  //saving scores
  if (puzzleLevel > highScore[1]) {
    highScore[1] = puzzleLevel; 
  }if (score > highScore[2]) {
    highScore[2] = score;
  } 

  for (b=1; b<=2; b++) {
    lines[0] = "Ravi Says Hi! :D"; 
    lines[b] = str(highScore[b]); 
  }
  
  saveStrings("/data/highScores.sav", lines); 
  
  
  

}


