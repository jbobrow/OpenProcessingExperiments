



int mouseDown = 0;
int keyDown = 0;
int simulationRun = 0;

//defines the size of the array
int gridW = 20;
int gridH =20;
int[][] grid = new int[gridW][gridH];
int[][] gridNew = new int[gridW][gridH];

//weird ints I am using to handle the out of bounds array values
int negI = 0;
int posI = 0;
int negJ = 0;
int posJ = 0;

int screenW = 500;
int screenH = 500;
int cellW = screenW/gridW;
int cellH = screenH/gridH;
void setup()
{
  size(screenW, screenH);
  stroke(150);
  for(int i = 0; i < gridW-1; i++){
    for(int j = 0; j < gridH-1; j++){
      grid[i][j] = 0;
      gridNew[i][j] = 0;
    }
  }
  
  drawGrid();
}
void draw()
{
  frameRate(15);
  if(mousePressed == true && mouseDown == 0){
    //protects from gettting mutltiple clicks
    mouseDown = 1;
    //finds the cell the player clicked in
    int cellX = floor((mouseX-1)/cellW);
    int cellY = floor((mouseY-1)/cellH);
    //change the data in the cell
     if(grid[cellX][cellY] == 0){grid[cellX][cellY] = 1;}else{grid[cellX][cellY] = 0;}

    //redraws the grid. Not sure if this is the most efficent way
    drawGrid();
  }
  if(mousePressed == false)
  {
    mouseDown = 0;
  }
  if(keyPressed == true && keyDown == 0){
    keyDown = 1;
    if(key == 'g'){ simulationRun = 1;}
    if(key == 's'){ simulationRun = 0;}
    if(key == 'r'){ resetGrid();}
  }
  if(keyPressed == false){keyDown = 0;}
  
  if(simulationRun == 1){
    runSim();
  }
}

void runSim()
{
  //look at each cell of the array, write the information to a new array. Then replace the original Array
  for(int i = 0; i <grid.length; i++)
  {
    if(i - 1 < 0){ negI = grid.length-1; }else{ negI = i -1; }
    
    if(i + 1 > grid.length-1 ){posI = 0;} else{ posI = i + 1; }
    
    for(int j = 0; j<grid[i].length; j++)
    {
    
      if(j - 1 < 0){ negJ = grid[i].length-1; }else{ negJ = j -1; }
      if(j + 1 > grid[i].length-1 ){posJ = 0;} else{ posJ = j + 1; }
      
      //count the neighbors
      int neighbors = 
        grid[negI][negJ] +
        grid[negI][j] +
        grid[negI][posJ]+
        
        grid[i][negJ] +
        grid[i][posJ] +
        
        grid[posI][negJ] +
        grid[posI][j] +
        grid[posI][posJ];
       
        
        if(grid[i][j] == 1)
        {
          if(neighbors > 3){ gridNew[i][j] = 0;}
          if(neighbors < 2){ gridNew[i][j] = 0;}
          if(neighbors == 2 || neighbors == 3){gridNew[i][j] = 1;}
        }
        if(grid[i][j] == 0)
        {
          if(neighbors == 3){ gridNew[i][j] = 1;}
        }
        int cellNumber = (i*grid.length)+j+1;    
    }
  }
  copyGrid();
  drawGrid();
}

//Copy the gridNew to the original grid
void copyGrid()
{
  for(int i = 0; i <grid.length; i++)
  {
    for(int j = 0; j<grid[i].length; j++)
    {
      grid[i][j] = gridNew[i][j];
    }
  }
  
}
//Draws the grid
void drawGrid()
{
  //for use in the draw function
  int curX = 0;
  int curY = 0;
  int curCell = 0;
  int halfH = cellH/2;
  int halfW = cellW/2;
  for(int i = 0; i <grid.length; i++)
  {
    for(int j = 0; j<grid[i].length; j++)
    {
      
      if(grid[i][j] ==0){fill(255);}else{fill(0);}
 
      rect(curX,curY,cellW,cellH);
      
      curCell = (i*grid.length)+j+1;
      
      //fill(255,0,0);
      //text(curCell,curX+halfH,curY+halfW);
      curY += cellH;
    }
      curY = 0;
      curX += cellW;
  }
  
}

//Resets the grid back to 0
void resetGrid()
{
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[i].length; j++){
      grid[i][j] = 0;
      gridNew[i][j] = 0;
    }
  }
  drawGrid();
}

