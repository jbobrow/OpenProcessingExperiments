
/* This program simulates the erosion process 
described in Jian Ding's Math 136 Lecture 28 
Notes. The idea is that we send a 2d random
walk from the origin to the border of a rectangle, 
and the place where the walk lands is "eroded". Then
run another random walk until you hit the border, and 
erode that border point. Continue this process until
the origin is eroded away. */ 

int GRID_DIMENSION = 20;
int SQUARE_SIZE = 10; 

int[][] grid = new int[GRID_DIMENSION][GRID_DIMENSION]; 
int[] curPos = new int[2]; 
int[] nextPos = new int[2]; 

float p_up = 0.25;
float p_down = 0.25; 
float p_left = 0.25; 
float p_right = 0.25; 

int curFrameRate = 9; 

void setup(){ 
  size(GRID_DIMENSION*SQUARE_SIZE, GRID_DIMENSION*SQUARE_SIZE);
  background(0); 
  
  // Initialize the border to -1's 
  
  for(int i = 0; i < GRID_DIMENSION; i++){
    grid[i][0] = -1;
    grid[i][GRID_DIMENSION - 1] = -1;
    grid[0][i] = -1;
    grid[GRID_DIMENSION - 1][i] = -1; 
  }
  
  curPos[0] = ceil(GRID_DIMENSION/2);
  curPos[1] = ceil(GRID_DIMENSION/2);

}

void draw(){
 background(0); 
 fill(255, 0, 0); 

 rect(curPos[0]*SQUARE_SIZE, curPos[1]*SQUARE_SIZE, SQUARE_SIZE, SQUARE_SIZE); 
 
 // draw the border (the area that has been eroded away). 
 
 for(int i = 0; i < GRID_DIMENSION; i++){
   for(int j = 0; j < GRID_DIMENSION; j++){
     if(grid[i][j] == -1){
       fill(255);
       rect(i*SQUARE_SIZE, j*SQUARE_SIZE, SQUARE_SIZE, SQUARE_SIZE); 
     }
   }
 }
  
 int[] curPosCopy = new int[2];
 curPosCopy[0] = curPos[0];
 curPosCopy[1] = curPos[1]; 
 
 nextPos = getNextPos(curPosCopy); 
  
 if(grid[nextPos[0]][nextPos[1]] == -1){
 //   println("curX: " + curPos[0] + " curY: " + curPos[1]);
   grid[curPos[0]][curPos[1]] = -1; 
   curPos[0] = ceil(GRID_DIMENSION/2);
   curPos[1] = ceil(GRID_DIMENSION/2);
 } else {
   curPos = nextPos;
//   println("curX: " + curPos[0] + " curY: " + curPos[1]);
 }
 
 frameRate(curFrameRate); 

}

// Gets the next position for the random walk.

int[] getNextPos(int[] inputPos){
   float randUnif = random(0, 1); 
   if(randUnif <= p_left){
     inputPos[0] -= 1;
   } else if(randUnif <= p_right + p_left){
     inputPos[0] += 1; 
   } else if(randUnif <= p_right + p_left + p_down){
     inputPos[1] -= 1; 
   } else if(randUnif <= p_right + p_left + p_down + p_up){
     inputPos[1] += 1;
   } 
   for(int i = 0; i < 2; i++){
     inputPos[i] = inputPos[i] % GRID_DIMENSION;
     if(inputPos[i] == -1){
       inputPos[i] = GRID_DIMENSION - 1;
     }
   }
   return inputPos; 
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

