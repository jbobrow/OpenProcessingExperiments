
// Constants

int GRID_DIMENSION = 100; 
int SQUARE_SIZE = 5; 

int[][] grid = new int[GRID_DIMENSION][GRID_DIMENSION]; 

// probability of different moves / stay same

float p_up = 0.25;
float p_down = 0.25; 
float p_left = 0.25; 
float p_right = 0.25; 

// Current position of random walk

int[] curPos = new int[2];

// frame rate for drawing animation.

int curFrameRate = 9; 



// SETUP AND DRAW FUNCTIONS



void setup(){
  size(SQUARE_SIZE*GRID_DIMENSION, SQUARE_SIZE*GRID_DIMENSION); 
  background(0);
  curPos[0] = (SQUARE_SIZE*GRID_DIMENSION)/2;
  curPos[1] = (SQUARE_SIZE*GRID_DIMENSION)/2;
  frameRate(9);
}

void draw(){
  
  // Color in squares that have been visited (marked by a '1')
  
  for(int i = 0; i < GRID_DIMENSION; i++){
    for(int j = 0; j < GRID_DIMENSION; j++){
      if(grid[i][j] != 0){
        if(grid[i][j] == frameCount - 1){
          fill(255, 0, 0);
        } else {
          fill((255*grid[i][j]/frameCount)^3); 
        }
        rect(map(i, 0, GRID_DIMENSION, 0, height), map(j, 0, GRID_DIMENSION, 0, width), SQUARE_SIZE, SQUARE_SIZE); 
      }
    }
  }
  
  // Determine the next location for the random walk. 
  
  float randUnifHoriz = random(0, 1); 
  float randUnifVert = random(0, 1); 
  
  curPos = getNextPos(curPos); 
  grid[curPos[0]][curPos[1]] = frameCount; 
  frameRate(curFrameRate); 
}

// Gets the next position for the random walk.

int[] getNextPos(int[] curPos){
   float randUnif = random(0, 1); 
   if(randUnif <= p_left){
     curPos[0] -= 1;
   } else if(randUnif <= p_right + p_left){
     curPos[0] += 1; 
   } else if(randUnif <= p_right + p_left + p_down){
     curPos[1] -= 1; 
   } else if(randUnif <= p_right + p_left + p_down + p_up){
     curPos[1] += 1;
   } 
   for(int i = 0; i < 2; i++){
     curPos[i] = curPos[i] % GRID_DIMENSION;
     if(curPos[i] == -1){
       curPos[i] = GRID_DIMENSION - 1;
     }
   }
   return curPos; 
} 

void keyPressed(){
  if(key == ']'){
    if(curFrameRate < 500){
      curFrameRate += 2;
    }
  }
  if(key == '['){
    if(curFrameRate > 2){
      curFrameRate -= 2; 
    }
  }
}



