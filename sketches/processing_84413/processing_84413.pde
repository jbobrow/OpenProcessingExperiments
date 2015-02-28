

//prevents multiple triggers of key events
int mouseDown = 0;
int keyDown = 0;

int gameSpeed = 4;
//defines the screens in the world dimensions
int gridD =20;
int gridSize = gridD*gridD;
int gridW = 300;
int cellPixels = gridW/gridD;

//world dimensions
int worldD = 5;
int worldSize = worldD*worldD;

//defines the world [screens]{array of screen cells}
int[][] world = new int[worldSize][gridSize];

//defines the player
//playerBody[segment][{grid position, world position}]
int[][] playerBody = new int[2][2];
int playerPosNew = 0;
int worldPos = 0;

//grid objects
// empty = 0;
// wall = 1;
// apple = 2;
// head = 3;
// body = 4;

int edit = 0;
int lastCell = 0;

void setup()
{
  size(300, 300);
  noStroke();
  reset();
  fill(0);
  rect(0,0,300,300);
}
void reset()
{
  //creates an empty grid arrays
    
    
    for(int i = 0; i < worldSize-1; i++){
      for(int j = 0; j < gridSize-1; j++){
        world[i][j] = 0;
      }  
      
    }    
    //defines the start position of the player
    playerBody = new int[4][2];
    //head
    playerBody[0][0] = floor(gridSize/2 + gridD/2);
    playerBody[0][1] = 0;
    //body
    playerBody[1][0] = playerBody[0][0]-1;
    playerBody[1][1] = 0;
    playerBody[2][0] = playerBody[1][0]-1;
    playerBody[2][1] = 0;
    playerBody[3][0] = playerBody[2][0]-1;
    playerBody[3][1] = 0;
    
    //creates an apple
    loadMap();
    addApple();
    drawGrid();
 }
void draw()
{
  frameRate(30);

  checkInput();
 if(frameCount%gameSpeed == 0)
 {
   drawGrid(); 
   updatePlayer();
    
 }
}

void checkInput()
{
  if(mousePressed == true && mouseDown == 0)
    {
      //protects from gettting mutltiple clicks
      mouseDown = 1;
      
      
    }
    
    if(edit == 1 && mousePressed == true)
      {
        //finds the cell the player clicked in
        int rowCount = (floor((mouseX-1)/cellPixels))*gridD;
        int cellNumber = floor((mouseY-1)/cellPixels)+ rowCount;
        
        
        if(lastCell != cellNumber && cellNumber < world[0].length-1 && cellNumber >=0)
        { 
           lastCell = cellNumber; 
          //change the data in the cell
          if(world[worldPos][cellNumber] == 0){world[worldPos][cellNumber] = 1;}
          else if(world[worldPos][cellNumber] == 1){world[worldPos][cellNumber] = 0;}
        }
        
        
      }
      
  if(mousePressed == false){ mouseDown = 0; }
 
  if(keyPressed == true && keyDown == 0 )
  {
    keyDown = 1;
    if(key == 'w' || key == 's' || key == 'a' || key == 'd'){ 
      if(key == 'w'){ playerPosNew = -1; }
      if(key == 's'){ playerPosNew = 1; }
      if(key == 'a'){ playerPosNew = -gridD; }
      if(key == 'd'){ playerPosNew = +gridD; }
      }
     if(key =='r'){println("Reset Map"); reset(); }
     if(key =='t'){println("Save Map"); saveMap();}
     if(key =='y'){println("Load Map"); loadMap(); }
     if(key =='e')
     {
       if(edit == 0){ edit = 1; println("Enter Edit Mode");}else{edit = 0; println("Exit Edit Mode");}
     }
   }

  if(keyPressed == false && keyDown == 1){ keyDown = 0;}
  
}

void loadMap() {
  try {
    int k = 0;
    String[] mapGrid = loadStrings("map.txt");
    for(int i = 0; i < worldSize; i++){
      for(int j = 0; j <gridSize-1; j++){
        
        world[i][j] = int(mapGrid[k]);
        k++;
      }
    }
      
  }
  catch (NullPointerException e){
    println("Failed to load the map");
  }
  addApple();
}
void saveMap()
{
  int k = 0;
  String[] mapGrid = new String[worldSize*gridSize];
    for(int i = 0; i < worldSize; i++){
      for(int j = 0; j <gridSize-1; j++){
        
        //writes the walls to the save data, should only be walls or nothing
        if(world[i][j] == 1){ mapGrid[k] = str(world[i][j]);} else { mapGrid[k] = str(0);}
        k++;
      }
    }
    saveStrings("map.txt", mapGrid);
    println("Done Saving");
}

//updates the position of the segments of the player body.
void updatePlayer()
{
  //where the player should go next
  int playerHit = playerBody[0][0] + playerPosNew;
  
  /////
  //checks for all the edges of the grid
  /////
  
  //player going Right off the screen
  if(playerHit > gridSize-1) { 
    playerHit = playerHit%gridD;
    worldPos = worldPos + worldD;
    println(worldPos);
  }
  
  //player going off Left side of screen 
  if(playerHit < 0){
    playerHit = playerBody[0][0] + (gridD-1)*gridD;
    worldPos = worldPos - worldD;
    println(worldPos);
  }
  
  //if the player is moving Up off the screen
  if(playerBody[0][0]%gridD == 0 && playerHit%gridD == gridD-1){ 
    playerHit = playerBody[0][0]+gridD-1;
    worldPos = worldPos -1;
    println(worldPos);
  }
  
  //if the player is moving down
  if(playerBody[0][0]%gridD == gridD-1 && playerHit%gridD == 0){ 
    playerHit = playerBody[0][0]-gridD+1;
    
    //need to solve the same wrapping problem
    //going to ignore it and putt up walls
    worldPos = worldPos + 1;
    println(worldPos);
  }
  
  //check collisions with walls
  if(world[worldPos][playerHit] == 1)
  {
    playerHit = playerBody[0][0];
  }
    //checks to see if player ate an apple
  else if(world[worldPos][playerHit] == 2)
    {
      addSegment();
      world[worldPos][playerHit] = 0;
      addApple();
    }
    
    //moves the body segments
    int curX = 0;
    int curY = 0;
    for(int i = playerBody.length-1; i >0; i--)
    {
      //copies positions down the chain of the snake
      if(playerHit != playerBody[0][0])
      {
        playerBody[i][0] = playerBody[i-1][0];
        playerBody[i][1] = playerBody[i-1][1];
      }
      
      if(playerBody[i][1] == worldPos)
      {
        //writes those positions to the grid
         curY = cellPixels*((playerBody[i][0]%gridD));
         curX = cellPixels*(floor(playerBody[i][0]/gridD));
        
        fill(255,random(100),255);
        rect(curX,curY,cellPixels,cellPixels);
      }
    }
   
    
    playerBody[0][0] = playerHit;
    playerBody[0][1] = worldPos;
    curY = cellPixels*((playerBody[0][0]%gridD));
    curX = cellPixels*(floor(playerBody[0][0]/gridD));
    fill(random(255),random(255),random(255));
    rect(curX,curY,cellPixels,cellPixels);
    
  
  
}

//adds a segment to the back of the snake upon eating
void addSegment()
{
  //figures out the grid position to add the segment
 int bodySize = playerBody.length-1; 
 int lastSeg = playerBody[bodySize][0];
 int prevSeg = playerBody[bodySize-1][0];
 int newSeg = lastSeg + ( lastSeg-prevSeg); 
 if (newSeg < 0){ newSeg = lastSeg+1;}
 if (newSeg > gridSize-1){ newSeg = lastSeg-1;}
   playerBody = (int[][]) append(playerBody, new int[] {newSeg,worldPos});
}

void addApple()
{
 int newApple = round(random(gridSize-1));
  if(world[worldPos][newApple] == 0)
  {
    world[worldPos][newApple] = 2;
    
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
  for(int i = 0; i <world[0].length; i++)
  {
    gridCell = i;
    
    curY = cellPixels*((gridCell%gridD));
    curX = cellPixels*(floor(gridCell/gridD));
    
    //cell Fill
    if(world[worldPos][i] == 0){
      fill(0,100+random(5),0);
      }
    if(world[worldPos][i] == 1){fill(0,0,50+random(100));}
    if(world[worldPos][i] == 2){fill(150+random(100),0,0);}
    if(world[worldPos][i] == 4){fill(255,random(100),255);}
    if(world[worldPos][i] == 3){fill(random(255),random(255),random(255));}
    
    //draw cell
    rect(curX,curY,cellPixels,cellPixels);
    
    //debug text
    //fill(0);
    //text(i,curX+3,curY+3);
   }
   
  
}


