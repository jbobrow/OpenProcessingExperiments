

int numTrees = 10; 
int[][] treePos = new int[numTrees][2];   
int forestSize = 100;
float[] rndTreeValues = new float[1000000];
int rndBranch = 0;
float windX = 0;
float[] windY = new float[numTrees];
float xoff = 0.0;
float treeSize = 20;
int treeDepth = 10;
float growth = 0.01;
float maxGrowth = 0.75;
color treeCol;

float windStrength = PI/25;

int i=0;

void setup(){

  size(900,900,P3D);

  //--------------------------------------------------------------------


  //-------------------------------------------------------------------- Stores Tree Positions
  for(int i=0; i<numTrees; i++)
  {
    treePos[i][0] = int(random(0,forestSize));
    treePos[i][1] = int(random(0,forestSize));
  }

  for(int i=0; i<rndTreeValues.length; i++)
  {
    rndTreeValues[i] = random(-0.5,0.5);
  }

}

void draw(){

  mouseBehaviourReset();//--------------- After this, Image stays steady

  //views();

  mouseBehaviour(); //--------------- After this, you can rotate and pan


  xoff = xoff + .025;

  for(int i=0; i<numTrees; i++) //----------- Calls the function from every random point
  {  
    noiseSeed(i);
    windY[i] = noise(treePos[i][0],treePos[i][1],xoff);
    pushMatrix();
    translate(treePos[i][0],treePos[i][1]);
    treeCol = int(200+80*rndTreeValues[i]);
    strokeWeight(0);
    branch(0,treeSize);
    popMatrix();
  }

  strokeWeight(1);
  rndBranch = 0;

  stroke(100);
  for(int i = 0; i<forestSize+1; i=i+10)
  {
    pushMatrix();
    translate(i,0);
    line(0,0,0,forestSize);
    translate(-i,i);
    line(0,0,forestSize,0);
    popMatrix();
  }

  if (growth < maxGrowth) growth = growth + 0.05 - 0.05*growth/maxGrowth;

}









