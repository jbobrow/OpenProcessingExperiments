
float rad = 80;
float widt = 1000;
int nSides = 15;
float jit = 25;
int lastStim = 0;
int stimDur = 100;
boolean masked = false;

void setup(){
  size(1000,1000);
}

void draw(){
  if(millis()-lastStim>stimDur && masked==false){
    background(128);
    mask();
    masked = true;
  }
}

void makeShapes(){
  int nShapes = floor(random(7.9));
  float[] xs = new float[nShapes];
  float[] ys = new float[nShapes];
  for(int i=0;i<nShapes;i++){
    xs[i] = 10000;
    ys[i] = 10000;
  }
  for(int i=0;i<nShapes;i++){
    float closest = 0.;
    float x = 0;
    float y = 0;
    while(closest<2.*rad){
      x = random(widt-2.*rad)+rad;
      y = random(widt-2.*rad)+rad;
      closest = findClosest(x,y,xs,ys);
    }
    xs[i] = x;
    ys[i] = y;
    drawShape(nSides,x,y,rad,jit);
  }
}
    

void drawShape(int vertices,float x, float y, float rad,float jit){
  fill(128);
  noStroke();
  strokeWeight(2);
  beginShape();
  float initX = 0;
  float initY = 0;
  float dA = 2.*PI/vertices;
  for(int i=0;i<vertices;i++){
    float dx = cos(i*dA)*rad;
    float dy = sin(i*dA)*rad;
    float xPos = x+dx+random(jit)-jit/2.;
    float yPos = y+dy+random(jit)-jit/2.;
    if(i==0){
      initX = xPos;
      initY = yPos;
    }
    vertex(xPos,yPos);
  }
  vertex(initX,initY);
  endShape();
}

float findClosest(float x, float y, float[] xs, float[] ys){
  int nOthers = xs.length;
  float closest = 3000.;
  for(int i=0;i<nOthers;i++){
    float dist = sqrt(sq(x-xs[i])+sq(y-ys[i]));
    if(dist<closest){
      closest = dist;
    }
  }
  return closest;
}

void makeBars(float barW){
  int nBars = ceil(widt/(barW*2.));
  for(int i=0;i<nBars;i++){
    noStroke();
    fill(0);
    rect(barW*2.*i,0,barW,widt);
  }
}

void mask(){
  for(int i=0;i<200;i++){
    noStroke();
    fill(random(255));
    ellipse(random(widt),random(widt),random(rad)+rad,random(rad)+rad);
  }
}

void mousePressed(){
  boolean depthOrder = true;
  if(random(1)<.5){
    depthOrder = false;
  }
  background(255);
  if(depthOrder){
    makeBars(random(rad*1)+.5*rad);
  }
  makeShapes();
  if(!depthOrder){
    makeBars(random(rad*1)+.5*rad);
  }
  lastStim = millis();
  masked = false;
}


