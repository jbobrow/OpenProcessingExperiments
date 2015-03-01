
float widt = 750;
float tSize = 50;
color tCol = color(200,100,100);
color col = color(100);
float tRad = 50;
int nTargets;
int lastClick;
int time;
int stimDur = 100;

void setup(){
  size(750,750);
  drawStim();
}

void draw(){
  time = millis()-lastClick;
  if(time>stimDur){
    drawMask();
  } 
}

void drawStim(){
  background(255);
  drawPeriphTarget();
  drawCentralTargets();
  noStroke();
  fill(0);
  ellipse(widt/2.,widt/2.,3,3);
}

void drawMask(){
  background(100);
  noStroke();
  fill(0);
  ellipse(widt/2.,widt/2.,3,3);
}

void drawPeriphTarget(){
  int rando = floor(random(4.99));
  float x = -1000;
  float y = -1000;
  if(rando == 1){
    x = 30;
    y = 30;
  }else if(rando == 2){
    x = 720;
    y = 30;
  }else if(rando == 3){
    x = 720;
    y = 720;
  }else if(rando==4){
    x = 30;
    y=720;
  }
  noStroke();
  fill(tCol);
  ellipse(x,y,tSize,tSize);
}

void drawCentralTargets(){
  int[] indices = {1,2,3,4};
  indices = shuffleMe(indices);
  nTargets = floor(random(4.99));
  float x;
  float y;
  noStroke();
  fill(col);
  pushMatrix();
  translate(widt/2.,widt/2.);
  rotate(random(2.*PI));
  for(int i=0;i<nTargets;i++){
    float rad = random(tRad)+tSize;
    if(indices[i]==1 || indices[i]==4){
      x = -rad;
    }else{
      x = rad;
    }
    if(indices[i]==3 || indices[i]==4){
      y = rad;
    }else{
      y = -rad;
    }
    ellipse(x,y,tSize,tSize);
  }
  popMatrix();
} 

int[] shuffleMe (int[] arrMy) {
  for (int k=0; k < arrMy.length; k++) {
    int x = (int)random(0, arrMy.length);
    arrMy = swapValues(arrMy, k, x);
  }
  return arrMy;
}

int[] swapValues (int[] myArray, int a, int b) {
  int temp=myArray[a];
  myArray[a]=myArray[b];
  myArray[b]=temp;
  return myArray;
}

void mousePressed(){
  lastClick = millis();
  drawStim();
}


