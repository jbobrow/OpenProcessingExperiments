
/*Futility in Motion
By Emma Rose Wirshing

This project was intended to explore the use of motion while using Processing. I decided to loosely base mine 
on the website "Stickman" (http://www.drawastickman.com/). This mini-game features a walking stick figure who 
is getting pelted with different balls. The goal is to stop the black ball before it hits the man by clicking 
when the ball is in between the two boundary lines. The harder the level, the smaller the boundaries. As the 
game progresses, the average ball speed steadily increases, making it slightly harder. 

Some aspects of this code were taken from other sources and revised. These sources are listed below.
1. http://www.openprocessing.org/sketch/52853
2. Daniel Shiffman, Learning Processing: http://www.learningprocessing.com/examples/chapter-5/example-5-6/
*/


//BODY
int headCenterY; //center Y coordinate of head
int headWidth = 30;
int headHeight = 75;
int mouthWidth = 10;
//SHOES
int shoeOffset = 350; //variable determining how far from the edge the shoes travel
float shoeX1 = shoeOffset; //center X coordinate of shoe
float shoeX2;
float shoeSpeed1 = 3; //how fast the shoes travel
float shoeSpeed2 = 3;
int shoeWidth = 50;
int shoeHeight = 10;
int shoeCenterY; //center Y coordinate of shoe
//HANDS
int handOffset = 370; //variable determining how far from the edge the hands travel
float handX1 = handOffset; //center X coordinate of hand
float handX2;
float handSpeed1 = 1;//how fast the hands travel
float handSpeed2 = 1;
int handWidth = 7;
int handHeight = 14;
//BALL
Ball myBall1; //objects from Ball class
Ball myBall2;
Ball myBall3;
Ball myBall4;
Ball myBall5;
Ball myBall6;
Ball myBall7;
Ball myBall8;
float randMin = .04; //minimum value for speed (will be randomized)
float randMax = .1; // maximum value for speed (will be randomized)
color[] ballColor = new color[4]; // array for determining ball color
float waveWidth = 1; //width of the sine wave the ball travels
//CONE
Cone myCone1; //objects from Cone class
Cone myCone2;
Cone myCone3;
float coneSpeed = 3; //how fast the cones travel
//TARGET
int boundOffset = 40; //how far apart the boundaries are
float leftBound; //X coordinate of left boundary
float rightBound = leftBound + boundOffset;
//TIMER
long lastTime; //time variable for timer at beginning of game
//SCORE
int score = 0;
int endTime; //time that game is lost
int kyleTan; //kyleTan is a variable that changes between 0 and 1 to signify a change
int scoreIncrease; //how many points scored per ball
 
void setup(){
  //most variables found in setup are here because they reference width or height
  size(800, 600);
  frameRate(50);
  //SHOE HAND HEAD COORDINATES
  shoeX2 = width-shoeOffset;
  handX2 = width-handOffset;
  headCenterY = (height/2) - 130;
  shoeCenterY = (height/2) + 110;
  //BOUNDARY
  leftBound = random(width/2+50, width/2 + 200); //sets random value for left boundary 
  //BALL COLOR ARRAY VALUES
  ballColor[0] = color(100);
  ballColor[1] = color(175);
  ballColor[2] = color(50);
  ballColor[3] = color(255);
  //BALL OBJECTS
  myBall1 = new Ball(width, 0);
  myBall2 = new Ball(width+100, ballColor[int(random(0, 4))]);
  myBall3 = new Ball(width + 200, ballColor[int(random(0, 4))]);
  myBall4 = new Ball(width + 300, ballColor[int(random(0, 4))]);
  myBall5 = new Ball(width+400, ballColor[int(random(0, 4))]);
  myBall6 = new Ball(width + 500, ballColor[int(random(0, 4))]);
  myBall7 = new Ball(width + 600, ballColor[int(random(0, 4))]);
  myBall8 = new Ball(width + 700, ballColor[int(random(0, 4))]);
  //CONE OBJECTS
  myCone1 = new Cone(width);
  myCone2 = new Cone(width+300);
  myCone3 = new Cone(width+600);
  //TIMER VARIABLE
  lastTime = millis()
} 
 
void draw(){
//INTRO
  if (millis()<=5000) {
    background(0);
    textSize(32);
    text("WELCOME TO", 300, 200);
    text("FUTILITY IN MOTION", 240, 300);
  }
  else if (millis()<12000 && millis()>5000) {
    background(0);
    textSize(32);
    text("INSTRUCTIONS", 295, 100);
    text("CLICK THE MOUSE WHEN THE CENTER OF", 75, 200);
    text("THE BLACK BALL IS IN BETWEEN", 150, 250);
    text("THE VERTICAL BOUNDARIES", 170, 300);
    lastTime = millis();
    
  }
  
   else if (millis()<18000 && millis()>12000) {
    background(0);
    textSize(32);
    text("CHOOSE YOUR DIFFICULTY", 200, 100);
    textSize(24);
    text("PRESS E FOR EASY", 100, 200);
    text("PRESS M FOR MEDIUM", 100, 275);
    text("PRESS H FOR HARD", 100, 350);
    text("GAME STARTS IN", 290, 550);
    
//TIMER
    if(millis() - lastTime <= 2000 && millis() - lastTime>1000) {
      text("5", 500, 550);
    }
    if(millis() - lastTime <= 3000 && millis() - lastTime>2000) {
      text("4", 500, 550);
    }
    if(millis() - lastTime <= 4000 && millis() - lastTime>3000) {
      text("3", 500, 550);
    }
    if(millis() - lastTime <= 5000 && millis() - lastTime>4000) {
      text("2", 500, 550);
    }
    if(millis() - lastTime <= 60000 && millis() - lastTime>5000) {
      text("1", 500, 550);
    }
//DIFFICULTY SELECTION  
    if (keyPressed) {
      if (key == 'e' || key == 'E') {
        boundOffset = 40; //distance between boundaries is 40
        rightBound = leftBound + boundOffset;
        waveWidth = 1; //width of sine wave ball travels is 1
        text("SELECTED", 500, 200);
        scoreIncrease = 1; //score increments by 1
      }
      else if (key == 'm' || key == 'M') {
        boundOffset = 30; //distance between boundaries is 30
        rightBound = leftBound + boundOffset;
        waveWidth = 1.5; //width of sine wave ball travels is 1.5
        text("SELECTED", 500, 275);
        scoreIncrease = 2; //score increments by 2
      }
      else if (key == 'h' || key == 'H') {
        boundOffset = 20; //distance between boundaries is 20
        rightBound = leftBound + boundOffset;
        waveWidth = 2; //width of sine wave ball travels is 2
        text("SELECTED", 500, 350);
        scoreIncrease = 3; //score increments by 3
      }
    }
  }
  else {
    //SETUP
    background(255);
    strokeWeight(5);
    //SCORE
     textSize(32);
     noFill();
     rect(10, 10, 200, 100);
     fill(0);
     text("SCORE", 60, 55);
     text(score, 95, 90);
    //BODY
    displayBody();
    //GROUND
    strokeWeight(3);
    displayGround();
    //CONE
    myCone1.display();
    myCone2.display();
    myCone3.display();
    //SHOES
    strokeWeight(5);
    bounceShoe1();
    moveShoe1();
    displayShoe1();
    bounceShoe2();
    moveShoe2();
    displayShoe2();
    line(width/2, height/2, shoeX1, shoeCenterY); //legs
    line(width/2, height/2, shoeX2, shoeCenterY); //legs
    //HANDS
    bounceHand1();
    moveHand1();
    displayHand1();
    bounceHand2();
    moveHand2();
    displayHand2();
    line(width/2, height/2 - 80, handX1, height/2); //arms
    line(width/2, height/2 - 80, handX2, height/2); //arms
    //BOUNDS
    displayBounds();
    //BALL
    myBall1.display();
    myBall2.display();
    myBall3.display();
    myBall4.display();
    myBall5.display();
    myBall6.display();
    myBall7.display();
    myBall8.display();
    myBall1.interactive();
  }
}
 
//GROUND
void displayGround(){
  line(0,shoeCenterY-30, width, shoeCenterY-30);
}
//SHOES 
void moveShoe1(){
  shoeX1 = shoeX1 + shoeSpeed1;
}
void bounceShoe1(){
  if ((shoeX1 > (width-shoeOffset)) || (shoeX1 < shoeOffset)){
    shoeSpeed1 = shoeSpeed1 * -1;
  }
}
void displayShoe1 (){
  fill(0);
  ellipse(shoeX1, shoeCenterY, shoeWidth, shoeHeight);
  ellipse(shoeX1 + shoeWidth/4, shoeCenterY - shoeHeight/2, shoeWidth/1.5, 1.2*shoeHeight);
  rect(shoeX1-shoeWidth/2, shoeCenterY-1.7*shoeHeight, shoeWidth/2, 1.7*shoeHeight);
  strokeWeight(10);
  line(shoeX1, shoeCenterY-2*shoeHeight, shoeX1+shoeWidth/2, shoeCenterY);
  strokeWeight(5);
}
void moveShoe2(){
  shoeX2 = shoeX2 + shoeSpeed2;
}
 void bounceShoe2(){
  if ((shoeX2 > (width-shoeOffset)) || (shoeX2 < shoeOffset))
  {
    shoeSpeed2 = shoeSpeed2 * -1;
  }
}
 void displayShoe2 (){
  fill(0);
  ellipse(shoeX2, shoeCenterY, shoeWidth, shoeHeight);
  ellipse(shoeX2 + shoeWidth/4, shoeCenterY - shoeHeight/2, shoeWidth/1.5, 1.2*shoeHeight);
  rect(shoeX2-shoeWidth/2, shoeCenterY-1.7*shoeHeight, shoeWidth/2, 1.7*shoeHeight);
  strokeWeight(10);
  line(shoeX2, shoeCenterY-2*shoeHeight, shoeX2+shoeWidth/2, shoeCenterY);
  strokeWeight(5);
}
 
//HANDS
void moveHand1(){
  handX1 = handX1 + handSpeed1;
}
void bounceHand1(){
  if ((handX1 > (width-handOffset)) || (handX1 < handOffset)){
    handSpeed1 = handSpeed1 * -1;
  }
}
void displayHand1 (){
  fill(175);
  ellipse(handX1, height/2, handWidth, handHeight);
}
void moveHand2(){
  handX2 = handX2 + handSpeed2;
}
void bounceHand2(){
  if ((handX2 > (width-handOffset)) || (handX2 < handOffset)){
    handSpeed2 = handSpeed2 * -1;
  }
}
 void displayHand2 (){
  fill(175);
  ellipse(handX2, height/2, handWidth, handHeight);
}
void displayBody () {
  fill(255);
  //HAIR
  strokeWeight(5);
  beginShape();
  vertex((width/2), (headCenterY + headHeight/2));
  vertex((width/2 - headWidth), (headCenterY + headHeight/2 + 2*mouthWidth));
  vertex((width/2 - headWidth + mouthWidth),(headCenterY + headHeight/2 - mouthWidth));
  vertex((width/2 - headWidth - 2*mouthWidth),(headCenterY + headHeight/2 - 2*mouthWidth));
  vertex((width/2 - headWidth-mouthWidth),(headCenterY));
  vertex((width/2 - headWidth - 3*mouthWidth),(headCenterY - 2*mouthWidth));
  vertex((width/2 - headWidth - mouthWidth/2),(headCenterY - 3*mouthWidth));
  vertex((width/2 - headWidth - mouthWidth/3),(headCenterY - headHeight/1.2));
  vertex((width/2 - headWidth/2),(headCenterY - headHeight/1.5));
  vertex((width/2),(headCenterY - headHeight));
  vertex((width/2 + headWidth),(headCenterY - headHeight/2));
  vertex((width/2 - headWidth/2),(headCenterY));
  endShape();
  //BODY
  strokeWeight(5);
  line(width/2, height/2, width/2, headCenterY+headHeight/2);
  //HEAD
  arc(width/2, headCenterY, headWidth, headHeight, -PI/6, PI);
  //EYE
  strokeWeight(2);
  ellipse(width/2 + 6, height/2 - 135, 5, 10);
  ellipse(width/2 + 6, height/2 - 135, 2, 3);
  //MOUTH
  line((width/2 + headWidth/2), (headCenterY+1.5*shoeHeight), (width/2 + headWidth/2 - mouthWidth), (headCenterY+1.5*shoeHeight));
}
void displayBounds(){
  strokeWeight(1.5);
  stroke(10);
  line(leftBound, 0, leftBound, height);
  line(rightBound, 0, rightBound, height);
  strokeWeight(3);
}
class Cone {
  float coneX; //X coordinate of cone
  
  Cone(int tempConeX) {
    coneX = tempConeX;
  }
  
  void display() {
    fill(255);
    arc(coneX - 30, (shoeCenterY - 100), 170.88, 170.88, 1.26, 1.88);
    strokeWeight(5);
    beginShape();
    vertex(coneX, shoeCenterY-20);
    vertex(coneX - 30, shoeCenterY - 100);
    vertex(coneX - 60, shoeCenterY-20);
    endShape();
    strokeWeight(2);
    arc(coneX - 30, (shoeCenterY - 100), 90, 90, 1.26, 1.88);
    arc(coneX - 30, (shoeCenterY - 100), 50, 50, 1.26, 1.88);
    coneX = coneX-coneSpeed; //movement of cone
      if (coneX < -100) {
        coneX = width+100; //if cone reaches the edge of screen it starts again
      }
  }
}
class Ball {
  float ballAngle = 0.0; //variable for sine wave
  float ballBounce = height/2 - shoeCenterY; //variable for sine wave
  float ballSpeed = random(randMin, randMax); //variable for sine wave
  int ballWidth = 40;
  float ballX;
  int ballCol; //ball color
  float gravity = 0.00005; //mimics gravity
  
  Ball (int tempBallX, int tempBallCol) {
    ballX = tempBallX;
    ballCol = tempBallCol;
  }
  
  void display() {
    float y1 = height/2 + sin(ballAngle) * ballBounce; //Y coordinate of ball
    if(y1>=shoeCenterY-30) { //if ball is below certain point
      fill(ballCol);
      ellipse(ballX, y1, ballWidth +6, ballWidth); //ball gets wider
      ballAngle += ballSpeed; //ball goes faster
      ballSpeed = ballSpeed + gravity; //ball goes faster
      ballX = ballX - waveWidth; //ball travels
      ballBounce = ballBounce+.1; //height of sine wave gets smaller
        if (ballX < 0) {
          ballX = width; //if ball reaches edge of screen it restarts
          ballSpeed = random(randMin, randMax); //reset ball Speed
          ballBounce = height/2 - shoeCenterY; //reset ballBounce
         }
        if (y1 == shoeCenterY) {
          ballSpeed = ballSpeed*.95; //ball goes faster at bottom of curve
        }
      }
    else if(y1<shoeCenterY-30&& y1>height/2-20) { //if ball is between two points
      fill(ballCol);
      ellipse(ballX, y1, ballWidth, ballWidth+6); //ball gets taller
      ballAngle += ballSpeed; //ball goes faster
      ballSpeed = ballSpeed + gravity; //ball goes faster
      ballX = ballX - waveWidth; //ball travels
      ballBounce = ballBounce+.05; //height of sine wave gets smaller
        if (ballX < 0) {
          ballX = width; //if ball reaches edge of screen it restarts
          ballSpeed = random(randMin, randMax); //reset ballSpeed
          ballBounce = height/2 - shoeCenterY; //reset ballBounce
         }
      }
    else {
      fill(ballCol);
      ellipse(ballX, y1, ballWidth, ballWidth);
      ballAngle += ballSpeed; //ball goes faster
      ballX = ballX - waveWidth; //ball travels
      ballBounce = ballBounce = ballBounce+.005; //height of sine wave gets smaller
        if (ballX < 0) {
          ballX = width; //if ball reaches edge of screen it restarts
          ballSpeed = random(randMin, randMax); //reset ballSpeed
          ballBounce = height/2 - shoeCenterY; //reset ballBounce
        }
    }
  }
    
  void interactive() {
    if (width-25>ballX && ballX>rightBound && mousePressed == true) { //if mouse is clicked before boundaries
      kyleTan = 1;
     }
    else if (rightBound>ballX && mousePressed == true) { //if mouse clicked in between boundaries
      ballX = width; //reset ball
      leftBound = random(width/2+50, width/2 + 200); //randomize left boundary
      rightBound = leftBound + boundOffset; //reset right boundary
      ballSpeed = random(randMin, randMax); //reset ballSpeed
      ballBounce = height/2 - shoeCenterY; //reset ballBounce
      randMin = randMin + 0.01; //increase minimum ballSpeed
      randMax = randMax + 0.01; //increase maximum ballSpeed
      coneSpeed = coneSpeed + .5; //increase cone speed
      waveWidth = waveWidth + 0.05; //increase width of sine wave ball travels
      if (boundOffset>3) {
        boundOffset = boundOffset-1; //decrease distance between bounds
      }
    }
    else if (ballX<leftBound-3 && mousePressed == false) {
      kyleTan = 1;
     }
    if (kyleTan == 1) {
       endTime = millis();
       if(millis()-endTime<10000) {
         textSize(32);
         background(0);
         stroke(255);
         text("GAME OVER", 310, 200);
         text("FINAL SCORE:", 280, 300);
         text(score, 500, 300);
      }
        else {
          exit();
        }
      }
  }
}
void mouseReleased(){
  if (kyleTan==0) {
    score = score + scoreIncrease; //increase score when mouse is clicked if game is not over
  }
}
