
Matchstick a = new Matchstick();
int distanceOfStep = 50;
PVector moveVector = new PVector(0, 0);
PVector moveMan = new PVector(-40, 40);
Stairs s = new Stairs();
ArrayList<Integer> l = new ArrayList<Integer>();
ArrayList<Step> allSteps = new ArrayList<Step>();
int counterForStep = 0;
boolean rightTurn = false;
boolean leftTurn = false;
 
 
void setup() {
  size(600, 700);
  background(20, 227, 154);
   for (int a = 0;a < 100;a++) {
    l.add((int)random(4, 9));
  }
  frameRate(20);
}
void keyPressed() {
  switch (keyCode) {
  case RIGHT:
  rightTurn = true;
  break;
  case LEFT:
  leftTurn = false;
  break;
  }
}
 
void draw() {
  background(20, 227, 154);
 text("press --> or <-- to change the walking direction when you are at the corner ",0.1 * width,0.3 * height);
  moveVector.y -= 5;
  translate(0,moveVector.y);
  s.drawStairs(4, 0.8 * width, 0.2 * height);
  s.drawReverseStairs(4, s.initialReversePointX, s.initialReversePointY);
  for (int a = 0;a < 10;a++) {
    s.drawStairs(l.get(a), s.getFinalPointA(), s.getFinalPointB());
    s.drawReverseStairs(l.get(a), s.initialReversePointX, s.initialReversePointY);
  }
   
  if(!a.isOnStep(allSteps.get(counterForStep))) {
    a.drawMatchstick();
    a.v.y += 5; 
  }
 
  if(a.needGoForward(allSteps.get(counterForStep))) {
    a.drawMatchstick();
    a.v.x -= 5;
  }
 
  
  if(a.isOnStep(allSteps.get(counterForStep)) && !a.needGoForward(allSteps.get(counterForStep))) {
    counterForStep++;
   a.v.y += 40;
  }
  
  if ( a.curLocY > height || a.curLocX > width || a.curLocX < 0) {
    text("LOST!!", width / 2, height / 2);
  }
}
 
public class Matchstick {
  float curLocX = 0.0;
  float curLocY = 0.0;
  PVector v = new PVector(0, 0);
   
  public void drawMatchstick() {
    if(!rightTurn || leftTurn) {
      PImage p = loadImage("Matchstick Man.png");
      curLocX = 0.8 * width + v.x;
      curLocY =  0.2 * height + v.y;
      image(p, 0.8 * width + v.x - 50, 0.2 * height + v.y - 40);
    }else  {
       PImage flip = loadImage("Matchstick Man Flip.png");
        curLocX = allSteps.get(counterForStep - 1).initialX ;
        curLocY = allSteps.get(counterForStep - 1).initialY;
        image(flip, allSteps.get(counterForStep - 1).initialX ,allSteps.get(counterForStep + 1).initialY   );
 
    }
  }
  void increaseCurLocY(float a){
    curLocY += a;
  }
  boolean isOnStep(Step s) {
    return ( curLocY == s.finalY - 45);
  }
  boolean needGoForward(Step s) {
   return ((curLocX >= s.finalX && curLocX <= s.initialX) || (curLocX <= s.finalX && curLocX >= s.initialX));
  }
   
}
 
public class Stairs {
  float initialReversePointX;  // to start reverse stairs
  float initialReversePointY;  // to start reverse stairs
  float finalPA;  // used to create next iteration
  float finalPB;  // used to create next iteration
 
  //draw regular stairs
  public void drawStairs(int a, float pX, float pY) {
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
  public void drawReverseStairs(int a, float x, float y ) {
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
  public float getFinalPointA() {
    return finalPA;
  }
 
  public float getFinalPointB() {
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

