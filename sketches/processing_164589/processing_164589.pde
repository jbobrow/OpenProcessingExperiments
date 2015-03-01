
float widt = 750;
float tSize = 50;
color tCol = color(120);//color(200,100,100);
color col = color(120);
float tRad = 100;
int nTargets;
int lastClick;
int maskDrawn = 10000;
int time;
int stimDur = 100;
int maskDur = 1500;
String periphLoc = "";

void setup(){
  size(750,750);
  lastClick = -3000;
}

void draw(){
  time = millis()-lastClick;
  if(time > stimDur && time < stimDur+maskDur && time<maskDrawn){
    drawMask();
    maskDrawn = time;
  }else if(time>stimDur+maskDur){
    waitScreen();
  }
}

void drawStim(){
  background(100);
  drawPeriphTarget();
  drawCentralTargets();
  noStroke();
  fill(0);
  ellipse(widt/2.,widt/2.,3,3);
}

void drawMask(){
  background(color(random(255),random(255),random(255)));
  for(int i=0;i<100;i++){
    drawRandRect();
  }
  noStroke();
  fill(0);
  ellipse(widt/2.,widt/2.,3,3);
}

void waitScreen(){
  background(100);
  noStroke();
  fill(0);
  ellipse(widt/2.,widt/2.,3,3);
  if(time<stimDur+maskDur+1200){
    String infoC = str(nTargets) + " central targets";
    String infoP = "Periph in " + periphLoc;
    textSize(20);
    text(infoC,300,400);
    text(infoP,300,440);
  }
}

void drawRandRect(){
  noStroke();
  fill(color(random(255),random(255),random(255)));
  rect(random(widt)-50,random(widt)-50,random(100)+100,random(100)+100);
}

void drawPeriphTarget(){
  int rando = floor(random(3.99));
  float x = -1000;
  float y = -1000;
  if(rando == 0){
    x = 30;
    y = 30;
    periphLoc = "top left";
  }else if(rando == 1){
    x = 720;
    y = 30;
    periphLoc = "top right";
  }else if(rando == 2){
    x = 720;
    y = 720;
    periphLoc = "bottom right";
  }else if(rando==3){
    x = 30;
    y=720;
    periphLoc = "bottom left";
  }
  noStroke();
  fill(tCol);
  ellipse(x,y,tSize,tSize);
}

void drawCentralTargets(){
  float[] xs = {0,0,0,0,0,0};
  float[] ys = {0,0,0,0,0,0};
  nTargets = floor(random(6.99));
  float x = 0;
  float y = 0;
  noStroke();
  fill(col);
  pushMatrix();
  translate(widt/2.,widt/2.);
  for(int i=0;i<nTargets;i++){
    boolean pass = false;
    while(!pass){
      pass = true;
      x = random(-tRad,tRad);
      y = random(-tRad,tRad);
      for(int j=0;j<i;j++){
        if(sqrt(sq(x-xs[j])+sq(y-ys[j]))<tSize){
          pass = false;
        }
      }
      xs[i] = x;
      ys[i] = y;
    }
    ellipse(x,y,tSize,tSize);
  }
  popMatrix();
}

void mousePressed(){
  lastClick = millis();
  maskDrawn = maskDur*3;//just resetting it
  drawStim();
}


