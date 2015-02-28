
/*

  Pattern generator that uses continuous totalistic automata in 1D in 3 channels RGB
  
  fuzzy logic on which layer is pulled from
  
*/

float[][][] grid;
int gridSize;
int currentRow;

float automataOffset;

PFont fontA;

void setup(){

  gridSize = 32;
  
  grid = new float[3][gridSize][gridSize];
  
  size(900,450);
  background(0);

  initGrid();


}

void initGrid(){

  currentRow = 1;
  
  for(int i = 0; i < gridSize; i++){
    for(int j = 0; j < gridSize; j++){     
      for(int z = 0; z<3; z++){      
        grid[z][i][j] = 0.0;
        if(j == 0) {  grid[z][i][j] = random(1); }
      }
    }
  }

}

void tick(){

  automataOffset = mouseX / 960.0;
  
  int rowToReadFrom = currentRow - 1;
  if(currentRow == 0) { rowToReadFrom = gridSize - 1; }
  
  for(int channel = 0; channel < 3; channel++)
  {    
    for(int i = 0; i < gridSize; i++)
    {
      
      float average = 0.0;
      int whichToRead = floor(random(4));
      
      // evaluate
      if(i == 0){      
        average = (grid[channel][gridSize-1][rowToReadFrom] + grid[channel][i][rowToReadFrom] +grid[channel][i+1][rowToReadFrom]) / 3.0;
        average += automataOffset;
        if(average > 1.0) { average -= 1.0; }              
      }
      else if(i == gridSize - 1){      
        average = (grid[channel][i-1][rowToReadFrom] + grid[channel][i][rowToReadFrom] +grid[channel][0][rowToReadFrom]) / 3.0;
        average += automataOffset;
        if(average > 1.0) { average -= 1.0; }            
      }
      else{      
        average = (grid[channel][i-1][rowToReadFrom] + grid[channel][i][rowToReadFrom] +grid[channel][i+1][rowToReadFrom]) / 3.0;
        average += automataOffset;
        if(average > 1.0) { average -= 1.0; }        
      }      
      grid[channel][i][currentRow] = average;            
    }
  }

  currentRow++; if(currentRow == gridSize) currentRow = 0;

}

void draw(){

  if(mousePressed) { initGrid(); }
  
  tick();
  
  pushMatrix();

    scale(28.12,14.06);
  
    fill(0,0,0, 32);
    rect(-6,-6,gridSize+9, gridSize+9);
  
    for(int i = 0; i < gridSize; i++){
      stroke(0,0,0,0);
      fill(grid[0][i][currentRow]*255,grid[1][i][currentRow]*255, grid[2][i][currentRow]*255, 16); 
      ellipse(i, currentRow, 4, 4);    
    }
  popMatrix();
 
}   
                                
