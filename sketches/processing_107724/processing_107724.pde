
//declarations
Title titles; 
Balls ball;
Circles circle;




//background
int borderSize = 50;
int outerBorderSize = 15;
int screenWidth = 1100;
int screenHeight = 800;
int gameFrameWidth = screenWidth - 2 * borderSize;
int gameFrameHeight = screenHeight - 2 * borderSize;
int recX = (screenWidth - gameFrameWidth)/2;
int recY = (screenHeight - gameFrameHeight)/2;

//colors 
color colorBg = #0F0000;//#150101;
//color colorBorder = #CE0000;
color[] colorBorderArray = {
  #CE0000, #B50000, #A30000, #960000, #870000, #6E0000, #570000, #330000, #1C0000, #0F0000
};

//counters
int collisionCounter = 0;
int intervalCounter = 0;

//words
int voiceSpeed;
int voiceDecrease;
int wordNumber = 1;
String[] wordArray = {"mother", "do", "you", "think", "they'll", "drop", "the", "bomb",
"mother", "do", "you", "think", "they'll", "like", "this", "song",
//"mother", "do", "you", "think", "they'll", "try", "to", "break", "my", "balls",
//"mother", "should", "I", "build", "a", "wall",
"mother", "should", "I", "run", "for", "president",
"mother", "should", "I", "trust", "the", "government",
"mother", "will", "they", "put", "me", "in", "the", "firing", "line",
"is", "it", "just", "a", "waste", "of", "time", 
"hush", "now", "baby", "don't", "you", "cry", 
"mama's", "gonna", "make", "all", "of", "your",
"nightmares", "nightmares", "come", "come", "true"};



void setup() {
  size(1100, 800);
  frameRate(20);
  smooth();
  drawStage();
  drawBorder();
  drawBall();
  titles = new Title();
  circle = new Circles();
  println(wordArray.length);
  voiceSpeed = 200;
  voiceDecrease = ceil(voiceSpeed / wordArray.length) + 1;
}


void draw() {
  if(titles.titleBoolean) {
    if(mousePressed) {
      titles.titleBoolean = false; 
      print("Mouse pressed. ");
      Voice.say(wordArray[0], Voice.ALEX, voiceSpeed);
    }
  }
  if(titles.titleBoolean == false) {
    drawStage();
    
    titles.drawTitle();
    if (ball.collision == true) {
      collideFunction();
    }
    if (collisionCounter > 0) {
      circle.drawCircles(intervalCounter);
    }
    ball.update();
    drawBorder();
  }
}


//collision function
void collideFunction() {
  circle.vectorX = ball.x;
  circle.vectorY = ball.y;
  collisionCounter += 1; 
  countCollisionRank();
  println("Col: " + collisionCounter + ", Int: " + intervalCounter + ". ");
  ball.collision = false;
  //this occurs when it collides
  if (wordNumber < wordArray.length) {
    Voice.say(wordArray[wordNumber], Voice.ALEX, voiceSpeed);
    wordNumber += 1;
    if (voiceSpeed >= 1) {
      voiceSpeed -= voiceDecrease; 
    }
  }
}

//draw functions 
void drawBall() {
  int xBall = 286;
  int yBall = 377;
  ball = new Balls(xBall, yBall);
}

void drawStage() {
  drawBg();
  drawOblongs();
  drawMotherboard();
  
}


void drawBg() {
  background(colorBg);
}

void drawOblongs() {
  
}

void drawMotherboard() {
  noStroke();
  rectMode(CORNER);
  ellipseMode(CORNER); 
  fill(colorBorderArray[intervalCounter]);
  
  rect (760, 250, 2, 277);
  rect (0, 250, 760, 2);
  rect (0, 525, 762, 2);
  
  rect (805, 250, 2, 177);
  rect (850, 250, 2, 177);
  rect (805, 250, 47, 2);
  rect (805, 427, 47, 2);
  
  rect (865, 250, 2, 177);
  rect (910, 250, 2, 177);
  rect (865, 250, 47, 2);
  rect (865, 427, 47, 2);
  
  rect (925, 250, 2, 177);
  rect (970, 250, 2, 177);
  rect (925, 250, 47, 2);
  rect (925, 427, 47, 2);
  
  rect (480, 570, 750, 2);
  rect (480, 570, 2, 50);
  //rect (830, 570, 2, 400);
  
  
  
  stroke(colorBorderArray[intervalCounter]);
  strokeWeight(2);
  noFill();
  
  
  
  ellipse(816, 447, 25, 25);
  ellipse(876, 447, 25, 25);
  ellipse(936, 470, 25, 25);
  
  ellipse(65, 65, 12, 12);
  ellipse(1024, 65, 12, 12);
  ellipse(65, 724, 12, 12);
  ellipse(1024, 724, 12, 12);
  
  //ellipses on top of bars 
  
  rect(200, 97, 130, 130);
  rect(345, 97, 50, 50);
  
  rect(348, 620, 300, 200);
  rect(240, 570, 90, 300);
  rect(100, 570, 30, 30);
  
  line(0, 132, 200, 132);
  line(0, 137, 200, 137);
  line(0, 142, 200, 142);
  line(0, 147, 200, 147);
  
  line(485, 575, 1100, 575);
  line(490, 580, 1100, 580);
  line(495, 585, 1100, 585);
  line(485, 575, 485, 620);
  line(490, 580, 490, 620);
  line(495, 585, 495, 620);
  
  rect(789, 620, 50, 50);
  
  /*
  rect (200, 170, 10, 80);
  rect (0, 170, 200, 10);
  rect (200, 220, 660, 2);
  rect (200, 210, 666, 2);
  rect (200, 200, 670, 2);
  rect (200, 190, 674, 2);
  rect (860, 220, 2, 580);
  rect (864, 210, 2, 584);
  rect (868, 200, 2, 588);
  rect (872, 190, 2, 592);
  */

  ellipseMode(CENTER); 
  rectMode(CENTER);
}


void drawBorder() {
  rectMode(CORNER);
  fill(colorBorderArray[intervalCounter]);
  noStroke();
  rect(0, 0, borderSize, screenHeight);
  rect(screenWidth - borderSize, 0, borderSize, screenHeight);
  rect(0, 0, screenWidth, borderSize);
  rect(0, screenHeight - borderSize, screenWidth, borderSize);
  fill(colorBg);
  rect(0, 0, outerBorderSize, screenHeight);
  rect(screenWidth - outerBorderSize, 0, outerBorderSize, screenHeight);
  rect(0, 0, screenWidth, outerBorderSize);
  rect(0, screenHeight - outerBorderSize, screenWidth, outerBorderSize);
  rectMode(CENTER);
}

void countCollisionRank() {
  int intervalSize = ceil((wordArray.length + 1) / colorBorderArray.length);
  intervalCounter = floor(collisionCounter / intervalSize);
  if (intervalCounter >= colorBorderArray.length) {
    intervalCounter = colorBorderArray.length - 1;
  }
  println(" col"+collisionCounter+"/interval"+intervalSize+ " wordarraysize"+wordArray.length);
}

import java.awt.geom.*;

public class Balls {
  
  int width = 50;
  int height = 50;
  
  float velX; 
  float velY; 
  float minVel = .5;
  float maxVel = 18;
  float velIncrease = .15;
  float velDecrease = 1.15;
  float yDecreaseMod = 1.5;
  float x;
  float y;
  
  //collision
  boolean collision = false;
  boolean collisionFirst = false;
  
  //for setposition 
  int x1;
  int y1;
  int x2;
  int y2;
  //for updateposition
  int xcentre;
  int ycentre;
  
  //for keystrokes
  int keyNumber = 1;
  
  color ballColor = colorBorderArray[0];
  color strokeColor = #000000;
  
  Balls(int X, int Y) {
    x = X;
    y = Y;
    fill(ballColor); 
    stroke(strokeColor);
    //strokeWeight(4);
    noStroke();
    smooth();
    ellipseMode(CORNER);
    ellipse(x, y, width, height); 
    ellipseMode(CENTER);
    //setPosition(x, y);
    velX = 4; 
    velY = -1.8; 
  }
  
  void update() {
    modBallKeyVelocity();
    updatePosition();
    //setPosition();
    drawYourself();
  }
    
  void modBallKeyVelocity() {
    increaseBallKeyVelocity();
    if (keyPressed) {
      if (key == 'm' && keyNumber == 1) {
        slowBallKeyVelocity();
        keyNumber += 1;
        println("m");
      }
      if (key == 'o' && keyNumber == 2) {
        slowBallKeyVelocity();
        keyNumber += 1;
        println("o");
      }
      if (key == 't' && keyNumber == 3) {
        slowBallKeyVelocity();
        keyNumber += 1;
        println("t");
      }
      if (key == 'h' && keyNumber == 4) {
        slowBallKeyVelocity();
        keyNumber += 1;
        println("h");
      }
      if (key == 'e' && keyNumber == 5) {
        slowBallKeyVelocity();
        keyNumber += 1;
        println("e");
      }
      if (key == 'r' && keyNumber == 6) {
        slowBallKeyVelocity();
        keyNumber -= 5;
        println("r");
      }
    }
  }
  
  void slowBallKeyVelocity() {
    //velDecrease += random(-velDecrease/8, velDecrease/2);
    if (velX > minVel) {
      velX -= velDecrease;
    }
    else if (velX < -minVel) {
      velX += velDecrease;
    }
    if (velY > minVel) {
      velY -= velDecrease * yDecreaseMod;
    }
    else if (velY < -minVel) {
      velY += velDecrease * yDecreaseMod;
    }
  }
  
  void increaseBallKeyVelocity() {
    //velIncrease += random(velIncrease/4);
    if (velX > 0 && velX < maxVel) {
      velX += velIncrease;
    }
    else if (velX < 0 && velX > -maxVel) {
      velX -= velIncrease;
    }
    if (velY > 0 && velY < maxVel) {
      velY += velIncrease * yDecreaseMod;
    }
    else if (velY < 0 && velY > -maxVel) {
      velY -= velIncrease * yDecreaseMod;
    }
  }
  
  void updatePosition() {
    x += velX;
    y += velY;
    // collision with limits
    ellipseMode(CORNER);
    if(x <= borderSize || x >= screenWidth - borderSize - width){
      velX = -velX;
      collision = true;
      //x = constrain(x, 0, gameFrameWidth - width);
      println("collisionx");
    }
    if(y <= borderSize || y >= screenHeight - borderSize - height){
      velY = -velY;
      collision = true;
      //y = constrain(y, 0, gameFrameHeight - height);
      println("collisiony");
    }
    ellipseMode(CENTER);
    //xcentre = x + width / 2;
    //ycentre = y + height / 2;
  }
  
  /*
  void setPosition(int X, int Y) {
    x1 = X;
    y1 = Y;
    x2 = x1 + width;
    y2 = y1 + height;
  }
  */
  
  void drawYourself(){
    ellipseMode(CORNER);
    fill(ballColor); 
    stroke(strokeColor);
    noStroke();
    //strokeWeight(4);
    smooth();
    ellipse(x, y, width, height); 
    ellipseMode(CENTER);
  }
}
import java.awt.geom.*;

public class Circles {

  float vectorX = 0;
  float vectorY = 0;
  
  int[] numberArray = {6, 30, 50, 100, 200, 400}; 
  int[] distanceArray = {100, 300, 500, 700, 1000, 1100}; 
  int[] sizeArray = {300, 200, 100, 35, 10, 7}; 
  color[] colorArray = {#FFE5EE, #FFCBDE, #FCA3C3, #FC75A5, #FF508D, #000000, #84CCF2, #84CCF2, #84CCF2, #84CCF2, #84CCF2, #84CCF2};
  color[] colorArray2 = {#FFE5EE, #FFCBDE, #FC75A5, #FF508D, #DB328A, #BF1FAA, #8F1AA3, #4712B3, #0F0FBA, #001C8A, #002466, #001E57, #001F42, #002133, #002E33, #002E33};
  //color[] strokeArray = {#84CCF2, #84CCF2, #84CCF2, #84CCF2, #84CCF2, #84CCF2, #84CCF2, #84CCF2, #84CCF2, #84CCF2, #84CCF2, #84CCF2};
  
  //circle opacity control
  float curOpacity = 50;
  float increaseOpacity = (200 - curOpacity) / 9;
  
  
  void drawCircles(int colCount) {
    //stroke(strokeArray[colCount], 100);
    //strokeWeight(.5);
    noStroke();
    int k;
    int m;
    
    for (k = 0; k < (numberArray.length); k++) {
      for (m = 0; m < numberArray[k]; m++) {
        fill(colorArray2[k + colCount], curOpacity + increaseOpacity * colCount); //this is affected by both the collision counter and the distance, k+the current collision counter 
        float randomRotate = 1 / random(.1, 50);

        int randomNum = 100;
        float randomX = random(-randomNum, randomNum);// + 
        float randomY = random(-randomNum, randomNum);// + distanceArray[k]; maybe add distancearrayk into the random part

        if (randomX >= 0) {
          randomX += random(-100, distanceArray[k]);
        }
        else {
          randomX -= random(-100, distanceArray[k]);
        }
        if (randomY >= 0) {
          randomY += random(-100, distanceArray[k]);
        }
        else {
          randomY -= random(-100, distanceArray[k]);
        }
        ellipse(vectorX + randomX, vectorY + randomY, sizeArray[k], sizeArray[k]);
      }
    }
  }
}
import java.awt.geom.*;

public class Title {
  
  String titleText = "Mother";
  PFont titleFont;
  int titleSize = 200;
  String instText = "Type 'mother' repeatedly to slow your passage. Click to start.";
  int instSize = 20;
  boolean titleBoolean = true;
  
  Title() {
    drawTitle();
  }
  
  void drawTitle() {
    fill(colorBorderArray[intervalCounter]);
    textAlign(CENTER);
    titleFont = createFont("Georgia", titleSize, true); //true refers to anti-aliasing
    textFont(titleFont, titleSize);
    text(titleText, 400, 450); //x and y positions
    textFont(titleFont, instSize);
    text(instText, 400, 480);
  }
}
import java.io.IOException;
 
static class Voice extends Object {
  static final String ALEX = "Alex";

  // this sends the "say" command to the terminal with the appropriate args
  static void say(String script, String voice, int speed) {
    try {
      Runtime.getRuntime().exec(new String[] {"say", "-v", voice, "[[rate " + speed + "]]" + script});
    }
    catch (IOException e) {
      System.err.println("IOException");
    }
  }
  
  // Overload the say method so we can call it with fewer arguments and basic defaults
  static void say(String script) {
    // 200 seems like a resonable default speed
    say(script, ALEX, 200);
  }
  
}


