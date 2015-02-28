
PImage startImage;
PImage p1;
PImage p2;
PImage same;
int ellapsedTime = 0;
int startTime = 0;


boolean contact1;
boolean contact2;
int mode=0;

int score1=3000;
int score2=3000;

float angle1=0;
float angle2=0;

boolean moveLeft1 = false;
boolean moveLeft2 = false;
boolean moveRight1 = false;
boolean moveRight2 = false;
boolean moveUp1 = false;
boolean moveUp2 = false;
boolean moveDown1 = false;
boolean moveDown2 = false;
boolean rotateRight1 = false;
boolean rotateRight2 = false;
boolean rotateLeft1 = false;
boolean rotateLeft2 = false;

float x1 = 200;
float y1 = 200;
float x2 = 600;
float y2 = 200;
float l1= 50;
float l2= 50;

float lx1;
float ly1;
float lx2;
float ly2;

float sw1=1;
float sw2=1;

float inix1=200;
float iniy1=200;
float inix2=600;
float iniy2=200;

float iniangle1=0;
float iniangle2=0;

int iniscore1=3000;
int iniscore2=3000;

float inil1=50;
float inil2=50;

float inisw1=1;
float inisw2=1;


void setup() {
  size(800, 480);
  startImage= loadImage("start screen.png");
  p1= loadImage("p1endscreen.png");
  p2= loadImage("p2endscreen.png");
  same= loadImage("sameendscreen.png");
  smooth();
}


void draw() {

  if (mode==0) {
    startScreen();
    x1=inix1;
    y1=iniy1;
    x2=inix2;
    y2=iniy2;
    angle1=iniangle1;
    angle2=iniangle2;
    score1=iniscore1;
    score2=iniscore2;
    l1=inil1;
    l2=inil2;
    sw1=inisw1;
    sw2=inisw2;
  }
  else if(mode==1) {

    ellapsedTime = millis() - startTime;
    println(ellapsedTime);
    stage1();
  }
  else if(mode==2) {
    ellapsedTime= millis() - startTime;
    println(ellapsedTime);
    stage2();
  }
  else if(mode==3) {
    ellapsedTime= millis() - startTime;
    println(ellapsedTime);
    stage3();
  }
  else if(mode==4) {
    ellapsedTime= millis() - startTime;
    println(ellapsedTime);
    stage4();
  }
  else if(mode==5) {
    ellapsedTime= millis() - startTime;
    println(ellapsedTime);
    stage5();
  }
  else if(mode==6) {
    ellapsedTime= millis() - startTime;
    println(ellapsedTime);
    stage6();
  }
  else if(mode==7) {
    ellapsedTime= millis() - startTime;
    println(ellapsedTime);
    stage7();
  }

  else if(mode==8) {
    background(0);
    if(score1>score2) {
      image(p1,0,0);
    }
    else if (score1<score2) {
      image(p2,0,0);
    }
    else if(score1==score2) {
      image(same,0,0);
    }
  }
}
void startScreen() {
  image(startImage,0,0);
}

void mousePressed() {
  if(mode==0) {
    mode=1;
  }
  if(mode==8) {
    startTime = millis(); 
    mode=0;
  }
}

void jumpScreen() {
  if(ellapsedTime>=60000) {
    mode=8;
  }
}


