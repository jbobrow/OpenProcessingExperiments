
int sx, sy; 
float density = 0.206; 
int[][][] world;

int bCells = 0;
int rCells = 0;
int eCells = 0;
int steps = 0;

 
void setup() 
{ 
  size(400, 400, P2D);
  frameRate(60);
  sx = width;
  sy = height;
  world = new int[sx][sy][2]; 
   
  // Set random cells to 'on' 
  for (int i = 0; i < sx * sy * density; i++) { 
    world[120+(int)random(sx)/6][(int)random(sy)][1] = 1; //blue
    world[220+(int)random(sx)/6][(int)random(sy)][1] = -1; //red
  } 
   
} 
 
void draw() 
{ 
  background(0); 

  
  // Drawing and update cycle 
  for (int x = 0; x < sx; x=x+1) { 
    for (int y = 0; y < sy; y=y+1) { 
      if ((world[x][y][1] == 1) ) 
      { 
        world[x][y][0] = 1; 
        set(x, y, #0000FF); //blue
      } 
      if (world[x][y][1] == -1) 
      { 
        world[x][y][0] = -1; 
        set(x, y, #FF0000);  //red
      }
      if (world[x][y][1] == 0) 
      { 
        world[x][y][0] = 0; 
        set(x, y, #000000);  
      } 
    } 
  } 
  
  
    
  bCells = 0;
  rCells = 0;
  eCells = 0;
  
  // Birth and Death and Survive cycle 
  for (int x = 0; x < sx; x++) { 
    for (int y = 0; y < sy; y++) { 
      int bCount = bNeighbors(x, y); 
      int rCount = rNeighbors(x, y); 
      int eCells = 8 - rCount - bCount;
      
      // Game of Life Rules
      if ((rCount > 0 && bCount == 0) ||(bCount > 0 && rCount == 0)){
        if (bCount == 3 && world[x][y][0] == 0) 
          world[x][y][1] = 1; 
          
        if ((bCount < 2 || bCount > 3) && world[x][y][0] == 1) 
          world[x][y][1] = 0; 
        
        if (rCount == 3 && world[x][y][0] == 0) 
          world[x][y][1] = -1; 

        if ((rCount < 2 || rCount > 3) && world[x][y][0] == -1) 
          world[x][y][1] = 0; 

      }else{
        // Birth
        if (world[x][y][0] == 0){
         eCells ++; 
          // Case 1
          if(bCount == 3 && rCount != 3)
            world[x][y][1] = 1;
            
          //new
          if (rCount == 3 && bCount !=3)
            world[x][y][1] = -1;
          
          // Case 2
          if(bCount == 3 && rCount == 3 && bCount !=0 && rCount!= 0){
            if (random(0, 1) < 0.5 )
             world[x][y][1] = 1;
            else
             world[x][y][1] = -1; 
          } 
        }
        
        // Survival
       if (world[x][y][0] == 1){
         bCells++;
         // Case 1
         if ((bCount - rCount) == 2 || (bCount - rCount == 3))
           world[x][y][1] = 1;


         if(((bCount - rCount) == 1) && (bCount >=2))
           world[x][y][1] = 1;
         }

      }
    } 
  } 
  
  //rCells = abs(eCells - bCells);
  
} 
 
// Count the number of adjacent cells 'on' 
int bNeighbors(int x, int y) 
{ 
  int n=0;
    
  if (world[(x + 1) % sx][y][0]  == 1) n++;   
  if (world[x][(y + 1) % sy][0]  == 1) n++;   
  if (world[(x + sx - 1) % sx][y][0]  == 1) n++;    
  if (world[x][(y + sy - 1) % sy][0]  == 1) n++;    
  if (world[(x + 1) % sx][(y + 1) % sy][0]  == 1) n++;    
  if (world[(x + sx - 1) % sx][(y + 1) % sy][0]  == 1) n++;    
  if (world[(x + sx - 1) % sx][(y + sy - 1) % sy][0]  == 1) n++;    
  if (world[(x + 1) % sx][(y + sy - 1) % sy][0]  == 1) n++;    
         
  return n;
}

int rNeighbors(int x, int y) 
{ 
  int n=0;
    
  if (world[(x + 1) % sx][y][0]  == -1) n++;   
  if (world[x][(y + 1) % sy][0]  == -1) n++;   
  if (world[(x + sx - 1) % sx][y][0]  == -1) n++;    
  if (world[x][(y + sy - 1) % sy][0]  == -1) n++;    
  if (world[(x + 1) % sx][(y + 1) % sy][0]  == -1) n++;    
  if (world[(x + sx - 1) % sx][(y + 1) % sy][0]  == -1) n++;    
  if (world[(x + sx - 1) % sx][(y + sy - 1) % sy][0]  == -1) n++;    
  if (world[(x + 1) % sx][(y + sy - 1) % sy][0]  == -1) n++;    
         
  return n;
}

