
//position of paddles
int xposL;
int yposL;
int xposR;
int yposR;

//position of ball
float xposB;
float yposB;

//position of ball
int scoreL;
int scoreR;
int yposScore;
int xdistScore;

//position of score
int rectW;
int rectH;

//speed
int sx;
int sy;

int r=16;
PFont font;

void setup() {
  //the playboard
  size(800, 500);
  stroke(0,200,200);
  strokeWeight(3);

  //paddles
  xposL=height/2;
  yposR=height/2;
  rectW=10;
  rectH=40;
  ellipse(xposB, yposB, r, r);

  //scores
  yposScore=80;
  xdistScore=100;

  scoreL=0;
  scoreR=0;

  //initial ball
  sx=3;
  sy=-3;
  xposB=width/2;
  yposB=height/2;
  font=loadFont("Font.vlw");
}

void draw() {

  //play board
  background(0);
  stroke(0, 200, 200);
  line(width/2, 0, width/2, height);

  //paddles
  noStroke();
  fill(0,200,200);
  rectMode(CENTER);
  rect(40, yposL, rectW, rectH);
  rect(760, yposR, rectW, rectH);
  ellipse(xposB, yposB, r, r);

  //scores
  rect(width/2-xdistScore, yposScore-20,50,70);
  rect(width/2+xdistScore, yposScore-20,50,70);
  textAlign(CENTER);
  textFont(font);

  fill(255);
  text(scoreL, width/2-xdistScore, yposScore);
  text(scoreR, width/2+xdistScore, yposScore);

  if (yposB < -r/2) {
    scoreL++;
  }

  if (yposB > width+r/2) {
    scoreR++;
  }


  //direction and speed of the ball
  xposB=xposB+sx;
  yposB=yposB+sy;

  //bounce back from top/bottom
  if ((yposB<r/2)||(yposB>height-r/2)) {
    sy=sy*-1;
  }

  //bounce back from the LEFT paddle
  if ((xposB==50) && (yposB>=mouseY-rectH/2) && (yposB<=mouseY+rectH/2)) {
    sx=-sx;
  }

  //bounce back from the RIGHT paddle
  if ((xposB==750) && (yposB>=yposR-rectH/2) && (yposB<=yposR+rectH/2)) {
    sx=-sx;
  }

  //add scores
  if (xposB<r/2) {
    xposB=width/2;
    yposB=height/2;
    scoreR=scoreR+1;
  }

  if (xposB>width-r/2) {
    xposB=width/2;
    yposB=height/2;
    scoreL=scoreL+1;
  }


  //control by arrow keys

  //UP key
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==UP) {
        yposR=yposR-10;
      }
    }
  }

  //DOWN key
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==DOWN) {
        yposR=yposR+10;
      }
    }
  }
}


//control by mouse

void mouseMoved() {
  yposL=mouseY;
}
