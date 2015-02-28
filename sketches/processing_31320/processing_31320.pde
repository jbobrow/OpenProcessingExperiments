
/**
 * Animator.
 * 
 * Click and drag to draw and start the program.
 * 
 * A simple animation tool that displays a continuous cycle of
 * twenty-four images. Each image is displayed for 30 milliseconds 
 * to create animation. While each image is displayed, it’s possible 
 * to draw directly into it by pressing the mouse and moving the cursor. 
 * 
 */
boolean mouseDown=false;

int xDim = 50;
int yDim = 50;
int blockDim = 600/xDim;
int xPos;
int yPos;

int xInc = 1;
int yInc = 0;

int[][] grid = new int[xDim][yDim];

void setup() 
{
  size(600, 600);

  noStroke();
  smooth();
  initGrid();
}
void keyPressed() {
  initGrid();
}

void initGrid()
{
  // start state moving to the east
  xInc = 1;
  yInc = 0;

  //init all to solid can vary this to make random grids
  for(int x=0; x<xDim;x++) {
    for(int y=0; y<yDim;y++) {
      if(random(100)>90) {
        grid[x][y] = 1;
      }
      else {
        grid[x][y] = 0;
      }
    }
  }


  /* //boundaries needed for random allocation of passsable and inpassable blocks*/
  for(int i=0;i<xDim;i++) {
    grid[i][0] = 1;
    grid[i][yDim-1] = 1;
    grid[0][i] = 1;
    grid[xDim-1][i] = 1;
  }



  //start position
  xPos = xDim/2;
  yPos = yDim/2;
  grid[xDim/2][yDim/2] = 0;

  for(int x=0; x<xDim;x++) {
    for(int y=0; y<yDim;y++) {
      if(grid[x][y] == 1) {

        fill(random(10)*25);
      }
      else if(grid[x][y] == 2) {
        fill(100,20,20);
      }
      else {
        fill(10,10,10);
      }
      rect(x*blockDim,y*blockDim,blockDim,blockDim);
    }
  }
}

void mousePressed() {
  mouseDown = true;
}
void mouseReleased() {
  mouseDown = false;
}

void draw() 
{
  if(mouseDown) {
    int x = mouseX / blockDim, y = mouseY / blockDim;
    if (mouseButton == RIGHT) {
      //change grid to non passable block
      grid[x][y] =1;
    }
    if (mouseButton == LEFT) {
      //change grid to passable block
      grid[x][y] =0;
    }
  }
  
  /* to get decent rate need to coment out redraw 
  for(int x=0; x<xDim;x++) {
   for(int y=0; y<yDim;y++) {
   if(grid[x][y] == 1) {
  fill(random(10)*25);
   }
   else if(grid[x][y] == 2) {
   fill(100,20,20);
   }
   else {
   fill(10,10,10);
   }
   rect(x*blockDim,y*blockDim,blockDim,blockDim);
   }
   }
   
   
   */
  fill(random(10)*25,random(10)*25,random(10)*25);
  rect(xPos*blockDim,yPos*blockDim,blockDim,blockDim);

  if(grid[xPos+xInc][yPos+yInc] == 0 || grid[xPos+xInc][yPos+yInc] == 2) {
    grid[xPos][yPos] =2;
    xPos = xPos += xInc;
    yPos = yPos += yInc;
  }
  else {
    //turn right
    if( random(1000) > 500) {
      turnRight();
    }
    else {
      turnLeft();
    }
  }
}


void turnRight() {
  if(xInc == 1) {
    xInc=0;
    yInc=1;
  }
  else if(yInc == 1) {
    yInc=0;
    xInc = -1;
  }
  else if(xInc == (-1)) {
    xInc = 0;
    yInc = -1;
  }
  else if(yInc == (-1) ) {
    yInc=0;
    xInc = 1;
  }
}

void turnLeft() {
  if(xInc == 1) {
    xInc=0;
    yInc=-1;
  }
  else if(yInc == (-1) ) {
    yInc=0;
    xInc = -1;
  }    
  else if(xInc == (-1)) {
    xInc = 0;
    yInc = 1;
  }    
  else if(yInc == 1) {
    yInc=0;
    xInc = 1;
  }
}


