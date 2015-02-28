
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


int extrasCount = 300;

Minim minim;
AudioPlayer[] wooshplayer = new AudioPlayer[extrasCount];
AudioPlayer backgroundplayer;
AudioPlayer vortexplayer;
AudioPlayer splatplayer;
AudioPlayer vortexoutplayer;


int[] x = {
  19, 1, 3, 5, 7, 9, 11, 13, 15, 17, 3, 12, 8, 7, 6, 9, 11, 13, 16, 15, 17, 19, 16, 14, 18, 20, 2, 8, 5, 10, 14, 10, 4, 6, 12, 4
};
int[] y = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 3, 2, 1, 2, 2, 2, 1, 2, 2, 2, 3, 3, 1, 1, 1, 1, 2, 1, 1, 3, 1, 3, 1, 3
};

int boxX = 350;
int boxY = 250;

int rippleDelay = 0;

int boxSpacing = 30;
int boxSize = 5;
int lastKey = 48;

float ellipsemodX = 0;
float ellipsemodY = 0;

float sw = 12;

float wanderX = 0;
float wanderY = 0;
int wanderTimer = 0;

int eWanderTimer = 0;

int delayTimer = 0;

int explodeCount = 0;
int explodeOccur = 0;
float[] hStack = new float [50];
float[] hStack_ = new float [50];
float t[] = new float [50];
int explodeTimer = 0;
int explodeShake = 0;

float eyesTheta = 0;
float eyesTheta_ = 0;

int[] rippleX_ = new int [100];
int[] rippleY_ = new int [100];
int[] rippleSize = new int [130];
int rippleArrayCount = 0;

int rippleOn = 1;
int vortexTimer = 0;
int vortexOn = 0;
int vortexed = 0;
int vortexAfterCounter = 0;
int vortexCooldown = 0;
int vtxOn = 1;
float vsw = sw;
float vortexSpotX = 0;
float vortexSpotY = 0;

float[] ErippleX_ = new float [100];
float[] ErippleY_ = new float [100];
float[] ErippleSize = new float [130];
int ErippleArrayCount = 0;

float ellipseX = 350;
float ellipseY = 250;
float[] ellipseX_ = new float [20];
float[] ellipseY_ = new float [20];
float[] ellipsemodX_ = new float [20];
float[] ellipsemodY_ = new float [20];


int lineStackHL = 0;
int lineStackHR = 0;
int lineStackVU = 0;
int lineStackVD = 0;
int shapeTimer = 0;
boolean shapeTimerOn = false;
float temp = 0;
float[] temp_ = new float[20];

int keyStoreY;
int keyStoreX;
float r = 0;

float esw = 1;
float ellipseH = 10;
float[] ellipseH_ = new float [20];
float ellipseHactual = 10;

float kstroke = 0;

float startup = 1;

int stage = 0;

int emergeAble = 0;

float theta2 = 0;

float[] tailX = new float [360];
float[] tailY = new float [360];

float v = 0;
float[] v_ = new float [20];
float c = 0;
float[] c_ = new float [20];
float i;
float h;
int negCheck = 1;

color g = color(112, 198, 162);
color b = color(112, 146, 198);
float colvar = 0.5;

int blinkChance = 0;
int blinkOn = 0;

float[] extrasXmod = new float [extrasCount];
float[] extrasYmod =  new float [extrasCount];

int collected = extrasCount;
int[] collectable = new int [extrasCount];
int[] collectable_ = new int [extrasCount];

float bgR = 10;
float bgG = 18;
float bgB = 28;

PImage glow;

float jerryX;
float jerryY;
float[] jerryX_ = new float [20];
float[] jerryY_ = new float [20];

int overloaded = 0;

float currentX = 0;
float currentY = 0;

int lineStackHR_;
int lineStackHL_;
int lineStackVU_;
int lineStackVD_;

int lineBrokenX = 0;
int lineBrokenY = 0;

float bloodDropX[] = new float[20];
float bloodDropS[] = new float[20];
float bloodDropY[] = new float[20];

//home



void setup() {
  size (700, 350);
  background(255);
  smooth();
  glow = loadImage("Glow.png");
  int i = 0;
  minim = new Minim(this);
  while (i<36) {
    y[i] = y[i]*2;
    i++;
  }
  int g = 0;
  while (g<20) {
    bloodDropY[g] = (int)random(-60, -10);
    bloodDropX[g] = (int)random(width);
    bloodDropS[g] = random(1, 10);
    g++;
  }
  backgroundplayer = minim.loadFile("Background.wav");
  vortexplayer = minim.loadFile("Vacuum.wav");
  splatplayer = minim.loadFile("Splat.wav");
  vortexoutplayer = minim.loadFile("VortexOut.wav");
  thetaGenerate();
  int w = 0;
  while (w<100) {
    rippleX_[w] = -100;
    rippleY_[w] = -100;
    rippleSize[w] = 0;
    ErippleX_[w] = -100;
    ErippleY_[w] = -100;
    ErippleSize[w] = sw;
    w++;
  }
  int d = 0;
  while (d<extrasCount) {
    collectable[d] = -1;
    collectable_[d] = -1;
    wooshplayer[d] = minim.loadFile("Woosh2.wav");
    d++;
  }
  int l = 0;
  while (l<20) {
    ellipseX_[l] = 350;
    ellipseY_[l] = 250;
    ellipsemodX_[l] = 350;
    ellipsemodY_[l] = 250;
    l++;
  }
  startup = 30;
}

void draw() {
  if (backgroundplayer.isPlaying() == false) {
    backgroundplayer.play(1);
  }
  if (explodeOccur == 1) {
    explodeOccurs();
    if (explodeTimer>=30) {
      fill(bgR, bgG, bgB, 100);
      //  fill(255, 255);
    }
    if (explodeTimer<30) {
      fill(bgR, bgG, bgB, 20);
      //   fill(255, 255);
    }
    if (explodeTimer>=80) {
      fill(bgR, bgG, bgB, 10);
    }
    rectMode (CENTER);
    rect (width/2, height/2, width+width/2, height+height/2);
  }
  if (stage == 0) {
    extrasWanerTimer();
    collect();
    bgGenerate();
    if (vortexCooldown>0) {
      vortexCooldown--;
    }
    if (blinkOn>0) {
      blinkOn--;
    }
    fill(bgR, bgG, bgB, 100);
    //fill(255, 255);
    rectMode (CENTER);
    rect (width/2, height/2, width+width/2, height+height/2);
    //bulb glow
    //    int j = 0;
    //    if (collected<100) {
    //      while (j<10+collected*0.8) {
    //        fill(255, 216, 21, 1);
    //        noStroke();
    //        ellipse(ellipseX_[8]+ellipseH_[8]*sin(temp_[8]), ellipseY_[8]+ellipseH_[8]*cos(temp_[8])-15, 2*j, 2*j);
    //        j++;
    //      }
    //    }
    //    else {
    //      while (j<110) {
    //        fill(255, 216, 21, 1);
    //        noStroke();
    //        ellipse(ellipseX_[8]+ellipseH_[8]*sin(temp_[8]), ellipseY_[8]+ellipseH_[8]*cos(temp_[8])-15, 2*j, 2*j);
    //        j++;
    //      }
    //    }
    tint(255, collected/2);
    image(glow, ellipseX_[8]+ellipseH_[8]*sin(temp_[8])-99, ellipseY_[8]+ellipseH_[8]*cos(temp_[8])-15-99);
    extras();
    temp_[0] = temp;
    if ((keyPressed)&&((ellipseX>boxX+20)||(ellipseX<boxX-20)||(ellipseY>boxY+20)||(ellipseY<boxY-20))) {
      temp = temp-(dist(ellipseX, ellipseY, boxX, boxY))/1300;
    }
    else {
      temp = temp-dist(ellipseX, ellipseY, boxX, boxY)/1250;
    }
    ripple();
    explodeCount();
    if (vortexOn == 0) {
      wanderTimer();

      vortexplayer.pause();
      vortexplayer.rewind();
    }
    else {
      vortexPull();
    }
    int g = 19;
    while (g>0) {
      ellipseX_[g] = ellipseX_[g-1];
      ellipseY_[g] = ellipseY_[g-1];
      ellipsemodX_[g] = ellipsemodX_[g-1];
      ellipsemodY_[g] = ellipsemodY_[g-1];
      ellipseH_[g] = ellipseH_[g-1];
      temp_[g] = temp_[g-1];
      g = g-1;
    }
    ellipsemodX_[0] = ellipsemodX;
    ellipsemodY_[0] = ellipsemodY;
    strokeWeight(sw);
    if ((keyPressed)&&((ellipseX>boxX+45)||(ellipseX<boxX-45)||(ellipseY>boxY+45)||(ellipseY<boxY-45))) {
      strokeWeight(sw*0.8);
      delayTimer++;
      if (delayTimer > 10) {
        ellipsemodX = (boxX-ellipseX)/30;
        ellipsemodY = (boxY-ellipseY)/30;
        delayTimer = 0;
      }
    }
    else {
      if (((lastKey<=57)&&(lastKey>=48)&&(keyStoreX != x[lastKey-48]))||((lastKey<=90)&&(lastKey>=65)&&(keyStoreX != x[lastKey-55]))) {
      }
      delayTimer++;
      if (delayTimer > 10) {
        ellipsemodX = (boxX-ellipseX+wanderX)/60;
        ellipsemodY = (boxY-ellipseY+wanderY)/60;
        delayTimer = 0;
      }
    }
    ellipseH_[0] = ellipseH;
    ///    ellipseH = (sqrt(sq(boxX-(jerryX))+sq(boxY-(jerryY))));
    ellipseX_[0] = ellipseX;
    ellipseY_[0] = ellipseY;
    ellipseX = ellipseX+ellipsemodX;
    ellipseY = ellipseY+ellipsemodY;
    stroke(0);
    if (vortexOn == 1) {
      vortexPull();
    }
    else {
      ellipseH = 10;
    }
    int q = 0;
    while (q<20) {
      jerryX_[q] = ellipseX_[q]-ellipsemodX_[q]+ellipseH_[q]*sin(temp_[q]);
      jerryY_[q] =  ellipseY_[q]-ellipsemodY_[q]+ellipseH_[q]*cos(temp_[q]);
      q++;
    }
    jerryX = ellipseX+ellipseH*sin(temp);
    jerryY = ellipseY+ellipseH*cos(temp);
    if (vortexed == 0) {
      /// main
      line(jerryX, jerryY, jerryX_[0], jerryY_[0]);
    }
    else {
      point(jerryX, jerryY);
    }
    eyesTheta_ = eyesTheta_;
    int k = 1;
    while (k<20) {
      if (vortexAfterCounter<21) {
        stroke(0, 0);
      }
      else {
        stroke(255, 255, 255, 20);
        strokeWeight((3-kstroke/9));
        line(jerryX_[k], jerryY_[k]-sw/2+(10-kstroke/2), jerryX_[k-1], jerryY_[k-1]-sw/2+(10-kstroke/2));
        stroke(0);
        strokeWeight (10-kstroke/2);
        line(jerryX_[k], jerryY_[k], jerryX_[k-1], jerryY_[k-1]);
      }
      kstroke++;
      k++;
    }
    kstroke = 0;
    if ((jerryX-jerryY)<0) {
      eyesTheta = -asin((jerryY-(jerryY_[0])/(sqrt(sq((jerryX)-jerryX_[0])+sq((jerryY)-jerryY_[0])))));
    }
    if ((jerryY-jerryY_[0])<0) {
      eyesTheta = -asin((jerryX-jerryX_[0])/(sqrt(sq((jerryX)-jerryX_[0])+sq((jerryY)-jerryY_[0]))));
    }
    if ((jerryY-jerryY_[0])>0) {
      eyesTheta = acos((jerryY-jerryY_[0])/(sqrt(sq((jerryX)-jerryX_[0])+sq((jerryY)-jerryY_[0]))));
    }
    if ((jerryY-jerryY_[0])>0) {
      eyesTheta = PI+asin((jerryX-jerryX_[0])/(sqrt(sq((jerryX)-jerryX_[0])+sq((jerryY)-jerryY_[0]))));
    }
    //ADDONS
    strokeWeight(4);
    stroke(255);
    line (jerryX_[8], jerryY_[8]-15, jerryX_[9], jerryY_[9]-15);

    stroke(0);
    int b = 1;
    while (b<9) {
      strokeWeight(1);
      line (jerryX_[b], jerryY_[b]-(b+4+2), jerryX_[b+1], jerryY_[b+1]-(b+4+2));
      b++;
    }
    blinkChance = (int)random(1000);
    if ((blinkChance>985)&&(!keyPressed)) {
      blinkOn = 7;
    }
    if (blinkOn>0) {
      strokeWeight(0);
    }
    else {
      strokeWeight(2);
    }
    if (vortexCooldown>1) {
      strokeWeight(vortexCooldown/8);
    }
    stroke(255);
    point (jerryX-1*sin(eyesTheta)-2, jerryY-3*cos(eyesTheta));
    point (jerryX-1*sin(eyesTheta)+2, jerryY-3*cos(eyesTheta));
    stroke(0);
    keyCheck();
    //   rect (width+10, 0, -lineStackHL*40, 10);
    //  rect (-10, 0, lineStackHR*40, 10);
    //  rect (0, height+10, 10, -lineStackVU*40);
    //  rect (width-10, -10, 10, lineStackVD*40);
    shapeTimer++;
    if ((shapeTimer>50)&&(shapeTimerOn = true)) {
      shapeTimer =  0;
      lineStackHL = 0;
      lineStackHR = 0;
      lineStackVU = 0;
      lineStackVD = 0;
      shapeTimerOn = false;
    }
  }
  if (((lineStackHR != lineStackHR_)||(lineStackHL != lineStackHL_))&&(lineBrokenX == 1)) {
    currentX = currentX+lineStackHL*1.5-lineStackHR*1.5;
    if (currentX>20) {
      currentX = 20;
    }
    if (currentX<-20) {
      currentX = -20;
    }
  }
  else {
    if (currentX>0) {
      currentX = currentX-0.1;
    }
    if (currentX<0) {
      currentX = currentX+0.1;
    }
  }
  if (((lineStackVU != lineStackVU_)||(lineStackVD != lineStackVD_))&&(currentY<20)&&(lineBrokenY == 1)) {
    currentY = currentY+lineStackVU*2-lineStackVD*2;
    if (currentY>20) {
      currentY = 20;
    }
    if (currentY<-20) {
      currentY = -20;
    }
  }
  else {
    if (currentY>0) {
      currentY = currentY-0.1;
    }
    if (currentY<0) {
      currentY = currentY+0.1;
    }
  }
  if (sq(currentX)<5) {
    lineBrokenX = 0;
  }
  if (sq(currentY)<5) {
    lineBrokenY = 0;
  }

  if (startup>0) {
    fill(10, 18, 28);
    rectMode(CENTER);
    rect(width/2-20, height/2-20, width+40, height+40);
    startup = startup-1;
    int d = 0;
    while (d<extrasCount) {
      extrasX[d] = random(jerryX-600, jerryX+600);
      extrasY[d] = random(jerryX-600, jerryY+600);
      extrasXmod[d] = extrasX[d];
      extrasYmod[d] = extrasY[d];
      d++;
    }
  }
}

void keyPressed() {
  lastKey = keyCode;
}

void keyCheck() {
  lineStackHL_ = lineStackHL;
  lineStackHR_ = lineStackHR;
  lineStackVU_ = lineStackVU;
  lineStackVD_ = lineStackVD;
  if (keyPressed) {
    shapeTimerOn = true;
    if ((lastKey<=57)&&(lastKey>=48)) {
      fill(0, 255);
      boxX = x[lastKey-48]*boxSpacing;
      boxY = y[lastKey-48]*boxSpacing+100;
      if ((keyStoreX == x[lastKey-48]+2)&&(keyStoreY == y[lastKey-48])) {
        lineStackHL = lineStackHL+1;
      }
      else {
        if (keyStoreX != x[lastKey-48])
          lineStackHL = 0;
        lineBrokenX = 1;
      }
      if ((keyStoreX == x[lastKey-48]-2)&&(keyStoreY == y[lastKey-48])) {
        lineStackHR = lineStackHR+1;
      }
      else {
        if (keyStoreX != x[lastKey-48])
          lineStackHR = 0;
        lineBrokenX = 1;
      }
      if (((keyStoreX == x[lastKey-48]-1)||(keyStoreX == x[lastKey-48]+1))&&(keyStoreY == y[lastKey-48]+2)) {
        lineStackVU = lineStackVU+1;
      }
      else {
        if (keyStoreX != x[lastKey-48])
          lineStackVU = 0;
        lineBrokenY= 1;
      }
      if (((keyStoreX == x[lastKey-48]-1)||(keyStoreX == x[lastKey-48]+1))&&(keyStoreY == y[lastKey-48]-2)) {
        lineStackVD = lineStackVD+1;
      }
      else {
        if (keyStoreX != x[lastKey-48])
          lineStackVD = 0;
        lineBrokenY = 1;
      }
      if (keyStoreX != lastKey) {
        keyStoreX = x[lastKey-48];
        keyStoreY = y[lastKey-48];
      }
    }
  }

  if (keyPressed) {
    if ((lastKey<=90)&&(lastKey>=65)) { 
      fill(0, 255);
      boxX = x[lastKey-55]*boxSpacing;
      boxY = y[lastKey-55]*boxSpacing+100;
      // ellipse (boxX, boxY, boxSize, boxSize);
      if ((keyStoreX == x[lastKey-55]+2)&&(keyStoreY == y[lastKey-55])) {
        lineStackHL = lineStackHL+1;
      }
      else {
        if (keyStoreX != x[lastKey-55])
          lineStackHL = 0;
        lineBrokenX = 1;
      }
      if ((keyStoreX == x[lastKey-55]-2)&&(keyStoreY == y[lastKey-55])) {
        lineStackHR = lineStackHR+1;
      }
      else {
        if (keyStoreX != x[lastKey-55])
          lineStackHR = 0;
        lineBrokenX = 1;
      }
      if (((keyStoreX == x[lastKey-55]-1)||(keyStoreX == x[lastKey-55]+1))&&(keyStoreY == y[lastKey-55]+2)) {
        lineStackVU = lineStackVU+1;
      }
      else {
        if (keyStoreX != x[lastKey-55])
          lineStackVU = 0;
        lineBrokenY = 1;
      }
      if (((keyStoreX == x[lastKey-55]-1)||(keyStoreX == x[lastKey-55]+1))&&(keyStoreY == y[lastKey-55]-2)) {
        lineStackVD = lineStackVD+1;
      }
      else {
        if (keyStoreX != x[lastKey-55])
          lineStackVD = 0;
        lineBrokenY = 1;
      }
      keyStoreX = x[lastKey-55];
      keyStoreY = y[lastKey-55];
    }
  }
}



void wanderTimer() {
  wanderTimer++;
  if (wanderTimer>((int)random(30, 50))) {
    wanderX = (int)random(-20, 20);
    wanderY = (int)random(-20, 20);
    wanderTimer = 0;
  }
}

void extrasWanerTimer() {
  eWanderTimer++;
  if (eWanderTimer>((int)random(30, 50))) {
    int d = 0;
    while (d<extrasCount) {
      extrasXmod[d] = extrasXmod[d]+random(-10, 10);
      extrasYmod[d] = extrasYmod[d]+random(-10, 10);
      d++;
      eWanderTimer = 0;
    }
  }
}


void explodeCount() {
  if ((explodeCount>0)) {
    explodeCount = explodeCount-1;
  }
  if (((keyPressed)&&((lastKey<=57)&&(lastKey>=48)&&(keyStoreX != x[lastKey-48])))||((keyPressed)&&((lastKey<=90)&&(lastKey>=65)&&(keyStoreX != x[lastKey-55])))) {
    explodeCount = explodeCount+5;
  }
  if (explodeCount>60) {
    explodeOccur = 1;
    explodeCount = 0;
    explodeTimer = 0;
    stage = 1;
  }
}

void explodeOccurs() {
  if (explodeOccur == 1) {
    stage = 1;
    println(explodeTimer);
    if (explodeTimer<=30) {
      strokeWeight(sw*random(0.9, 1.1));
      stroke(0);
      point (ellipseX+10*sin(temp)+(int)random(10), ellipseY+10*cos(temp)+(int)random(10));
      stroke(255);
      strokeWeight(esw);
      point (ellipseX+10*sin(temp), ellipseY+10*cos(temp));
      point (ellipseX+10*sin(temp)+4, ellipseY+10*cos(temp));

      esw = esw*1.1;
    }
    if ((explodeTimer>30)&&(explodeTimer<80)) {
      if (splatplayer.isPlaying() == false) {
        splatplayer.play(1);
      }
      fill(255, 30);
      stroke(0);
      int k = 0;
      while (k<50) {
        strokeWeight(sw*random(0.1, 0.5));
        stroke(115, 17, 17);
        line (ellipseX+hStack[k]*cos(t[k]), ellipseY+hStack[k]*sin(t[k]), ellipseX+hStack_[k]*cos(t[k]), ellipseY+hStack_[k]*sin(t[k]));
        k++;
      }
    }
    if (explodeTimer>80) {
      int s = 0;
      while (s<20) {
        strokeWeight(bloodDropS[s]);
        stroke(115, 17, 17);
        point(bloodDropX[s], bloodDropY[s]);
        int smear = 1;
        while (smear<100) {
          if(smear<40){
          strokeWeight(bloodDropS[s]/(2.5));
          }else{
            strokeWeight(bloodDropS[s]/5);
          }
          point(bloodDropX[s], bloodDropY[s]-smear);
          smear++;
        }
        s++;
      }
      int t = 0;
      while (t<20) {
        bloodDropY[t] = bloodDropY[t]+(5-(bloodDropS[t])/1.8);
        t++;
      }
    }
    explodeTimer++;
    if(explodeTimer>90){
      explodeTimer = 90;
    }
    stroke(0);
    if (explodeTimer>30) {
      int m = 0;
      while (m<50) {
        hStack_[m] = hStack[m];
        hStack[m] = hStack[m]+random(7)*4;
        m++;
      }
    }

    if (explodeTimer>80) {
      if (keyPressed) {
        stage = 0;
        explodeCount = 0;
        explodeOccur = 0;
        explodeTimer = 0;
        esw = 1;
        int n = 0;
        while (n<50) {
          hStack[n] = 0;
          hStack_[n] = 0;
          n++;
        }
        splatplayer.pause();
        splatplayer.rewind();
        int g = 0;
        while (g<20) {
          bloodDropY[g] = (int)random(-60, -10);
          bloodDropX[g] = (int)random(width);
          bloodDropS[g] = random(1, 10);
          g++;
        }
        thetaGenerate();
      }
    }
  }
}



void thetaGenerate() {
  int i = 0;
  while (i<50) {
    t[i] = random(radians(360));
    i++;
  }
}
//VRIPPLE
void ripple() {
  fill(255, 0);
  //  if (((keyPressed)&&((lastKey<=57)&&(lastKey>=48)&&(keyStoreX != x[lastKey-48])))||((keyPressed)&&((lastKey<=90)&&(lastKey>=65)&&(keyStoreX != x[lastKey-55])))) {
  if ((keyPressed)&&(rippleOn == 1)) {
    if ((lastKey<=90)&&(lastKey>=65)) {
      rippleX_[rippleArrayCount] = x[lastKey-55]*boxSpacing;
      rippleY_[rippleArrayCount] = y[lastKey-55]*boxSpacing+100;
    }
    if ((lastKey<=57)&&(lastKey>=48)) {
      rippleX_[rippleArrayCount] = x[lastKey-48]*boxSpacing;
      rippleY_[rippleArrayCount] = y[lastKey-48]*boxSpacing+100;
    }
    rippleArrayCount++;
    if (rippleArrayCount>=100) {
      rippleArrayCount = 0;
    }
    rippleOn = 0;
  }
  if ((((keyPressed)&&((lastKey<=57)&&(lastKey>=48)&&(keyStoreX != x[lastKey-48])))||((keyPressed)&&((lastKey<=90)&&(lastKey>=65)&&(keyStoreX != x[lastKey-55]))))&&(vortexOn == 0)) {
    vortexTimer = 0;
    vtxOn = 0;
  }
  if ((((keyPressed)&&((lastKey<=57)&&(lastKey>=48)&&(keyStoreX == x[lastKey-48])))||((keyPressed)&&((lastKey<=90)&&(lastKey>=65)&&(keyStoreX == x[lastKey-55]))))&&(vtxOn == 1)) {
    vortexTimer = vortexTimer+17;
    vtxOn = 0;
  }

  if (!keyPressed) {
    rippleOn = 1;
    vtxOn = 1;
  }
  if (vortexTimer>0) {
    vortexTimer--;
  }
  if (vortexTimer>70) {
    vortexTimer = 70;
  }
  if ((vortexTimer>50)) {
    vortexOn = 1;
    vortexAfterCounter = 0;
  }
  else {
    vortexOn = 0;
    vortexed = 0;
    vortexAfterCounter++;
  }
  int u = 0;
  while (u<100) {
    strokeWeight(4/(rippleSize[u]+0.1));
    stroke(255, 216, 21, 200-rippleSize[u]*2);
    ellipse(rippleX_[u], rippleY_[u], rippleSize[u], rippleSize[u]);
    if (rippleX_[u]>0) {
      rippleSize[u]++;
    }
    if (rippleSize[u]>100) {
      rippleSize[u] = 0;
      rippleX_[u] = -100;
      rippleY_[u] = -100;
    }
    u++;
  }
}


void vortexPull() {
  if ((vortexplayer.isPlaying() == false)) {
    vortexplayer.play(3);
  }
  vortexoutplayer.rewind();
  //  if ((keyPressed)&&(((keyPressed)&&((lastKey<=57)&&(lastKey>=48)&&(keyStoreX != x[lastKey-48])))||((keyPressed)&&((lastKey<=90)&&(lastKey>=65)&&(keyStoreX != x[lastKey-55]))))&&(vortexed != 1)) {
  //    ellipseX = boxX;
  //    ellipseY = boxY;
  //    vortexed = 0;
  //    vortexOn = 0;
  //    vortexTimer = 0;
  //    
  //  }else{
  temp = temp-0.2;
  ellipsemodX = (boxX-ellipseX)/60;
  ellipsemodY = (boxY-ellipseY)/60;
  if (ellipseH>-1) {
    ellipseH = ellipseH-0.1;
  }
  if (ellipseH<0) {
    strokeWeight(vsw);
    if (vsw>1) {
      vsw *=0.9;
    }
  }
  if (((keyPressed)&&(((keyPressed)&&((lastKey<=57)&&(lastKey>=48)&&(keyStoreX != x[lastKey-48])))||((keyPressed)&&((lastKey<=90)&&(lastKey>=65)&&(keyStoreX != x[lastKey-55])))))&&(vsw<4)&&(ellipseX>boxX-10)&&(ellipseX<boxX+10)&&(ellipseY>boxY-10)&&(ellipseY<boxY+10)) {

    int d = 0;
    while (d<extrasCount) {
      if ((extrasX[d]<(jerryX)+20)&&(extrasX[d]>(jerryX)-20)&&(extrasY[d]<(jerryY+20))&&(extrasY[d]>(jerryY-20))) {
        if ((lastKey<=57)&&(lastKey>=48)) {
          extrasX[d] = x[lastKey-48]*boxSpacing;
          extrasY[d] = y[lastKey-48]*boxSpacing+100;
        }
        if ((lastKey<=90)&&(lastKey>=65)) { 
          extrasX[d] = x[lastKey-55]*boxSpacing;
          extrasY[d] = y[lastKey-55]*boxSpacing+100;
        }
      }
      d++;
    }
    if ((lastKey<=57)&&(lastKey>=48)) {
      ellipseX = x[lastKey-48]*boxSpacing;
      ellipseY = y[lastKey-48]*boxSpacing+100;
      ellipseH = 10;
      temp = 0;
      ellipseX_[0] = x[lastKey-48]*boxSpacing;
      ellipseY_[0] = y[lastKey-48]*boxSpacing+100;
    }
    if ((lastKey<=90)&&(lastKey>=65)) { 
      ellipseX = x[lastKey-55]*boxSpacing;
      ellipseY = y[lastKey-55]*boxSpacing+100;
      ellipseH = 10;
      temp = 0;
      ellipseX_[0] = x[lastKey-55]*boxSpacing;
      ellipseY_[0] = y[lastKey-55]*boxSpacing+100;
    }
    vortexed = 0;
    vortexOn = 0;
    vortexoutplayer.play();
    vortexTimer = 0;
    vsw = sw;
    vortexCooldown = 50;
    vortexplayer.pause();
    vortexplayer.rewind();
  }
}


float[] extrasX = new float [extrasCount];
float[] extrasY = new float [extrasCount];
//ffg
void extras() {
  int d = 0;
  while (d<extrasCount) {
    if (vortexOn == 0) {
      if (dist(jerryX, jerryY, extrasX[d], extrasY[d])<(int)random(30, 50)) {
        extrasX[d] = extrasX[d]+((jerryX)-extrasX[d])/(int)random(20, 60);
        extrasY[d] = extrasY[d]+((jerryY)-extrasY[d])/(int)random(20, 60);
        strokeWeight(1);
        stroke(255, 236, 41, 10);
        if (overloaded == 0) {
          if ((wooshplayer[d].isPlaying() == false)&&(startup == 0)) {
            wooshplayer[d].play();
          }
        }
        else {
          if (d<20) {
            if (wooshplayer[d].isPlaying() == false) {
              wooshplayer[d].play();
            }
          }
        }
        line(extrasX[d], extrasY[d], jerryX_[8], jerryY_[8]-15);
      }
      else {
        if (sq(currentX)< 5) {
          extrasX[d] = extrasX[d]+(extrasXmod[d]-extrasX[d])/(int)random(60, 100);
        }
        else {
          extrasX[d] = extrasX[d]+random(currentX/5, currentX/5-1);
          extrasXmod[d] = extrasXmod[d]+random(currentX/5, currentX/5-1);
        }
        if (sq(currentY)<5) {
          extrasY[d] = extrasY[d]+(extrasYmod[d]-extrasY[d])/(int)random(60, 100);
        }
        else {         
          extrasY[d] = extrasY[d]+random(currentY/5, currentY/5-1);
          extrasYmod[d] = extrasYmod[d]+random(currentY/5, currentY/5-1);
        }
        if (collectable[d] != collectable_[d]) {
          wooshplayer[d].pause();
          wooshplayer[d].rewind();
        }
      }
    }
    else {
      extrasX[d] = extrasX[d]+((jerryX)-extrasX[d])/(int)random(60, 170);
      extrasY[d] = extrasY[d]+((jerryY)-extrasY[d])/(int)random(60, 170);
    }
    collectable_[d] = collectable[d];
    if (dist(jerryX, jerryY, extrasX[d], extrasY[d])<30) {
      collectable[d] = 1;
    }
    else {
      collectable[d] = -1;
    }

    if ((dist(jerryX, jerryY, extrasX[d], extrasY[d])>600)) {
      extrasX[d] = (int)random(jerryX+600);
      extrasY[d] = (int)random(jerryY+600);
      extrasXmod[d] = extrasX[d];
      extrasYmod[d] = extrasY[d];
    }
    if (collectable[d] == 1) {
      strokeWeight(4);
      stroke(255, 236, 41, (255-dist(extrasX[d], extrasY[d], jerryX, jerryY)*1.5)/2);
      point (extrasX[d], extrasY[d]);
    }
    strokeWeight(2);
    stroke(255, 236, 41, 255-dist(extrasX[d], extrasY[d], jerryX, jerryY)*1.5);
    point (extrasX[d], extrasY[d]);
    d++;
  }
}

void collect() {
  int d = 0;
  collected = extrasCount;
  while (d<extrasCount) {
    collected = collected+collectable[d];
    d++;
  }
  if (collected>60) {
    overloaded = 1;
  }
  else {
    overloaded = 0;
  }
}

void bgGenerate() {
  bgR = 10+collected*0.2;
  bgG = 20+collected*0.4;
  bgB = 30+collected*0.6;
}

void stop()
{
  // always close Minim audio classes when you are done with them
  minim.stop();
  super.stop();
}


