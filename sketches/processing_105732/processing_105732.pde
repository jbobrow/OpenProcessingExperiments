
int xPosL;//left player's x position 
int yPosL;//left player's y position
int xPosR;//right player's x position
int yPosR;//right player's y position
float xPosB;//x position of the ball
float yPosB;//y position of the vall
int scoreL;//score left
int scoreR;//score right
int SX=-3;//x speed
int SY=-4;//y speed
int R=16;//ball's radius
PFont scoreFont;//score font

void setup() {
  size(800, 400);
  stroke(255);
  strokeWeight(3);
  rectMode(CENTER);
  ellipse(xPosB, yPosB, R, R);
  scoreFont = loadFont ("Blockhed.vlw");
  textAlign(CENTER);
  textFont(scoreFont);

  //initial y positions for the bars
  yPosL=200;
  yPosR=200;

  //initial scores
  scoreL = 0;
  scoreR = 0;

  //initial position of the ball
  xPosB=400;
  yPosB=200;
}

void draw() {

  background(0);

  //ball's position
  xPosB=xPosB+SX;
  yPosB=yPosB+SY;

  //score position
  text (scoreR, 200, 200);
  text (scoreL, 600, 200);
  fill(255, 255, 255, 50);
  textSize(100);


  if ((yPosB<0+R/2)||(yPosB>height-R/2)) {
    SY=SY*-1;
  }

  //left player
  if (xPosB>width-R/2) {
    background(255, 0, 0);
    xPosB=400;
    yPosB=200;
    SX=SX*-1; //change the direction of the ball
    scoreL++; //score +1
  }
  
  if ((xPosB<=50)&&(yPosB<=yPosL+25)&&(yPosB>=yPosL-25)) {
    SX=SX*-1;
    SY=SY*-1;
  }

  //right player
  if (xPosB<0+R/2) {
    background(0, 0, 255);
    xPosB=400;
    yPosB=200;
    SX=SX*-1;
    scoreR++; //score +1
  }
  
  if ((xPosB>=750)&&(yPosB<=yPosR+25)&&(yPosB>=yPosR-25)) {
    SX=SX*-1;
    SY=SY*-1;
  }

  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==UP) {
        yPosR=yPosR-10;
      }
    }
  }

  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==DOWN) {
        yPosR=yPosR+10;
      }
    }
  }
  line(400, 0, 400, 400);//mid-line
  rect(40, yPosL, 10, 50);//player L
  rect(760, yPosR, 10, 50);//player R
  ellipse(xPosB, yPosB, 15, 15);//Ball
}

void mouseMoved() {
  //    xPosL=mouseX;
  yPosL=mouseY;
}



