
// ripples - multiples
// hair? antennae?
//work with interaction more
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



void setup() {
  size (700, 350);
  background(255);
  smooth();
  int i = 0;
  while (i<36) {
    y[i] = y[i]*2;
    i++;
  }
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
  println(colvar);
  colvar = colvar+lineStackHL/2-lineStackHR/2;
    color water = lerpColor(b, g, colvar);
  if (explodeOccur == 1) {
    explodeOccurs();
    if (explodeTimer>30) {
      fill(water, 100);
      //  fill(255, 255);
    }
    else {
      fill(water, 20);
      //   fill(255, 255);
    }
    rectMode (CENTER);
    rect (width/2, height/2, width+width/2, height+height/2);
  }
  if (stage == 0) {
    fill(water, 20);
    //fill(255, 255);
    rectMode (CENTER);
    rect (width/2, height/2, width+width/2, height+height/2);
    temp_[0] = temp;
    if ((keyPressed)&&((ellipseX>boxX+20)||(ellipseX<boxX-20)||(ellipseY>boxY+20)||(ellipseY<boxY-20))) {
      temp = temp-dist(ellipseX, ellipseY, boxX, boxY)/1200;
    }
    else {
      temp = temp-dist(ellipseX, ellipseY, boxX, boxY)/1200;
    }
    ripple();
    //  /  emerge();
    explodeCount();
    wanderTimer();
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
      //   /   wake();
      strokeWeight(sw*0.8);
      delayTimer++;
      if (delayTimer > 10) {
        ellipsemodX = (boxX-ellipseX)/45;
        ellipsemodY = (boxY-ellipseY)/45;
        delayTimer = 0;
      }
    }
    else {
      if (((lastKey<=57)&&(lastKey>=48)&&(keyStoreX != x[lastKey-48]))||((lastKey<=90)&&(lastKey>=65)&&(keyStoreX != x[lastKey-55]))) {
      }
      delayTimer++;
      if (delayTimer > 10) {
        ellipsemodX = (boxX-ellipseX+wanderX)/80;
        ellipsemodY = (boxY-ellipseY+wanderY)/80;
        delayTimer = 0;
      }
    }
    ellipseH_[0] = ellipseH;
    ///    ellipseH = (sqrt(sq(boxX-(ellipseX+ellipseH*sin(temp)))+sq(boxY-(ellipseY+ellipseH*cos(temp)))));
    ellipseX_[0] = ellipseX;
    ellipseY_[0] = ellipseY;
    ellipseX = ellipseX+ellipsemodX;
    ellipseY = ellipseY+ellipsemodY;
    stroke(0);
    //   point (ellipseX, ellipseY);
    //   line (ellipseX, ellipseY, ellipseX-ellipsemodX_, ellipseY-ellipsemodY_);
    // point (ellipseX+10*sin(temp), ellipseY+10*cos(temp));
    line(ellipseX+ellipseH*sin(temp), ellipseY+ellipseH*cos(temp), ellipseX_[0]-ellipsemodX_[0]+ellipseH_[0]*sin(temp_[0]), ellipseY_[0]-ellipsemodY_[0]+ellipseH_[0]*cos(temp_[0]));
    eyesTheta_ = eyesTheta_;
    int k = 1;
    while (k<20){
      strokeWeight (10-kstroke/2);
    line(ellipseX_[k]-ellipsemodX_[k]+ellipseH_[k]*sin(temp_[k]), ellipseY_[k]-ellipsemodY_[k]+ellipseH_[k]*cos(temp_[k]), ellipseX_[k-1]-ellipsemodX_[k-1]+ellipseH_[k-1]*sin(temp_[k-1]), ellipseY_[k-1]-ellipsemodY_[k-1]+ellipseH_[k-1]*cos(temp_[k-1]));
    kstroke++;
    k++;
    }
    kstroke = 0;
    if ((ellipseX+ellipseH*cos(temp)-(ellipseX-ellipsemodX_[0]+ellipseH*cos(temp_[0])))<0) {
      eyesTheta = -asin((ellipseY+ellipseH*cos(temp)-(ellipseY-ellipsemodY_[0]+ellipseH*cos(temp_[0])))/(sqrt(sq((ellipseX+ellipseH*sin(temp))-(ellipseX-ellipsemodX_[0]+ellipseH*sin(temp_[0])))+sq((ellipseY+ellipseH*cos(temp))-(ellipseY-ellipsemodY_[0]+ellipseH*cos(temp_[0]))))));
    }
    if ((ellipseY+ellipseH*cos(temp)-(ellipseY-ellipsemodY_[0]+ellipseH*cos(temp_[0])))<0) {
      eyesTheta = -asin((ellipseX+ellipseH*sin(temp)-(ellipseX-ellipsemodX_[0]+ellipseH*sin(temp_[0])))/(sqrt(sq((ellipseX+ellipseH*sin(temp))-(ellipseX-ellipsemodX_[0]+ellipseH*sin(temp_[0])))+sq((ellipseY+ellipseH*cos(temp))-(ellipseY-ellipsemodY_[0]+ellipseH*cos(temp_[0]))))));
    }
    if ((ellipseY+ellipseH*cos(temp)-(ellipseY-ellipsemodY_[0]+ellipseH*cos(temp_[0])))>0) {
      eyesTheta = acos((ellipseY+ellipseH*cos(temp)-(ellipseY-ellipsemodY_[0]+ellipseH*cos(temp_[0])))/(sqrt(sq((ellipseX+ellipseH*sin(temp))-(ellipseX-ellipsemodX_[0]+ellipseH*sin(temp_[0])))+sq((ellipseY+ellipseH*cos(temp))-(ellipseY-ellipsemodY_[0]+ellipseH*cos(temp_[0]))))));
    }
    if ((ellipseY+ellipseH*cos(temp)-(ellipseY-ellipsemodY_[0]+ellipseH*cos(temp_[0])))>0) {
      eyesTheta = PI+asin((ellipseX+ellipseH*sin(temp)-(ellipseX-ellipsemodX_[0]+ellipseH*sin(temp_[0])))/(sqrt(sq((ellipseX+ellipseH*sin(temp))-(ellipseX-ellipsemodX_[0]+ellipseH*sin(temp_[0])))+sq((ellipseY+ellipseH*cos(temp))-(ellipseY-ellipsemodY_[0]+ellipseH*cos(temp_[0]))))));
    }
    /////////////////////////////////// y is o
    //SWIRLTAIL FAIL
//    int b = 0;
//    while (b<20) {
//      strokeWeight(8-(b/3));
//      v_[b] = v;
//      c_[b] = c;
  //    v = ellipseX_[b]+ellipseH_[b]*sin(temp_[b]);
//      c = ellipseY_[b]+ellipseH_[b]*cos(temp_[b]);
//      point (v_[b]+2*cos(radians(i)*5), c_[b]+2*cos(radians(i)*5)+h);
//      h = h+0.5;
//      i = i+radians(2);
//      b++;
//    }
//    i = i+radians(2);
//    h = 0;

    strokeWeight(2);
    stroke(255);
    point (ellipseX+ellipseH*sin(temp)-1*sin(eyesTheta)-1, ellipseY+ellipseH*cos(temp)-3*cos(eyesTheta));
    point (ellipseX+ellipseH*sin(temp)-1*sin(eyesTheta)+1, ellipseY+ellipseH*cos(temp)-3*cos(eyesTheta));
    stroke(0);
    keyCheck();
    //   rect (width+10, 0, -lineStackHL*40, 10);
    //  rect (-10, 0, lineStackHR*40, 10);
    //  rect (0, height+10, 10, -lineStackVU*40);
    //  rect (width-10, -10, 10, lineStackVD*40);
    shapeTimer++;
    if ((shapeTimer>30)&&(shapeTimerOn = true)) {
      shapeTimer =  0;
      lineStackHL = 0;
      lineStackHR = 0;
      lineStackVU = 0;
      lineStackVD = 0;
      shapeTimerOn = false;
    }
  }
  
  if (startup>0){
    fill(255);
    rectMode(CENTER);
    rect(width/2-20, height/2-20, width+40, height+40);
    startup = startup-1;
  }
}

void keyPressed() {
  lastKey = keyCode;
}


void keyCheck() {
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
      }
      if ((keyStoreX == x[lastKey-48]-2)&&(keyStoreY == y[lastKey-48])) {
        lineStackHR = lineStackHR+1;
      }
      else {
        if (keyStoreX != x[lastKey-48])
          lineStackHR = 0;
      }
      if (((keyStoreX == x[lastKey-48]-1)||(keyStoreX == x[lastKey-48]+1))&&(keyStoreY == y[lastKey-48]+2)) {
        lineStackVU = lineStackVU+1;
      }
      else {
        if (keyStoreX != x[lastKey-48])
          lineStackVU = 0;
      }
      if (((keyStoreX == x[lastKey-48]-1)||(keyStoreX == x[lastKey-48]+1))&&(keyStoreY == y[lastKey-48]-2)) {
        lineStackVD = lineStackVD+1;
      }
      else {
        if (keyStoreX != x[lastKey-48])
          lineStackVD = 0;
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
      }
      if ((keyStoreX == x[lastKey-55]-2)&&(keyStoreY == y[lastKey-55])) {
        lineStackHR = lineStackHR+1;
      }
      else {
        if (keyStoreX != x[lastKey-55])
          lineStackHR = 0;
      }
      if (((keyStoreX == x[lastKey-55]-1)||(keyStoreX == x[lastKey-55]+1))&&(keyStoreY == y[lastKey-55]+2)) {
        lineStackVU = lineStackVU+1;
      }
      else {
        if (keyStoreX != x[lastKey-55])
          lineStackVU = 0;
      }
      if (((keyStoreX == x[lastKey-55]-1)||(keyStoreX == x[lastKey-55]+1))&&(keyStoreY == y[lastKey-55]-2)) {
        lineStackVD = lineStackVD+1;
      }
      else {
        if (keyStoreX != x[lastKey-55])
          lineStackVD = 0;
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

void explodeCount() {
  if ((explodeCount>0)) {
    explodeCount = explodeCount-1;
  }
  if ((keyPressed)&&((lastKey<=57)&&(lastKey>=48)&&(keyStoreX != x[lastKey-48]))||((lastKey<=90)&&(lastKey>=65)&&(keyStoreX != x[lastKey-55]))) {
    explodeCount = explodeCount+5;
  }
  if (explodeCount>100) {
    explodeOccur = 1;
    explodeCount = 0;
    explodeTimer = 0;
    stage = 1;
  }
}

void explodeOccurs() {
  if (explodeOccur == 1) {
    stage = 1;
    if (explodeTimer<150) {
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
      if (explodeTimer>30) {
        fill(255, 30);
        stroke(0);
        int k = 0;
        while (k<50) {
          strokeWeight(sw*random(0.1, 0.5));
          stroke(115, 17, 17);
          //   point (ellipseX+hStack*cos(t[k]), ellipseY+hStack*sin(t[k]));
          line (ellipseX+hStack[k]*cos(t[k]), ellipseY+hStack[k]*sin(t[k]), ellipseX+hStack_[k]*cos(t[k]), ellipseY+hStack_[k]*sin(t[k]));
          k++;
        }
      }
      stroke(0);
      explodeTimer++;
      if (explodeTimer>30) {
        int m = 0;
        while (m<50) {
          hStack_[m] = hStack[m];
          hStack[m] = hStack[m]+random(7)*4;
          m++;
        }
      }
    }
    else {
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

void ripple() {
  fill(255, 0);
  if ((keyPressed)&&((lastKey<=57)&&(lastKey>=48)&&(keyStoreX != x[lastKey-48]))||((lastKey<=90)&&(lastKey>=65)&&(keyStoreX != x[lastKey-55]))) {
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
  }
  int u = 0;
  while (u<100) {
    strokeWeight(4/(rippleSize[u]+0.1));
    stroke(50+rippleSize[u]*2);
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

void emerge() {
  fill(255, 0);
  if (keyPressed) {
    emergeAble = 1;
  }
  if ((!keyPressed)) {
    ErippleArrayCount++;
    if (ErippleArrayCount>=100) {
      ErippleArrayCount = 0;
      ErippleX_[ErippleArrayCount] =  ellipseX-ellipsemodX+ellipseH*sin(temp);
      ErippleY_[ErippleArrayCount] =  ellipseY-ellipsemodY+ellipseH*sin(temp);
      ErippleSize[ErippleArrayCount] = sw;
    }
  }
  int q = 0;
  while (q<100) {
    strokeWeight(4/(ErippleSize[q]+0.1));
    stroke(50+ErippleSize[q]*2);
    if (emergeAble == 1) {
      ellipse(ErippleX_[q], ErippleY_[q], ErippleSize[q], ErippleSize[q]);
    }
    if (ErippleX_[q]>0) {
      ErippleSize[q]++;
    }
    if (ErippleSize[q]>100) {
      ErippleSize[q] = 0;
      ErippleX_[q] = -100;
      ErippleY_[q] = -100;
      emergeAble = 0;
    }
    q++;
  }
}

void wake() {
  strokeWeight(sw*0.2);
  line(ellipseX_[0]-ellipsemodX_[0]+ellipseH_[0]*sin(temp_[0]), ellipseY_[0]-ellipsemodY_[0]+ellipseH_[0]*cos(temp_[0]), ellipseX_[0]-ellipsemodX_[0]+ellipseH_[0]*sin(temp_[0])+50*cos(eyesTheta+radians(270)), ellipseY_[0]-ellipsemodY_[0]+ellipseH_[0]*cos(temp_[0])+50*sin(eyesTheta+radians(270)));
  line(ellipseX_[0]-ellipsemodX_[0]+ellipseH_[0]*sin(temp_[0]), ellipseY_[0]-ellipsemodY_[0]+ellipseH_[0]*cos(temp_[0]), ellipseX_[0]-ellipsemodX_[0]+ellipseH_[0]*sin(temp_[0])-50*cos(eyesTheta+radians(270)), ellipseY_[0]-ellipsemodY_[0]+ellipseH_[0]*cos(temp_[0])-50*sin(eyesTheta+radians(270)));
}


