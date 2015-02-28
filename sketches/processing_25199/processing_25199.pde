
//import processing.pdf.*;
//boolean recording;
//PGraphicsPDF pdf;



color skyColor = color(211,211,255);

int width = 900;
int height = 500;

//branch controls
int nTrees = 7; 
int nSegments;
float totalBranchLength;
float maxBranchThickness;
float minBranchThickness; 
float minSpawnDistance; 
float branchSpawnOdds;   
float branchSpawnOddsOfSecond; 
float mindThetaSplit;
float maxdThetaSplit;
float maxdThetaWander;
float dBranchSize; 



branch[] branches;

boolean pauseWind = false;
boolean drawWind = false;
boolean drawVeins = false;

//int width = 1680;
//int height = 1050;
float speed = 2;
float windDirection;
float windVelocity;
float velIncrement = 0.04;
float velOff = 0;
void updateWind(){
  velOff+= velIncrement;
  windDirection = (windDirection+random(-1,-1)*.001+TWO_PI)%TWO_PI;
  windVelocity = speed*noise(velOff)-1;
}

void setup(){
  size(width, height,P3D);
 
  smooth();
  noStroke();

  initializeTreeValues();
  
  windDirection = 0;
  windVelocity = 0;


  
  generateBranches();
  
  redrawTrees();
}


void draw(){
  if(!pauseWind){
    updateWind();
    
    //move in the wind!
    for(int i = 0; i<nTrees; i++)
      branches[i].rotateDueToWind();
     
    redrawTrees();
    
    //draw the wind line
    if(drawWind)
      drawWindLine();
  }
}

void redrawTrees(){
  background(skyColor);
  drawBranches();
  
}

void drawBranches(){
  stroke(5);
  for(int i = 0; i<nTrees; i++)
    branches[i].drawBranch(new float[]{(1+i)*(width/(1+nTrees)), height});
}



void drawWindLine(){
  stroke(0);
  int dx= 100;
  int dy = 100;
  line(dx,dy,dx+50*windVelocity*cos(windDirection),dy+50*windVelocity*sin(windDirection));
  noStroke();
  fill(0);
  ellipse(dx,dy,3,3);
}

void initializeTreeValues(){
  pauseWind = false;
  drawWind = false;
  drawVeins = false;
  
  //branch

  nSegments = 10;
  totalBranchLength = 400;
  maxBranchThickness = 10;
  minBranchThickness = 2; 
  minSpawnDistance = .2;
  branchSpawnOdds = .8; 
  branchSpawnOddsOfSecond = 0;
  mindThetaSplit = PI*.1;
  maxdThetaSplit = PI*.3;
  maxdThetaWander = PI/20;
  dBranchSize = .2;
  
}

