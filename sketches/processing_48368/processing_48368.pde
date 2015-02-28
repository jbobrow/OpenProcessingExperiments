
//"Endless Hole" - 60-257
// copyright Eric Mackie December 2011 Pittsburgh, PA 15221

float xPos, yPos;
float big[];
int numSquare=20;
float colR, colG, colB, deltR, deltG, deltB;
float r, rVel;

void setup() {
  size (700, 700);
  rectMode(CENTER);
  strokeWeight(2);
  noCursor();
  smooth();

  initialize();
}

void draw() {
  makeBackground();
  mouseAndMove();
  animation();
}


void initialize() {
  r=0;
  rVel=PI/30;
  colR=150;
  colG=100;
  colB=40;
  deltR=2;
  deltG=.5;
  deltB=.1;
  big = new float[numSquare];
  for (int i=0; i<numSquare;i++) {
    big[i]=200*i;
  }
}

void makeBackground() {
  dasColors();
  fill(colR, colG, colB, 70);
  rect(width/2, height/2, width, height);
  fill(0, 0);
}

void mouseAndMove() {
  xPos=map(mouseX, 0, width, .75*width, .25*width);
  yPos=map(mouseY, 0, width, .75*width, .25*width);
  translate(xPos, yPos);
  rotate(r);
}


void animation() {
  for (int i=0; i<numSquare;i++) {
    big[i]+=20;
    if (big[i]>2000) {
      big[i]=0;
    }

    rect(0, 0, big[i], big[i]);
  }
}


void dasColors() {
  colR+=deltR;
  colG+=deltG;
  colB+=deltB;
  if ((colR>=150) || (colR<=0)) {
    deltR=-deltR;
  }
  if ((colG>=150) || (colG<=0)) {
    deltG=-deltG;
  }
  if ((colB>=150) || (colB<=0)) {
    deltB=-deltB;
  }
}


void keyPressed() {
  if (keyCode==RIGHT) {
    r+=.95*rVel;
    
  }
  if (keyCode==LEFT) {
    r-=.95*rVel;
    
  }
}


