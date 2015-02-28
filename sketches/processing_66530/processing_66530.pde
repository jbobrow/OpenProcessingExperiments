
//Space Setup

PFont font;
PImage sky;

void setup () {
  size (800, 800);
  smooth ();
  font = loadFont("Helvetica.vlw");
  textFont(font, 20);
  textAlign(CENTER);
  sky = loadImage("sky.jpg");
}

//Ball Size
int xBall = 50;
int yBall = 50;

//Initial Position of BallA
int xPosA = 25;
int yPosA = 25;

//Initial Position of BallB
int xPosB = 400;
int yPosB = 25;

//Initial Position of Ball C
int xPosC = 775;
int yPosC = 50;

//Velocity of the Balls
int xVelA = 10;
int yVelA = 5;
int xVelB = 5;
int yVelB = 10;
int xVelC = 10;
int yVelC = 5;

//Verrazano Bridge Bounding Box
int xVrrznPos = 300;
int yVrrznPos = 350;
int xVrrzn = 200;
int yVrrzn = 450;

boolean isColor;

//Verrazano Bridge with bouncing balls
void draw () {
  background(sky);
  noStroke();

  //Verrazano bridge flashing colors
    if (isColor == true) {
    fill(random(255), random(255), random(255));
  } 
  else {
    fill (255);
  }
  rect (xVrrznPos, yVrrznPos, xVrrzn, yVrrzn);
  fill(0);
  arc (400, 500, 100, 100, -PI, 0);
  rect (xVrrznPos+50, yVrrznPos+150, xVrrzn/2, yVrrzn-150);

  //Bouncing Balls
  //BallA
  fill(0, 200, 200);
  ellipse(xPosA, yPosA, xBall, yBall);
  //BallB
  fill(255, 0, 200);
  ellipse(xPosB, yPosB, xBall, yBall);
  //BallC
  fill(255, 255, 0);
  ellipse(xPosC, yPosC, xBall, yBall);

  xPosA=xPosA+xVelA;
  yPosA=yPosA+yVelA;

  xPosB=xPosB+xVelB;
  yPosB=yPosB+yVelB;

  xPosC=xPosC+xVelC;
  yPosC=yPosC+yVelC;


  //Ball Collision with borders
  //BallA Right and Left
  if (xPosA>width-xBall/2||xPosA<xBall/2) {
    xVelA=-xVelA;
  }
  //BallA Bottom and Top
  if (yPosA>height-xBall/2||yPosA<xBall/2) {
    yVelA=-yVelA;
  }
  //BallB Right and Left
  if (xPosB>width-xBall/2||xPosB<xBall/2) {
    xVelB=-xVelB;
  }
  //BallB Bottom and Top
  if (yPosB>height-xBall/2||yPosB<xBall/2) {
    yVelB=-yVelB;
  }
  //BallC Right and Left
  if (xPosC>width-xBall/2||xPosC<xBall/2) {
    xVelC=-xVelC;
  }
  //Ball C Bottom and Top
  if (yPosC>height-xBall/2||yPosC<xBall/2) {
    yVelC=-yVelC;
  }

  //Ball Collision (with each other)
  if (dist(xPosA, yPosA, xPosB, yPosB)<=xBall) { //BallA and BallB
    xVelA=-xVelA;
    yVelA=-yVelA;
    xVelB=-xVelB;
    yVelB=-yVelB;
  }
  if (dist(xPosA, yPosA, xPosC, yPosC)<=xBall) { //BallA and BallC
    xVelA=-xVelA;
    yVelA=-yVelA;
    xVelC=-xVelC;
    yVelC=-yVelC;
  }
  if (dist(xPosB, yPosB, xPosC, yPosC)<=xBall) { //BallB and BallC
    xVelB=-xVelB;
    yVelB=-yVelB;
    xVelC=-xVelC;
    yVelC=-yVelC;
  }

  //Balls - Bridge Collision
  //BallA - BridgeLeft
  if (dist(xPosA, yPosA, 300, 350)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 300, 400)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 300, 450)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 300, 500)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 300, 550)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 300, 600)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 300, 650)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 300, 700)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 300, 750)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  //BallA - BridgeRight
  if (dist(xPosA, yPosA, 500, 350)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 500, 400)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 500, 450)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 500, 500)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 500, 550)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 500, 600)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 500, 650)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 500, 700)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 500, 750)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  //BallA - BridgeTop
  if (dist(xPosA, yPosA, 350, 350)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 350, 400)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  if (dist(xPosA, yPosA, 350, 450)<=xBall/2) {
    xVelA = -xVelA;
    yVelA = -yVelA;
  }
  //BallB - BridgeLeft
  if (dist(xPosB, yPosB, 300, 350)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 300, 400)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 300, 450)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 300, 500)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 300, 550)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 300, 600)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 300, 650)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 300, 700)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 300, 750)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  //BallB - BridgeRight
  if (dist(xPosB, yPosB, 500, 350)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 500, 400)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 500, 450)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 500, 500)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 500, 550)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 500, 600)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 500, 650)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 500, 700)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 500, 750)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  //BallB - BridgeTop
  if (dist(xPosB, yPosB, 350, 350)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 350, 400)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  if (dist(xPosB, yPosB, 350, 450)<=xBall/2) {
    xVelB = -xVelB;
    yVelB = -yVelB;
  }
  //BallC - BridgeLeft
  if (dist(xPosC, yPosC, 300, 350)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 300, 400)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 300, 450)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 300, 500)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 300, 550)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 300, 600)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 300, 650)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 300, 700)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 300, 750)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  //BallC - BridgeRight
  if (dist(xPosC, yPosC, 500, 350)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 500, 400)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 500, 450)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 500, 500)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 500, 550)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 500, 600)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 500, 650)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 500, 700)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 500, 750)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  //BallC - BridgeTop
  if (dist(xPosC, yPosC, 350, 350)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 350, 400)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  if (dist(xPosC, yPosC, 350, 450)<=xBall/2) {
    xVelC = -xVelC;
    yVelC = -yVelC;
  }
  //Text
  fill(255,255,0);
  textFont(font, 20);
  text("Click on the Bridge!", mouseX, mouseY);
}

//Flashing colors on bridge when clicked on
void mouseReleased() {
  if (mouseX > xVrrznPos && mouseX < xVrrznPos + width) {
    if (mouseY > yVrrznPos && mouseY < yVrrznPos + width) {
      if (mouseX < width - xVrrznPos) {
      isColor = !isColor;
    }
  }
}
}

