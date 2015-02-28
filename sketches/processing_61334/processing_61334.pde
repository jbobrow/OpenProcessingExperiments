
int[] x = {19, 1, 3, 5, 7, 9, 11, 13, 15, 17, 3, 12, 8, 7, 6, 9, 11, 13, 16, 15, 17, 19, 16, 14, 18, 20, 2, 8, 5, 10, 14, 10, 4, 6, 12, 4};
int[] y = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 3, 2, 1, 2, 2, 2, 1, 2, 2, 2, 3, 3, 1, 1, 1, 1, 2, 1, 1, 3, 1, 3, 1, 3};

float boxX = 350;
float boxY = 250;

int boxSpacing = 30;
int boxSize = 50;
int lastKey = 48;

float ellipsemodX = 0;
float ellipsemodY = 0;

float sw = 12;


float ellipseX = 350;
float ellipseY = 250;
float ellipsemodX_ = 350;
float ellipsemodY_ = 250;

boolean restart = false;

void setup(){
  size (700, 350);
  background(255);
  smooth();
  int i = 0;
  while(i<36){
    y[i] = y[i]*2;
    i++;
  }
}

void draw(){
  fill(255, 20);
  rectMode (CENTER);
  rect (width/2, height/2, width+width/2, height+height/2);
  ellipsemodX_ = ellipsemodX;
  ellipsemodY_ = ellipsemodY;
  strokeWeight(sw);
  if(keyPressed){
    ellipsemodX = (boxX-ellipseX)/40;
    ellipsemodY = (boxY-ellipseY)/40;
  strokeWeight(sw*0.8);
  }else{
    ellipsemodX = (boxX-ellipseX)/80;
    ellipsemodY = (boxY-ellipseY)/80;
  }
  ellipseX = ellipseX+ellipsemodX;
  ellipseY = ellipseY+ellipsemodY;
  point (ellipseX, ellipseY);
  line (ellipseX, ellipseY, ellipseX-ellipsemodX_, ellipseY-ellipsemodY_);
  keyCheck();
}

void keyPressed(){
  lastKey = keyCode;
}


void keyCheck(){
  if(keyPressed){
  }
  if (keyPressed){
    if((lastKey<=57)&&(lastKey>=48)){
      fill(0, 255);
      boxX = x[lastKey-48]*boxSpacing;
      boxY = y[lastKey-48]*boxSpacing+100;
      rect (boxX, boxY, boxSize, boxSize);
    }
  }
  if(keyPressed){
   if((lastKey<=90)&&(lastKey>=65)){ 
     fill(0, 255);
     boxX = x[lastKey-55]*boxSpacing;
     boxY = y[lastKey-55]*boxSpacing+100;
      rect (boxX, boxY, boxSize, boxSize);
  }
  }
  
}

void restart(){
  if (restart = true){
    ellipseX = 350;
    ellipseY = 250;
    lastKey = 48;
    background(255);
    restart = false;
  }
}



