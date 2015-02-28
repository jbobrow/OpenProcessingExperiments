
/* @pjs preload="MatchstickMan.png, MatchstickManFlip.png, begin.png, cage1.png, caption.png, end.png"; 
 */

boolean debug = false;
Matchstick a = new Matchstick();
int distanceOfStep = 50;
int adjustToStep = 5;
int moveMan = 35;
PVector moveVector, upper, lower;
ArrayList<Integer> l = new ArrayList<Integer>();
Stairs s;
ArrayList<Step> allSteps = new ArrayList<Step>();
boolean leftTurn = true;
int gameState ; // 0--> beginning 1---> in the game 2---> game over
int translateSpeed = 8;

void setup() {
//  println("\tstarting setup().");
  leftTurn = true;
  moveVector = new PVector(0, 0);
  upper = new PVector(0, 0);
  lower = new PVector(0, 700);
  s = new Stairs();
  size(600, 700);
  background(20, 227, 154);
  for (int a = 0;a < 50;a++) {
    l.add((int)random(3, 5));
  }
  frameRate(20);
  if ( debug ) println("\tdone setup().");
}

void draw() {
  background(20, 227, 154);  
  
  if (debug) println("**** START draw() :: gameState = " + gameState); 

  if (gameState == 0) {
    PImage cage = loadImage("cage1.png");
    image(cage ,0,10);
    PImage caption = loadImage("caption.png");
    image(caption ,50,300);
    if (debug) println("if() for gameState = 0");
    PImage c = loadImage("begin.png");
    image(c, 435, 50);
    if (debug) println("** END if() for gameState = 0");
    text("Mactchstick man runs faster when he is on step.\nMatchstick man dies when he is off the screen, so the trick is to maintain him in the middle of the screem",10 ,600);
  }
  if (debug) print("OUTSIDE gameState==0 if() statement"); 
  
  // 425pm
  if (gameState == 1) {
     stroke(204, 0, 0);
     strokeWeight(50);   
     line(0,0, width,0);
     if (debug) println("if() for gameState = 1");
     stroke(0);
     moveVector.y -= translateSpeed;
     upper.y += translateSpeed;
     lower.y += translateSpeed;
    
    strokeWeight(1);
    translate(0, moveVector.y);
    text("Score:"+ (int)(a.curLocY  / 10), 20, 200 - moveVector.y);  
    s.drawStairs(4, 0.8 * width, 0.2 * height);
    s.drawReverseStairs(4, s.initialReversePointX, s.initialReversePointY);

    for (int b = 0;b < 100;b++) {
      s.drawStairs(l.get(b), s.getFinalPointA(), s.getFinalPointB());
      s.drawReverseStairs(l.get(b), s.initialReversePointX, s.initialReversePointY);
    }

    if (leftTurn) {
      if ( a == null ) println("reach draw");
      if (!a.isOnStep(allSteps)) {

        a.drawMatchstick();
        a.v.y += adjustToStep;
        a.v.x -= adjustToStep;
      }
      else {
        a.v.x -= moveMan;
        a.drawMatchstick();
        a.v.y += moveMan;
      }
    }
    else if (!leftTurn) {
      if (!a.isOnStep(allSteps)) {
        a.drawMatchstick();
        a.v2.y += adjustToStep;
        a.v2.x += adjustToStep;
      }
      else {
        a.v2.x += moveMan;
        a.drawMatchstick();
        a.v2.y += moveMan;
      }
    }
  }
  else if (gameState == 2) {
    if (debug) println("if() for gameState = 2");
    text("LOST!!\n" + "Final Score:" + (int)(a.curLocY / 10 )+ " \nPress 'R' to restart.", width / 2 - 100, 200);
    PImage end = loadImage("end.png");
    image(end ,40,250);
  } 
  else { //shouldn't be needed...
    if (debug) println("if() for gameState = OTHER");
  }
  
  //425pm
  if (debug) print("checking for possible transition to gameState=2...");
  if ( a == null ) { a = new Matchstick(); }
  if (upper.y > a.curLocY || lower.y < a.curLocY || a.curLocX > width || a.curLocX < 0) {
    if ( debug ) println("setting gameState to 2.");
    gameState = 2;
  } else {
    if ( debug ) println("NOT setting gameState to 2.");
    return;
  }
}
void keyPressed() {
  if (key == CODED) {
    if (debug) println("coded keypress detected; key = " + key);
    if (keyCode == RIGHT) {
      leftTurn = false;
    }
    else if (keyCode == LEFT) {
      leftTurn = true;
    }
  }
  else {
    if (debug) println("non-codedkey press detected; key = " + key);
    if (key == 'M' || key == 'm') {
      if ( debug ) println("m|M pressed...");
      a = new Matchstick();
      gameState = 1;
      distanceOfStep = 50;
      moveMan = 30;
      translateSpeed = 8;
      if (debug) println("gameState is now " + gameState);
      //redraw();
    }
    else if (key == 'H'|| key == 'h') {
      if (debug) println("prior:  " + gameState);
      a = new Matchstick();
      gameState = 1;
      distanceOfStep = 65;
      moveMan = 40;
      translateSpeed = 11;
      if (debug) println("gameState is now " + gameState);
    }
    else if (key == 'R' || key == 'r') {
      setup();
      a = new Matchstick();
      gameState = 1;
      distanceOfStep = 50;
      moveMan = 35;
      translateSpeed = 8;
      gameState = 0;
    }
  }
}



class Matchstick {
  float curLocX = 0.0;
  float curLocY = 0.0;
  PVector v = new PVector(0, 0);
  PVector v2 = new PVector(0, 0);

  void drawMatchstick() {
    if (leftTurn) {
      PImage p = loadImage("MatchstickMan.png");

      this.curLocX = 0.8 * width + v.x + v2.x;
      this.curLocY = 0.2 * height + v.y + v2.y; ///problem is here, can'determined the location
      image(p, curLocX - 50, curLocY - 40);
    }
    else {
      PImage flip = loadImage("MatchstickManFlip.png");
      curLocX = 0.8 * width + v.x + v2.x;
      curLocY = 0.2 * height + v.y + v2.y;
      image(flip, curLocX, curLocY - 30);
    }
  }
  void increaseCurLocY(float a) {
    curLocY += a;
  }
  boolean isOnStep(ArrayList<Step> a) {
    for (Step s: a) {

      if ( (curLocY == s.finalY - 45) && 
        ((curLocX >= s.finalX && curLocX <= s.initialX) || 
        (curLocX <= s.finalX && curLocX >= s.initialX))) {
      
          if (debug) println("on step " + s);

        return true;
      }
    }
 
    return false;
  }
  boolean needGoForward(ArrayList<Step> a) {
    boolean needGoForward = false;
    for (Step s:a) { 
      if (needGoForward) return needGoForward;
      needGoForward = ((curLocX >= s.finalX && curLocX <= s.initialX) || (curLocX <= s.finalX && curLocX >= s.initialX));
    }  
    return needGoForward;
  }
}

class Stairs {
  float initialReversePointX;  // to start reverse stairs
  float initialReversePointY;  // to start reverse stairs
  float finalPA;  // used to create next iteration
  float finalPB;  // used to create next iteration

  //draw regular stairsf
  void drawStairs(int a, float pX, float pY) {
    //make columns
    float pointX = pX;
    float pointY = pY;
    float finalPointX = pointX;
    float finalPointY = pointY + distanceOfStep;
    for (int i = 0; i < a;i++) {
      Step cur = new Step();
      cur.drawStep(pointX, pointY, finalPointX, finalPointY);
      //line(pointX, pointY, finalPointX, finalPointY);
      pointX -= distanceOfStep; 
      pointY += distanceOfStep;
      finalPointX -= distanceOfStep;
      finalPointY += distanceOfStep;
    }
    //make rows
    float pointA = pX;
    float pointB = pY + distanceOfStep;
    float finalPointA = pointA - distanceOfStep;
    float finalPointB = pY + distanceOfStep;
    for (int j = 0; j < a;j++) {
      // line(pointA, pointB, finalPointA, finalPointB);
      Step cur = new Step();
      cur.drawStep(pointA, pointB, finalPointA, finalPointB);
      allSteps.add(cur);
      pointA -= distanceOfStep; 
      pointB += distanceOfStep;
      finalPointA -= distanceOfStep;
      finalPointB += distanceOfStep;
    }
    line(finalPointA + distanceOfStep, finalPointB - distanceOfStep / 2, finalPointA - distanceOfStep, finalPointB - distanceOfStep / 2);
    line(pX, pY +distanceOfStep, finalPointA + 2 * distanceOfStep, finalPointB - distanceOfStep);
    initialReversePointX = finalPointA + distanceOfStep;
    initialReversePointY = finalPointB - distanceOfStep;
  }

  //make reverse stairs
  void drawReverseStairs(int a, float x, float y ) {
    //make columns;
    float pInitialX = x;
    float pInitialY = y;
    float pFinalX = x;
    float pFinalY = y + distanceOfStep;
    for (int i = 0; i < a;i++) {
      //  line(pInitialX, pInitialY, pFinalX, pFinalY);
      Step cur = new Step();
      cur.drawStep(pInitialX, pInitialY, pFinalX, pFinalY);
      pInitialX += distanceOfStep; 
      pInitialY += distanceOfStep;
      pFinalX += distanceOfStep;
      pFinalY += distanceOfStep;
    }

    //make rows
    float pInitialA = initialReversePointX;
    float pInitialB = initialReversePointY + distanceOfStep;      
    float pFinalA = initialReversePointX + distanceOfStep;
    float pFinalB = pInitialB;
    for (int i = 0; i < a;i++) {
      // line(pInitialA, pInitialB, pFinalA, pFinalB);
      Step cur = new Step();
      cur.drawStep(pInitialA, pInitialB, pFinalA, pFinalB);
      allSteps.add(cur);
      pInitialA += distanceOfStep; 
      pInitialB += distanceOfStep;
      pFinalA += distanceOfStep;
      pFinalB += distanceOfStep;
    }
    finalPA = pFinalA - distanceOfStep;
    finalPB = pFinalB - distanceOfStep;
    line(finalPA, finalPB + distanceOfStep / 2, finalPA + 2 * distanceOfStep, finalPB + distanceOfStep / 2);
    line(x, y + distanceOfStep, finalPA - distanceOfStep, finalPB);
  }
  float getFinalPointA() {
    return finalPA;
  }

  float getFinalPointB() {
    return finalPB;
  }
}

class Step {
  float initialX;
  float initialY;
  float finalX;
  float finalY;

  void drawStep(float x, float y, float fX, float fY) {
    initialX = x;
    initialY = y;
    finalX = fX;
    finalY = fY;
    line(x, y, fX, fY);
  }
}



