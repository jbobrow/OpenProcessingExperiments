
/*
Port of 1-D Turing Reaction-Diffusion simulator written by Dr. Greg Turk's 
for his 1991 SIGGRAPH paper:
"Generating Textures on Arbitrary Surfaces Using Reaction-Diffusion"

Ported to Processing 2.0 by Tony Kaap, 2014

*/

float[] inhibitorGrid;
float[] activatorGrid;
float[] deltaInhibitorGrid;
float[] deltaActivatorGrid;
float[] betaGrid;
float[] diffGrid;
float[] oldGrid;
float diffGridSum;
float rsp;
int intervalStart=0;
int stepEnd=0;

int counter = 0;
int halfWhite = 127;
int c_black = 0;
int c_white = 256;
int c_23white = 170;

int gridSize = 60;//320;//60

float ainit = 4.0; // inhibitor
float binit = 4.0; // activator

float Da1 = 0.25;// inhibitor diffusion rate (can also be large radius)
float Db2 = 0.0625; // activator diffusion rate (can also be small radius0

float betaInit = 12;
float betaVariation = 0.05;
float speed = 0.1;//;0.05; //1.0

float convergenceThreshold = 0.0001;

int screenSizeX = 1000;
int screenSizeY = 300;
int interval = 100; //frequency of display

void setup() {

  println("inside setup");
  colorMode(HSB, 256, 256, 256, 1);
  size(screenSizeX, screenSizeY);
  
  //Let the simulator run as fast as it can, not at the 60fps default
  frameRate(10000);
  
  initGrids();
  // initialize the sum above the convergence threshold
  diffGridSum = convergenceThreshold+1; 
  rsp = speed/16.0; //  

  fillGrids(gridSize);
}

void draw() {
  updateGrid();

  if ((counter % interval) == 0) {
    
    //println("draw", counter);
    render();
    int intervalTime = stepEnd-intervalStart;
    int seconds = int(intervalTime)/1000;
    int mseconds = intervalTime - seconds*1000;
    int minutes = seconds / 60;
    seconds -=minutes*60;
    int hours = minutes / 60;
    minutes -= hours*60;  
    
    //println("diffGridSum " + diffGridSum);
    //println("interval time: "+hours+"h "+minutes+"m "+seconds+"s "+mseconds+"ms");
    intervalStart = millis();
  }
  counter++;
  
  
  if(diffGridSum < convergenceThreshold)
  {
    println("diffGridSum " + diffGridSum);
    println("converged at step: "+counter);
    render();
    noLoop();
  }  
  stepEnd = millis();
}

void initGrids()
{
  println("inside initGrid\n");
  activatorGrid = new float[gridSize]; 
  inhibitorGrid = new float[gridSize]; 
  betaGrid = new float[gridSize]; 
  deltaActivatorGrid = new float[gridSize]; 
  deltaInhibitorGrid =new float[gridSize];
  diffGrid = new float[gridSize];
  oldGrid = new float[gridSize];
}

void fillGrids(int size)
{
  println("inside randomFillGrid");
  for (int i=0;i<gridSize;i++) {
    betaGrid[i] = betaInit + random(-betaVariation, betaVariation);
    inhibitorGrid[i] = ainit; // not random
    activatorGrid[i] = binit; // not random
  }
}

void updateGrid()
{
  int i0,i1,k;
  float adiff=0,bdiff=0;
  
  for (int i=0;i<gridSize;i++) {
    // wrap around
    i0 = (i+gridSize-1)%gridSize; // because modulo doesn't wrap at -1
    i1 = (i+1)%gridSize;
    
    // diffuse values for a and b (1-d Laplacian)
    adiff = inhibitorGrid[i0] + inhibitorGrid[i1] - 2*inhibitorGrid[i];
    bdiff = activatorGrid[i0] + activatorGrid[i1] - 2*activatorGrid[i];
    
    
    
    // save the reaction and diffusion values
    deltaInhibitorGrid[i] = rsp*(16-inhibitorGrid[i] * activatorGrid[i]) + adiff*Da1;
    deltaActivatorGrid[i] = rsp*(inhibitorGrid[i] * activatorGrid[i] - activatorGrid[i] - betaGrid[i]) + bdiff*Db2;
  }
  
  //println(counter,"adiff "+adiff);
  
  // add the changes
  for (int i=0;i<gridSize;i++) {
    inhibitorGrid[i] = inhibitorGrid[i] + deltaInhibitorGrid[i];
    activatorGrid[i] = activatorGrid[i] + deltaActivatorGrid[i];
   
    if (activatorGrid[i] < 0){ // clamp a's concentration to zero at minimum
      activatorGrid[i] = 0;
    }
    diffGrid[i] = abs(activatorGrid[i] - oldGrid[i]);
    oldGrid[i] = activatorGrid[i];
  }
  diffGridSum = sum(diffGrid);
}

float sum(float[] source)
{
  float total = 0.0;
  for (int i=0;i<gridSize;i++)
    total += source[i];
  return total;
}

void render() {
  float xFraction = 1.0/(gridSize-1) * screenSizeX;
  
  float maxExpectedValue = 14;
  float minExpectedValue = -2;
  //float yFraction = 1.0/(maxExpectedValue-minExpectedValue)*screenSizeY;

  float xValueOld = 0;
  float yValueOld = 0;
  float xValueOldB = 0;
  float yValueOldB = 0;
  float xValueOldI = 0;
  float yValueOldI = 0;
  
  float s1;
  float xValueIB, yValueIB;
  float xValueII, yValueII;
  float xValueI, yValueI;


  // flush bg to black
  fill(c_black);
  rect(0, 0, screenSizeX, screenSizeY);
  
  strokeWeight(2);
  
  // render betaGrid
  stroke(halfWhite);
  for (int i=0;i<gridSize;i++) {
    xValueIB = xFraction*i;
    s1 = (betaGrid[i] - minExpectedValue) / (maxExpectedValue - minExpectedValue);
    yValueIB = (1-s1) * screenSizeY;
    
    line(xValueOldB,yValueOldB,xValueIB,yValueIB);

    xValueOldB = xValueIB;
    yValueOldB = yValueIB;
  }

  // render inhibitor
  stroke(c_23white);
  for (int i=0;i<gridSize;i++) {
    xValueII = xFraction*i;
    s1 = (inhibitorGrid[i] - minExpectedValue) / (maxExpectedValue - minExpectedValue);
    yValueII = (1-s1) * screenSizeY;//yFraction*inhibitorGrid[i];//test - i*maxExpectedValue/float(gridSize);
    
    line(xValueOldI,yValueOldI,xValueII,yValueII);

    xValueOldI = xValueII;
    yValueOldI = yValueII;
  }

  // render activator
  stroke(c_white);
  for (int i=0;i<gridSize;i++) {
    xValueI = xFraction*i;
    s1 = (activatorGrid[i] - minExpectedValue) / (maxExpectedValue - minExpectedValue);
    yValueI = (1-s1) * screenSizeY;
    
    line(xValueOld,yValueOld,xValueI,yValueI);

    // debug
    //println(i, activatorGrid[i-1], activatorGrid[1],s10,s1, xValueI0, yValueI0, xValueI, yValueI, activatorGrid[i], counter );
    //println(i, "ai:",inhibitorGrid[i], "bi:",activatorGrid[i],  "beta",betaGrid[i], "c:",counter);

    xValueOld = xValueI;
    yValueOld = yValueI;
  }  
}
