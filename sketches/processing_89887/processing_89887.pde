
//Ball
int xPos;
int yPos;
int xSpeed;
int ySpeed;

//Paddles
int rPongY;
int rPongX;
int lPongY;
int lPongX;

//Key Strokes
boolean[]keys;


void setup() {
  size(800, 500);
  background(255);
  
  //Ball
  xPos=50;
  yPos=100;
  xSpeed=3;
  ySpeed=3;
  
  //Paddles
  rPongY=height/2-30;
  rPongX=width-25;
  lPongY=height/2-30;
  lPongX=25;
  
  //Key Strokes
  keys = new boolean[5];
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
  keys[4]=false;
}

void draw() {
  background(255);
  smooth();

//Objects

  //Ball
  fill(0);
  noStroke();
  xPos=xPos+xSpeed;
  yPos=yPos+ySpeed;
  ellipse(xPos, yPos, 50, 50);

  //Left Paddle
  rect(lPongX, lPongY, 10, 60);

  //Right Paddle
  rect(rPongX, rPongY, 10, 60);

//Edge Bounce
  if (yPos+25>=height || yPos-25<=0) {
    ySpeed=-ySpeed;
  }

//Paddle Border Restrictions
  if (rPongY<=0) {
    keys[1]=false;
  }
  if (rPongY>=height-60) {
    keys[2]=false;
  }
  if (lPongY<=0) {
    keys[3]=false;
  }
  if (lPongY>=height-60) {
    keys[4]=false;
  }

//Bounce off Paddle

  //Right Paddle
  if (xPos+25>=rPongX && (yPos>=rPongY && yPos<=rPongY+60)) {
    xSpeed=-xSpeed;
  }

  //Left Paddle
  if (xPos-25<=lPongX && (yPos>=lPongY && yPos<=lPongY+60)) {
    xSpeed=-xSpeed;
  }

//Paddle Movement
  
  if (keyPressed==true) {
    
    //Ball Return
    if (keys[0]) {
      xPos=50;
      yPos=100;
      xSpeed=3;
      ySpeed=3;
    }

    //Right Paddle
    if (keys[1]) {
      rPongY=rPongY-5;
    } 
    if (keys[2]) {
      rPongY=rPongY+5;
    }
    //Left Paddle
    if (keys[3]) {
      lPongY=lPongY-5;
    }
    if (keys[4]) {
      lPongY=lPongY+5;
    }
  }
}

//Multi-Key Press

void keyPressed() {
  if (key=='b') {
    keys[0]=true;
  }
  if (key=='k') {
    keys[1]=true;
  }
  if (key=='m') {
    keys[2]=true;
  }
  if (key=='d') {
    keys[3]=true;
  }
  if (key=='c') {
    keys[4]=true;
  }
}

//No Action Desired for Release

void keyReleased() {
  if (key=='b') {
    keys[0]=false;
  }
  if (key=='k') {
    keys[1]=false;
  }
  if (key=='m') {
    keys[2]=false;
  }
  if (key=='d') {
    keys[3]=false;
  }
  if (key=='c') {
    keys[4]=false;
  }
}


