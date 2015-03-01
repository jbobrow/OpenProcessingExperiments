
/*****************************************
 * Assignment <<< Animated Sketch >>
 * Name:         <<< Zack Jordan >>>
 * Course:       CSC 103 - Creative Computing - Fall 2014
 * Submitted:    <<< September 17 >>>
 * 
 * <<< This is a sketch of a runner going through a steeple barrier. >>>
 *
***********************************************/

int steepleHeight = int(random(185, 225));
int steepleX = 500;
int waterWidth = int(random(250, 350));
int steepleY = int(485 - steepleHeight);
int steepleTopX = steepleX - 10;
int steepleTopY = steepleY - 35;
int waterX = steepleX - waterWidth - 10;
int xA = 700;
int yA = 400;
boolean inScreen = true;
boolean goingUp = true;
boolean goingDown = false;
boolean flat1 = false;
boolean flat2 = false;


void setup() {
  size(800, 500);
}

void draw() {
background(135, 206, 250);  // sky blue

noStroke();
fill(#B40202);  //red track
rect(0, 275, width, 225);

drawSteepleBarrier(steepleHeight);

drawWaterPit(waterWidth);

drawRunner(xA);

}

void drawSteepleBarrier(int steepleHeight) {
  
  int steepleTopWidth = 45;
  int steepleTopHeight = 35;
  
  
  
  noStroke();
  fill(255, 255, 255); //white
  rect(steepleX, steepleY, 25, steepleHeight);
  
  fill(0, 0, 0);
  rect(steepleTopX, steepleTopY, steepleTopWidth, steepleTopHeight);
}

void drawWaterPit (int waterWidth) {
  int waterHeight = 175;
  
  int waterY = 300;
  
  noStroke();
  fill(#0057FF);
  rect(waterX, waterY, waterWidth, waterHeight);
  
}

void drawRunner(int xA) {
  
  int xB = xA + 50;
  int yB = yA - 50;
  int xC = xA + 100;
  int yC = yA;
  int xD = xA + 50;
  int yD = yA - 125;
  int headY = yD - 50;
  int xE = xB;
  int yE = yA - 100;
  int xF = xE - 40;
  int yF = yA - 110;
  int xG = xE + 40;
  int yG = yF;
  int eyeX1 = xB - 17;
  int eyeX2 = xB + 17;
  int eyeY = headY - 10;
  
  updatexA();

  stroke(0);
  strokeWeight(10);
  line(xA, yA, xB, yB);
  line(xB, yB, xC, yC);
  line(xB, yB, xD, yD);
  fill(255, 255, 255);  //white head
  ellipse(xB, headY, 85, 85);
  line(xE, yE, xF, yF);
  line(xE, yE, xG, yG);
  fill(0, 0, 0); //eyes
  ellipse(eyeX1, eyeY, 10, 10);
  ellipse(eyeX2, eyeY, 10, 10);
}

void updatexA() {
  
  if (inScreen) {
    xA = xA - 1;
    if (xA <= -100) {
      inScreen = false;
    }
  } else {
    xA = width;
    if (xA > -100) {
      inScreen = true;
    }
  }
  
}



