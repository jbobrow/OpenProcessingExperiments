


int mouseDown = 0;
int keyDown = 0;
int simulationRun = 0;
float frameSpeed = 8;

int gridW = 20;
int gridH =20;
int gridSize = gridW*gridH;
int screenW = 500;
int screenH = 500;
int cellW = screenW/gridW;
int cellH = screenH/gridH;

//defines the grid
int[] grid = new int[gridSize];

//defines the player
int[] playerBody = new int[2];
int playerPosNew = 0;

//grid objects
int empty = 0;
int wall = 1;
int apple = 2;
int head = 3;

void setup()
{
  size(screenW, screenH);
  noStroke();
  frameRate(frameSpeed);
  reset();
}
void reset()
{
  //creates an empty grid arrays
    for(int i = 0; i < gridSize-1; i++){
        grid[i] = empty;
      }
    
    //defines the start position of the player
    playerBody = new int[2];
    playerBody[0] = floor(gridSize/2 + gridH/2);
    playerBody[1] = playerBody[0]-1;
    grid[playerBody[0]] = head;
    grid[playerBody[1]] = wall;
    
    //creates an apple
    frameSpeed = 8;
    addApple();
    
    drawGrid();
 }
void draw()
{
  frameRate(10);

  
 
  if(keyPressed == true )
  {
    keyDown = 1;
    if(key == 'w' || key == 's' || key == 'a' || key == 'd'){ 
      if(key == 'w'){ playerPosNew = -1; }
      if(key == 's'){ playerPosNew = 1; }
      if(key == 'a'){ playerPosNew = -gridH; }
      if(key == 'd'){ playerPosNew = +gridH; }
      }
     if(key =='r'){reset();}
   }

  if(keyPressed == false && keyDown == 1)
  {
    
    keyDown = 0;
  }
  updatePlayer();
}

//adds a segment to the back of the snake upon eating
void addSegment()
{
 int bodySize = playerBody.length-1; 
 int lastSeg = playerBody[bodySize];
 int prevSeg = playerBody[bodySize-1];
 int newSeg = lastSeg + ( lastSeg-prevSeg); 
 if (newSeg < 0){ newSeg = lastSeg+1;}
 if (newSeg > gridSize-1){ newSeg = lastSeg-1;}
   playerBody = append(playerBody, newSeg);
}

//updates the position of the segments of the player body.
void updatePlayer()
{
  int playerHit = playerBody[0] + playerPosNew;
  if(playerHit > gridSize-1) { playerHit = playerHit%gridH;}
  if(playerHit < 0){playerHit = playerBody[0] + (gridW-1)*gridH;}
   //check collisions with walls
  if(grid[playerHit] != wall)
  {
    //checks to see if player ate an apple
    if(grid[playerHit] == apple)
    {
      addSegment();
      addApple();
    }
    
    //moves the body segments
    grid[playerBody[playerBody.length-1]] = 0;
    for(int i = playerBody.length-1; i >0; i--)
    {
      //copies positions down the chain of the snake
      playerBody[i] = playerBody[i-1];
      //writes those positions to the grid
      grid[playerBody[i]] = wall;
    }
   
    
    playerBody[0] = playerHit;
    grid[playerBody[0]] = 3;
    drawGrid();
  }
}

void addApple()
{
 int newApple = round(random(gridSize-1));
  if(grid[newApple] == 0)
  {
    grid[newApple] = 2;
    frameSpeed = frameSpeed + 0.2;
    
  }
  else
  {
    addApple();
  }
}


void drawGrid()
{
  //for use in the draw function
  int curX = 0;
  int curY = 0;
  int gridCell = 0;
  int curCell = 0;
  for(int i = 0; i <grid.length; i++)
  {
    gridCell = i;
    
    curY = cellH*((gridCell%gridH));
    curX = cellW*(floor(gridCell/gridW));
    
    //cell Fill
    if(grid[i] == empty){fill(0,100+random(5),0);}
    if(grid[i] == wall){fill(0,0,50+random(20));}
    if(grid[i] == apple){fill(150+random(100),0,0);}
    if(grid[i] == head){fill(random(255),random(255),random(255));}
    
    //draw cell
    rect(curX,curY,cellW,cellH);
    
    //debug text
    //fill(0);
    //text(i,curX+10,curY+10);
   }
  
}

