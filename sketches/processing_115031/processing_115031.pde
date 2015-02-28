
//moving colors. middle two hours,, next two minutes, next two seconds
//after 60 seconds, redo flames

//4 hanging lights, middle two hours, outer two minutes, lower at intervals, seconds show color lines

int flames;//flames counter
///////////

int[] candleXH = new int[5];//array for x positions of candles!!!!!!
int[] candleXM = new int[15];//array for x positions of candles!!!!!!

int[]  candleXR = new int[5];
int[]    candleXL = new int[5];
int[]  candleYR = new int[5];
int[]  candleYL = new int[5];
int YSwing;
int YSwing2;
int YSwing3;
int YSwing4;

//////////
//where lines/lights are
//int xPositionC;
//int YPositionC;////old

int YPositionCH;
int YPositionCM;


int  xPositionCH;
int  xPositionCM;


//in code
int candleH;


int heightM;
int heightH;
//int candleHH;
//int candleHM;
//need to add to code
int candleHH;// change very hour
int candleHM;//change every minute

int candleW;//width


////////////
//start over/not
boolean atBottom;
boolean atBottomH;
boolean atBottomM;

//////
//flame quad
int tX;
int lX;
int bX;
int rX;

int tY;
int lY;
int bY;
int rY;

int tXM;
int lXM;
int bXM;
int rXM;

int tYM;
int lYM;
int bYM;
int rYM;

//flame color
int FH;

//time
int s;
int lastSecond;
int m;
int lastMinute;
int h;
int lastHour;



//lines to show number of hours past 180 degrees around rays of light
//map m = 
//////////////////////

void setup() {
  background(0);
  size(2560, 1200);
  colorMode(HSB);
  rectMode(CORNER);
  flames=0;
  YPositionCH=0;
  YPositionCM=0;
  candleH=0;
  heightM=0;
  heightH=0;
  drawCandlesH();
  drawCandlesM();
  frameRate(30);
}

///////////////////////////
//on loop
void draw() {

  // background(0);
  s = second();
  m = minute();
  h = hour();
  if (lastSecond!=s) {
    drawCandlesM();
    drawCandlesH();
    flicker();
    drawFlames();
    // println(s+"s");
    //println(lastSecond+"lastSecond1");
    lastSecond=s;
    //println(lastSecond+"lastSecond2");
  }
  if (lastMinute!=m) {
    // background(0);
    println(m);

    flames=0;
    lowerM();
    drawCandlesM();
    drawCandlesH();
    lastMinute=m;
    flicker();
  }
  if (lastHour!=h) {
    //drawCandlesH();

    lowerH();
    drawCandlesM();
    drawCandlesH();

    lastHour=h;
    //lowerH();
  }
  if (m==30) {
    explode();
  }
}
/////////////////////////////
//called in setup, only once, at begining
//called again to lowerH
//really strings now
void drawCandlesM() {
  //background(0);
  fill(178, 85, 59);
  noStroke();

  candleW=5;
  // h, m, 2


  xPositionCM=width/30;

  for (int j=0;j<=14;j++) {//minutes
    //make candle

    rect(xPositionCM, YPositionCM, candleW, heightM, 7);
    // println(xPositionCM+"Minutes");
    // println(candleH+"early +candleH");
    candleXM[j]=xPositionCM;
    xPositionCM+=width/15;
  }
  //real picture?
}
void drawCandlesH() {
  //background(0);
  fill(178, 85, 59);
  noStroke();

  candleW=5;
  // h, m, 2

  xPositionCH=width/10;

  for (int i=0;i<=4;i++) {//hours
    //make candle
    println(heightH+"in drawicnadles");
    rect(xPositionCH, YPositionCH, candleW, heightH, 7);

    candleXH[i]=xPositionCH;
    xPositionCH+=width/5;
  }

  //real picture?
}
////////////////////////////
//need for M and H
void lowerH() {
  if (heightH>=0&&heightH<=height) {
    background(0);
    heightH+=((.0416)*height);
    //heightH+=20;
    //println(((.0416)*height)+"heightH");
    //YPositionCH+=20;
    flames=0;
    YSwing=heightH-500;
    YSwing2=heightH-250;
    YSwing3=heightH+250;
    YSwing4=heightH+500;
  }
  else {
    atBottomH=true;
    restartH();
  }
  //candle goes down
  //every hour
  //float m=map(heightH,20,heightH,20,height-20);
  //println(m+"map");
  drawCandlesH() ;
}
void lowerM() {
  if (heightM>=0&&heightM<=height) {
    background(0);
    heightM+=(.01666666)*height;
    // YPositionCM+=20;
    flames=0;
  }
  else if (heightM>=height) {
    atBottomM=true;
    restartM();
  }
  //candle goes down
  //every hour
  drawCandlesM() ;
}
void restartM() {
  if (atBottomM) {
    flames=0;
    heightM=0;
  }
  atBottomH=false;
}

///////////////////////
//start over at end of day
void restartH() {
  if (atBottomH) {
    flames=0;

    heightH=0;
    heightM=0;
    YSwing=heightH-50;
    YSwing2=heightH-25;
    YSwing3=heightH+25;
    YSwing4=heightH+50;
  }
  atBottomH=false;
}
///////////////////
void drawFlames() {//draws 20 each second?
  flames++;//add new flame to counter
  for (int i=0;i<=4;i++) {//hours

    FH=0;
    fill(FH, 96, 99);
    stroke(FH, 96, 99);

    // println(candleX[i]+"candleX[i]");
    //println(candleH+"candleH");
    //add multiple layers
    tX=candleXH[i]+(candleW/2);
    lX=candleXH[i]-10+(candleW/2);
    bX=candleXH[i]+(candleW/2);
    rX=candleXH[i]+10+(candleW/2);

    tY=heightH-40;
    lY=heightH-20;
    bY=heightH;
    rY=heightH+-20;
    candleXR[i]=(rX);
    candleXL[i]=(lX);
    candleYR[i]=(rY);
    candleYL[i]=(lY);
    quad(tX, tY, lX, lY, bX, bY, rX, rY);
    for (int j=0;j<flames*2;j++) {
      // println(flames+"flames");

      FH+=3;
      stroke(FH, 96, 99);
      noFill();
      lX-=4;

      rX+=4;

      tY-=4;
      lY+=2;
      rY+=2;
      quad(tX, tY, lX, lY, bX, bY, rX, rY);
    }
  }
  //////////////////////////////////////
  for (int h=0;h<=14;h++) {//minutes

    FH=0;
    fill(FH, 96, 99);
    stroke(FH, 96, 99);
    tXM=candleXM[h]+(candleW/2);
    lXM=candleXM[h]-10+(candleW/2);
    bXM=candleXM[h]+(candleW/2);
    rXM=candleXM[h]+10+(candleW/2);

    tYM=heightM-40;
    lYM=heightM-20;
    bYM=heightM;
    rYM=heightM+-20;
    quad(tXM, tYM, lXM, lYM, bXM, bYM, rXM, rYM);
    for (int j=0;j<flames*2;j++) {
      //println(flames+"flames");

      FH+=3;
      stroke(FH, 96, 99);
      noFill();

      lXM-=4;

      rXM+=4;

      tYM-=4;
      lYM+=2;
      rYM+=2;
      quad(tXM, tYM, lXM, lYM, bXM, bYM, rXM, rYM);
    }
    //top point, left point,bottom point,right point
  }
}

////////////////////////
//no longer using 
// replace with swing????

//should be doing every second but is not
void flicker() {
  for (int i=0;i<=1;i++) {//for each candle

    FH=33;
    fill(FH, 96, 99);
    stroke(FH, 96, 99);

    tX=candleXH[i]+(candleW/2);
    lX=candleXH[i]-10+(candleW/2);
    bX=candleXH[i]+(candleW/2);
    rX=candleXH[i]+10+(candleW/2);

    tY=heightH-40;
    lY=heightH-20;
    bY=heightH;
    rY=heightH+-20;
    //quad(tX, tY, lX, lY, bX, bY, rX, rY);//top point, left point,bottom point,right point
    //if (flames>=3) {
    //for (int j=0;j<2;j++) {
    FH+=2;
    if (FH>=355) {
      FH=33;
    }
    stroke(FH, 96, 99);
    noFill();
    lX-=4;

    rX+=4;

    tY-=4;
    lY+=2;
    rY+=2;
    quad(tX, tY, lX, lY, bX, bY, rX, rY);
    //}
    //colorchange to first 3 flames on each candle
    //every second
    //  }
  }
}


void swing() {/////doooooooooo thisssssssssss
  ///array of values of arc
  //on half hour
  ///change xposiyion and y position
  //know hit both sides
  //know hit middle
//  int temp =heightH;
//  heightH=YSwing2;
//  background(0);
//  drawCandlesH();
//  heightH= YSwing;
//  background(0);
//  drawCandlesH();
//  println(heightH+"HHH");
//  heightH= YSwing2;
//  background(0);
//  drawCandlesH();
//  heightH=heightH;
//  background(0);
//  drawCandlesH();
//  heightH=YSwing3;
//  background(0);
//  drawCandlesH();
//  heightH= YSwing4;
//  background(0);
//  drawCandlesH();
//  heightH= YSwing3;
//  println(heightH+"HHHHHHHHHHHH");
//  background(0);
//  drawCandlesH();
//  heightH=temp;
//  background(0);
//  drawCandlesH();
}
void explode() {//have lines in colors go everywhere
  //save colors and lines
  for (int i=0;i<=4;i++) {
    line(candleXL[i], candleYL[i], candleXR[i], candleYR[i]);
    line((candleXR[i]-candleXL[i])/2+candleXL[i], candleYL[i], (candleXR[i]-candleXL[i])/2+candleXL[i], height); 
    //println(
  }
}
//////////////////////////
//part of test process
void mousePressed() {

  lowerH();

  lowerM();
}
void keyPressed() {

  explode();
}



