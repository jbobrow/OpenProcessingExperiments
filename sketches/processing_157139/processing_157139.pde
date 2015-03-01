
/*
Port of 2-D Turing Reaction-Diffusion simulator written by Dr. Greg Turk's 
 for his 1991 SIGGRAPH paper:
 "Generating Textures on Arbitrary Surfaces Using Reaction-Diffusion"
 
 Ported to Processing 2.0 by Tony Kaap, 2014
 2-D version of the simple 1-D simulator
 
 */

float[][] inhibitorGrid;
float[][] activatorGrid;
float[][] deltaInhibitorGrid;
float[][] deltaActivatorGrid;
float[][] betaGrid;
float[][] diffGrid;
float[][] oldGrid;
float[][] variationGrid;
float diffGridSum;
float rsp;
int intervalStart=0;
int stepEnd=0;
boolean wantColorOnly;
boolean wantColorAndVariationOnly;
boolean wantNormalizedColor;

float activatorMax, activatorMin;
float inhibitorMax, inhibitorMin;

// The min and max clamp values used when drawing the activatorGrid when
// non-normalized.
float renderActivatorMax = 8;//18; //10;
float renderActivatorMin = 6;//-2; //0.0;

int counter = 0;
int halfWhite = 127;
int c_black = 0;
int c_white = 256;
int c_23white = 170;

int gridSize = 256; //1024; //256;//320;//60

float ainit = 4.0; // inhibitor
float binit = 4.0; // activator

float betaInit = 12;
float betaVariation = 0.01;//0.01;//0.1;//0.05;

boolean wantMouseInteration = false; // for disabling accidental mouse presses

//float Da1 = 0.5;// inhibitor diffusion rate (can also be large radius)
//float Db2 = 0.125; // activator diffusion rate (can also be small radius0
//float Da1 = .25;
//float Db2 = Da1 / 16;


/*
//spots
 float Da1 = 0.1;//0.05; //0.0025;// inhibitor diffusion rate (can also be large radius)
 float Db2 = 0.02;//0.0125; //0.00625; // activator diffusion rate (can also be small radius0
 float speed = 1.25;//2.4;//.15; //1.0 //affects line width   
 */

///*
//stripes
float Da1 = 0.2;//0.05; //0.0025;// inhibitor diffusion rate (can also be large radius)
float Db2 = 0.01;//0.0125; //0.00625; // activator diffusion rate (can also be small radius0
float speed = 1;//2.4;//.15; //1.0 //affects line width   
//*/

/*
  (runs at Da1:0.025, Db2:0.00625, rsp:0.15/16.0
 (runs at Da1:0.1, Db2:0.02, rsp:1/256
 stripes at Da1:0.2 Db2:0.01 rsp:1/256
 */

float prevRenderMin=-2, prevRenderMax=10;

float convergenceThreshold = speed*0.001;
int FRAMERATE = 10000;

//int screenSizeX = 1000;
//int screenSizeY = 300;
int interval = 100; //frequency of display

void setup() {

  println("inside setup");
  colorMode(HSB, 256, 256, 256, 1);

  wantColorOnly=true;
  wantColorAndVariationOnly=true;
  wantNormalizedColor=false;

  if (wantColorOnly)
    size(gridSize, gridSize);
  else if (wantColorAndVariationOnly)
    size(gridSize, gridSize*2);
  else
    size(gridSize*2, gridSize*3);

  noStroke();
  //Let the simulator run as fast as it can, not at the 60fps default
  frameRate(FRAMERATE);

  initGrids();
  // initialize the sum above the convergence threshold
  diffGridSum = convergenceThreshold+1; 
  rsp = speed/256.0; //  

  fillGrids(gridSize);

  //noLoop();
}

void draw() {
  updateGrid();

  //  if (true){
  //      updateGrid();
  //      updateGrid();
  //      noLoop();
  //      render();
  //  }

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

    println("\ndiffGridSum " + diffGridSum);
    println("step:"+counter, "interval time: "+hours+"h "+minutes+"m "+seconds+"s "+mseconds+"ms");
    intervalStart = millis();
  }
  counter++;


  if (diffGridSum < convergenceThreshold)
  {
    println("diffGridSum " + diffGridSum);
    println("converged at step: "+counter);
    noLoop();
    render();
    saveFrame("GT_T2d_#####.png");
  }  
  stepEnd = millis();
}

void mouseClicked() 
{
  if (wantMouseInteration)
  {
    loop();
    println("\n mouse pressed X:"+mouseX+", Y:"+mouseY+"\n");
    if (mouseButton == LEFT)
    {
      // Push some activator at the mouse click point
      println("adding activator\n"); 

      int i, j;
      int i0, j0;
      int i1, j1;
      float actiatorAmount = binit*3;
      float inhibitorAmount = 0;

      int radius = 5;
      for (i=0; i<radius; i++) {
        i0 = (mouseX-i+gridSize)%gridSize;
        i1 = (mouseX+i)%gridSize;

        for (j=0; j<radius; j++)
        {
          j0 = (mouseY-j+gridSize)%gridSize;
          j1 = (mouseY+j)%gridSize;

          activatorGrid[i0][j0] = actiatorAmount;
          inhibitorGrid[i0][j0] = inhibitorAmount;  

          activatorGrid[i0][j1] = actiatorAmount;
          inhibitorGrid[i0][j1] = inhibitorAmount;  

          activatorGrid[i1][j0] = actiatorAmount;
          inhibitorGrid[i1][j0] = inhibitorAmount; 

          activatorGrid[i1][j1] = actiatorAmount;
          inhibitorGrid[i1][j1] = inhibitorAmount;
        }
      }
    }
    else if (mouseButton == RIGHT) {
      pumpSim();
    }
    else {
      //middle click
      dumpSim();
    }
  }
}

void initGrids()
{
  println("inside initGrid\n");
  activatorGrid = new float[gridSize][gridSize]; 
  inhibitorGrid = new float[gridSize][gridSize]; 
  betaGrid = new float[gridSize][gridSize]; 
  deltaActivatorGrid = new float[gridSize][gridSize]; 
  deltaInhibitorGrid =new float[gridSize][gridSize];
  diffGrid = new float[gridSize][gridSize];
  oldGrid = new float[gridSize][gridSize];
  variationGrid = new float[gridSize][gridSize];
  render();
}

void fillGrids(int size)
{
  println("inside randomFillGrid");
  for (int i=0;i<gridSize;i++) {
    for (int j=0;j<gridSize;j++) {
      betaGrid[i][j] = betaInit + random(-betaVariation, betaVariation);
      //print(betaGrid[i][j]);
      inhibitorGrid[i][j] = ainit; // not random
      activatorGrid[i][j] = binit; // not random
      oldGrid[i][j] = 0; // not random
      //println(activatorGrid[0][0], betaGrid[0][0]);
    }
  }
}

void updateGrid()
{
  int i0, i1, j0, j1, k;
  float adiff=0, bdiff=0;

  for (int i=0;i<gridSize;i++) {
    // wrap around
    i0 = (i+gridSize-1)%gridSize; // because modulo doesn't wrap at -1
    i1 = (i+1)%gridSize;

    for (int j=0;j<gridSize;j++) {
      // wrap around
      j0 = (j+gridSize-1)%gridSize; // because modulo doesn't wrap at -1
      j1 = (j+1)%gridSize;

      // diffuse values for a and b (1-d Laplacian)
      adiff = inhibitorGrid[i0][j] + inhibitorGrid[i1][j] + inhibitorGrid[i][j0] + inhibitorGrid[i][j1] - 4*inhibitorGrid[i][j];
      bdiff = activatorGrid[i0][j] + activatorGrid[i1][j] + activatorGrid[i][j0] + activatorGrid[i][j1] - 4*activatorGrid[i][j];

      // save the reaction and diffusion values
      deltaInhibitorGrid[i][j] = rsp*(16-inhibitorGrid[i][j] * activatorGrid[i][j]) + adiff*Da1;
      deltaActivatorGrid[i][j] = rsp*(inhibitorGrid[i][j] * activatorGrid[i][j] - activatorGrid[i][j] - betaGrid[i][j]) + bdiff*Db2;
    }
  }
  //println("bGrid00: "+activatorGrid[0][0]+ "  adiff:" + adiff + "  aDelta00: " + deltaInhibitorGrid[0][0]);

  // add the changes
  for (int i=0;i<gridSize;i++) {
    for (int j=0;j<gridSize;j++) {

      //inhibitorGrid[i][j] = min(100,max(0,inhibitorGrid[i][j] + deltaInhibitorGrid[i][j]));
      //activatorGrid[i][j] = min(100,max(0,activatorGrid[i][j] + deltaActivatorGrid[i][j]));
      inhibitorGrid[i][j] = min(100, max(0, inhibitorGrid[i][j] + deltaInhibitorGrid[i][j]));
      activatorGrid[i][j] = min(100, max(0, activatorGrid[i][j] + deltaActivatorGrid[i][j]));

      if (activatorGrid[i][j] < 0) { // clamp a's concentration to zero at minimum
        activatorGrid[i][j] = 0;
      }

      //println(activatorGrid[i][j], inhibitorGrid[i][j]);

      diffGrid[i][j] = abs(activatorGrid[i][j] - oldGrid[i][j]);
      oldGrid[i][j] = activatorGrid[i][j];
    }
  }
  //println("bGrid00: "+activatorGrid[0][0]);

  diffGridSum = sum(diffGrid);
}

float sum(float[][] source)
{
  float total = 0.0;
  for (int i=0;i<gridSize;i++) {
    for (int j=0;j<gridSize;j++) {
      total += source[i][j];
    }
  }
  //println("sum: "+total);
  return total;
}

// only draw the normalized color and variation
void renderActivatorAndVariationOnly() {
  renderActivator(wantNormalizedColor); 
  translate(0, gridSize);
  renderVariation();
}

void renderActivator(boolean normalized)
{
  // normalized activatorGrid
  float aMin = 1000;
  float aMax = -1000;
  //normalize diffGrid
  for (int i=0;i<gridSize;i++) {
    float M = max(activatorGrid[i]);
    if (M > aMax) {
      aMax = M;
    }
    float m = min(activatorGrid[i]);
    if (m < aMin) {
      aMin = m;
    }
  }
  activatorMax = aMax;
  activatorMin = aMin;
  println("using amax: "+aMax, "  amin: "+aMin);


  if (!normalized)
  {
    //println("bGrid00: "+activatorGrid[0][0]);
    float min = renderActivatorMin;
    float max = renderActivatorMax;

    //float min = prevRenderMin;//-2;
    //float max = prevRenderMax; //10;
    //prevRenderMax = -10;
    //prevRenderMin = 10;
    //println("using max:"+max, "min"+min);

    float ratio = 1.0/(max-min) * c_white;

    //println("inside render");
    // Draw grid to image
    for (int i=0;i<gridSize;i++) {
      for (int j=0;j<gridSize;j++) {

        float clr = ratio*(activatorGrid[i][j]-min);
        //println(i+","+j+" val:" + activatorGrid[i][j]+" color: "+clr+" iVal:"+ inhibitorGrid[i][j]);

        fill(clr);
        rect(i, j, 1, 1);
      }
      //    float M =max(activatorGrid[i]); 
      //    if (M > prevRenderMax){
      //      prevRenderMax = M;
      //    }
      //    float m =max(activatorGrid[i]); 
      //    if (m < prevRenderMin){
      //      prevRenderMin = m;
      //    }
    }
  }
  else {


    float ratio = 1/(aMax-aMin);
    //println("using amax:"+aMax, "amin"+aMin);

    // draw diffGrid
    for (int i=0;i<gridSize;i++) {
      for (int j=0;j<gridSize;j++) {
        //fill(halfWhite+halfWhite*grid[i][j]);
        //fill(2*halfWhite*inhibitorGrid[i][j]);
        fill(c_white*ratio*(activatorGrid[i][j]-aMin));
        //fill(128);
        rect(i, j, 1, 1);
      }
    }
  }
}

void renderVariation()
{

  loadVariationGrid();

  // normalize variationGrid
  float aMin2 = 1000;
  float aMax2 = -1000;
  //normalize diffGrid
  for (int i=0;i<gridSize;i++) {
    float M = max(variationGrid[i]);
    if (M > aMax2) {
      aMax2 = M;
    }
    float m = min(variationGrid[i]);
    if (m < aMin2) {
      aMin2 = m;
    }
  }
  float ratio = 1/(aMax2-aMin2);
  //println("using amax2:"+aMax2, "amin2"+aMin2);

  // draw diffGrid
  for (int i=0;i<gridSize;i++) {
    for (int j=0;j<gridSize;j++) {
      fill(c_white*ratio*(variationGrid[i][j]-aMin2));
      //fill(256);
      rect(i, j, 1, 1);
    }
  }
}

void findInhibitorMinMax()
{
  // find min/max for inhibitor
  float aMin = 1000;
  float aMax = -1000;
  //normalize diffGrid
  for (int i=0;i<gridSize;i++) {
    float M = max(inhibitorGrid[i]);
    if (M > aMax) {
      aMax = M;
    }
    float m = min(inhibitorGrid[i]);
    if (m < aMin) {
      aMin = m;
    }
  }
  inhibitorMax = aMax;
  inhibitorMin = aMin;
  println("using imax: "+aMax, "  imin: "+aMin);
}

void renderInhibitor()
{


  //println("bGrid00: "+activatorGrid[0][0]);
  float min = renderActivatorMin;
  float max = renderActivatorMax;

  //float min = prevRenderMin;//-2;
  //float max = prevRenderMax; //10;
  //prevRenderMax = -10;
  //prevRenderMin = 10;
  //println("using max:"+max, "min"+min);

  float ratio = 1.0/(max-min) * c_white;

  //println("inside render");
  // Draw grid to image
  for (int i=0;i<gridSize;i++) {
    for (int j=0;j<gridSize;j++) {

      float clr = ratio*(inhibitorGrid[i][j]-min);
      //println(i+","+j+" val:" + activatorGrid[i][j]+" color: "+clr+" iVal:"+ inhibitorGrid[i][j]);

      fill(clr);
      rect(i, j, 1, 1);
    }
    //    float M =max(activatorGrid[i]); 
    //    if (M > prevRenderMax){
    //      prevRenderMax = M;
    //    }
    //    float m =max(activatorGrid[i]); 
    //    if (m < prevRenderMin){
    //      prevRenderMin = m;
    //    }
  }
}

// draw the regular color, inhibitor, normalized color, diffGrid, and variation grid
void render() {
  if (wantColorAndVariationOnly)
    renderActivatorAndVariationOnly();
  else
    renderAll();
  findInhibitorMinMax();
}


void renderAll() {
  renderActivator(false);

  if (wantColorOnly) return;
  // draw inhibitor
  translate(0, gridSize);
  renderInhibitor();

  translate(gridSize, -gridSize);


  float diffMin = 1000;
  float diffMax = -1000;

  //normalize diffGrid
  for (int i=0;i<gridSize;i++) {
    float M = max(diffGrid[i]);
    if (M > diffMax) {
      diffMax = M;
    }
    float m = min(diffGrid[i]);
    if (m < diffMin) {
      diffMin = m;
    }
  }
  float ratio = 1/(diffMax-diffMin);
  println("using max:"+diffMax, "min"+diffMin);

  // draw diffGrid
  for (int i=0;i<gridSize;i++) {
    for (int j=0;j<gridSize;j++) {
      //fill(halfWhite+halfWhite*grid[i][j]);
      //fill(2*halfWhite*inhibitorGrid[i][j]);
      fill(halfWhite + halfWhite*ratio*(diffGrid[i][j])-diffMin);
      //fill(128);
      rect(i, j, 1, 1);
    }
  }  
  //println(diffGrid[0][0]);

  translate(0, gridSize);

  renderActivator(true);

  translate(-gridSize, gridSize);

  loadVariationGrid();

  // normalize variationGrid
  float aMin2 = 1000;
  float aMax2 = -1000;
  //normalize diffGrid
  for (int i=0;i<gridSize;i++) {
    float M = max(variationGrid[i]);
    if (M > aMax2) {
      aMax2 = M;
    }
    float m = min(variationGrid[i]);
    if (m < aMin2) {
      aMin2 = m;
    }
  }
  ratio = 1/(aMax2-aMin2);
  println("using amax2:"+aMax2, "amin2"+aMin2);

  // draw diffGrid
  for (int i=0;i<gridSize;i++) {
    for (int j=0;j<gridSize;j++) {
      fill(c_white*ratio*(variationGrid[i][j]-aMin2));
      //fill(256);
      rect(i, j, 1, 1);
    }
  }
}

void keyPressed() {
  saveFrame("GT_T2d_#####.png");
}



// This simulator doesn't directly use the variationGrid in computation
// But it is a useful output for bump mapping, so we can sythetically create one
// before output
//
void loadVariationGrid()
{
  int i, j;
  int i0, j0;
  int i1, j1;

  //int variationRadius = 1;

  for (i=0; i<gridSize; i++)
  {
    i0 = (i-1+gridSize)%gridSize;
    i1 = (i+1)%gridSize;

    for (j=0; j<gridSize; j++)
    {
      j0 = (j-1+gridSize)%gridSize;
      j1 = (j+1)%gridSize;
      variationGrid[i][j] = activatorGrid[i][j] - 
        0.25*(
      activatorGrid[i0][j0] +
        activatorGrid[i0][j1] + 
        activatorGrid[i1][j0] + 
        activatorGrid[i1][j1]);
    }
  }
}


// experiment to push the simulation values out of the no-man's land to the extreme values
void pumpSim()
{
  // uses the globals:
  // float activatorMax,activatorMin;
  //float inhibitorMax, inhibitorMin;
  int i, j;

  for (i=0; i<gridSize; i++)
  {
    for (j=0; j<gridSize; j++)
    {
      if (activatorGrid[i][j] > binit)
      {
        activatorGrid[i][j] = activatorMax;
        inhibitorGrid[i][j] = inhibitorMin;
      }
      else {
        activatorGrid[i][j] = activatorMin;
        inhibitorGrid[i][j] = inhibitorMax;
      }
    }
  }
}

void dumpSim()
{
  println("\ndump sim\n");
  // uses the globals:
  // float activatorMax,activatorMin;
  //float inhibitorMax, inhibitorMin;
  int i, j;

  for (i=0; i<gridSize; i++)
  {
    for (j=0; j<gridSize; j++)
    {
      activatorGrid[i][j] = 0;
      inhibitorGrid[i][j] = inhibitorMax;
    }
  }
}

