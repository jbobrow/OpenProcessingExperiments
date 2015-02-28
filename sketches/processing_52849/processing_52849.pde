
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/52849*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/**
 Disco-Grid
 by Daniel Buschek
 February, 2012
 
 WARNING: Contains flashing lights!
 Click, drag and release to power the grid.
*/

int numRows = 50;
int numCols = 50;
float[] grid = new float[numRows * numCols];
int[] cgrid = new int[numRows * numCols];
int cSwitch = 0;
float gw;
float gh;


void setup() {

  size(500, 500);
  frameRate(30);
  colorMode(HSB, 360);
  gw = width/(float)numCols;
  gh = height/(float)numRows;
  background(0);
}


void draw() {

  if (mousePressed)
    handleMouse();
    
  noStroke();
  fill(0, 120);
  rect(0, 0, width, height);

  for (int i = 0; i < grid.length; i++) {
    stroke((1+sin(frameCount*0.05 - grid[i]/360*HALF_PI))/2 * 360, grid[i], grid[i]*2 );
    fill((1+sin(frameCount*0.05 + grid[i]/360*HALF_PI))/2 * 360, grid[i], grid[i] );
    rect(i%numCols * gw + sin(frameCount*0.05+(grid[i]/360-cgrid[i]*2)*HALF_PI)*gw*2 - gw *grid[i]/360, 
    i/numCols * gh + sin(frameCount*0.025+(grid[i]/360-cgrid[i]*2)*HALF_PI)*gh*2 - gh *grid[i]/360, 
    gw * grid[i]/180, gh* grid[i]/180);
  }

  float[] newGrid = new float[grid.length];
  for (int i = 0; i < grid.length; i++) {
    grid[i] *= 0.85;
    if (grid[i] < 10) grid[i] = 0;
    newGrid[i] = grid[i];
  }

  for (int i = 0; i < grid.length; i++) { 
    float sum = 0; 
    if (i - numCols >= 0) 
      sum += grid[i - numCols];
    if (i + numCols < grid.length) 
      sum += grid[i + numCols];
    if (i%numCols - 1 >= 0) 
      sum += grid[i - 1];
    if (i%numCols + 1 < numCols && i+1 < grid.length) 
      sum += grid[i + 1];  
    if (cgrid[i] == cSwitch)
      newGrid[i] = (sum)%360;
    if (sum > 360) cgrid[i] = 1 - cSwitch;
  }
  grid = newGrid;
}

void handleMouse() {
  int row = int(mouseY/gh);
  int column = int(mouseX/gw); 
  grid[row*numCols + column] = 360;
}

void mouseReleased() {
  cSwitch = 1 - cSwitch;
}



