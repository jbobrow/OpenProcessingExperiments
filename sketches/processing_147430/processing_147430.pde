
//Copyright Christopher Henley 2014
//ICE 22

final int MAX=7;

float xVals[]=new float[MAX];
float yVals[]=new float[MAX];

color figureColor[]=new color[MAX];

float figureSize;

void setup(){
  size(600,600);
  rectMode(CENTER);
  
  for (int i=0; i<MAX; i++){
    xVals[i]=random(width);
    yVals[i]=random(height);
    figureColor[i]=color(random(255),random(255),random(255));
  }
}

void draw(){
  drawFigures();
}

void drawFigures(){
  for (int i=0; i<MAX; i++){
    noFill();
    stroke(figureColor[i]);
    rect(xVals[i],yVals[i],figureSize,figureSize);
  }
  figureSize++;
}

void mouseClicked(){
  background(200,200,200);
  figureSize=1;
}
  
  
  


