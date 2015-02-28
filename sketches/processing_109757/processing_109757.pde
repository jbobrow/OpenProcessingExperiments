
/*


if you release, it 


bar is half second, ball is full second
-the candy exists away from the pinata until you press, after which it moves near the mouth of the pinata, and
then when you release it disappears 

the next candy appears immediately when you PRESS, so that you can release any time you want, but too fast or 
too slow and the pinata gets nausea 
-one second after you release and 
-should you always feed it the next one immediately? maybe if it's nauseous and you feed it again within 1 second, you
don't get the point for the next one, wheras if you wait for it to stop being nauseous you get a point 





*/

Candy candy;

int numOfSeconds;
int framerate = 20;
int timer;
int timerSeconds;
int score;


color bgColor = #DCADC6;
color pinataColor = #8CE7FE;
color wordColor = #FFE78C;

boolean buttonDown = false;
boolean timerReset = false;



String explanationWord = "Feed the pinata as much as possible within 30 seconds. Hold SPACE to give candy. Release when you feel the pinata's chewed it. Hold the rectangle chocolate bar for .5 seconds, and the circle jawbreaker for 1 second. If you feel you messed up the timing, wait .5 seconds for it to stop being nauseous. R to restart.";
String stateWord; 
String timeWord;
String scoreWord;

void setup() {
  size(400, 400);
  noStroke();
  
  frameRate(framerate);
  restartGame();
}


void restartGame() {
  drawBackground();
  numOfSeconds = 30;
  timer = 0;
  timerSeconds = 0;
  score = 0;
  timerReset = true;
  loop();
  
}



void draw() {
  drawBackground();
  drawPinata();
  drawWord();
  drawCandy();
  timerCheck();
}

void drawBackground() {
  background(bgColor);
  fill(wordColor);
}

void drawPinata() {
  fill(pinataColor);
  rect(30, 240, 30, 80);
  rect(100, 240, 30, 80);
  rect(30, 200, 100, 100);
  //tail
  rect(20, 200, 20, 20);
  //neck
  rect(120, 200, 20, 30);
  //head 
  rect(130, 160, 50, 70);
  rect(180, 190, 20, 40);
}



void drawWord() {
  textSize(11);
  fill(pinataColor);
  text(explanationWord, 20, 20, width - 40, 100);
  textSize(20);
  text("State", 20, height - 30);
  text("Size " + score, 200, height - 30);
  text("Time " + numOfSeconds, 300, height - 30);
}

void drawCandy() {
  if(timerReset) {
    generateCandy();
    timerReset = false;
  }
  candy.drawCandy(candy.type);
}

void timerCheck() {
  if(buttonDown) {
    timer++;
  }
  timerSeconds++;
  numOfSeconds = 30 - floor(timerSeconds/framerate);
  if(numOfSeconds == 0) {
    noLoop();
  }
}


void generateCandy() {
  candy = new Candy();
}




void keyPressed() {
  if(key == ' ') {
    buttonDown = true;
  }
  if(key == 'r') {
    restartGame();
  }
}


void keyReleased() {
  if(key == ' ') {
    checkCandySuccess();
    buttonDown = false;
    //reset timer
    timer = 0;
    timerReset = true;
    
  }
}

void checkCandySuccess() {
  float P = 1;
  if(candy.type == "Rect") {
    P = .5;
  }
  else if (candy.type == "Ellipse") {
    P = 1;
  }
  float margin = .2;
  if((timer > framerate*P - framerate*margin) && (timer < framerate*P + framerate*margin)) {
    score++;
    //println("succeeded");
  }
  else {
    //println("failed");
  }
}

import java.awt.geom.*;


public class Candy {
  
  
  String type; 
  
  color ellipseCandyColor = #B1FE94;
  color rectCandyColor = #C480E8;
  
  Candy() {
    chooseType();
    drawCandy(type);
    
  }
  
  void drawCandy(String Type) {
    int X = 300;
    if(buttonDown) { 
      X -= 90;
    }
    if(type == "Rect") {
      fill(rectCandyColor);
      rect(X, 180, 50, 50);
    }
    else if(type == "Ellipse") {
      fill(ellipseCandyColor);
      ellipseMode(CORNER);
      ellipse(X, 180, 50, 50);
    }
  }
  
  
  void chooseType() {
    int typeNum = round(random(1));
    if(typeNum == 0) {
      type = "Rect";
    }
    else {
      type = "Ellipse";
    }
  }
}


