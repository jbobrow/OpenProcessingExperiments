
Cell[][] cells;     
int cellSize = 10;  
int numX, numY;     

void setup() { 
  frameRate(10);
  size(600, 400);
  numX = floor(width / cellSize);
  numY = floor(height / cellSize);
  restart();
} 


void draw() {
  background(0);
            
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {
     cells[x][y].calcNextState();
    }
  }             
            
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {
     cells[x][y].crystallization();
    }
  }
}

void restart() {
  cells = new Cell[numX][numY];  
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {  
      cells[x][y] = new Cell(x, y);     
    }        
  }          

  
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {  
      int above = y-1;    
      int below = y+1;    
      int left = x-1;      
      int right = x+1;      
      if (above < 0) above = 0;   
      if (below == numY) below = numY-1;  
      if (left < 0) left = 0;  
      if (right == numX) right = numX-1;  
      
      cells[x][y].addNeighbour(cells[left][above]);  
      cells[x][y].addNeighbour(cells[left][y]);    
      cells[x][y].addNeighbour(cells[left][below]);  
      cells[x][y].addNeighbour(cells[x][below]);  
      cells[x][y].addNeighbour(cells[right][below]);  
      cells[x][y].addNeighbour(cells[right][y]);  
      cells[x][y].addNeighbour(cells[right][above]);  
      cells[x][y].addNeighbour(cells[x][above]);    
    }
  }
}


void mousePressed() {
  restart();
}


class Cell {
  float x, y;
  boolean state;  
  boolean nextState;  
  Cell[] neighbours;
  
  Cell(float _x, float _y) {
    x = _x * cellSize;
    y = _y * cellSize;
    if (random(2) > 1) {  
      nextState = true;
    } else {
      nextState = false; 
    }
    state = nextState;
    neighbours = new Cell[0];
  }
  
  void addNeighbour(Cell cell) {
    neighbours = (Cell[]) append(neighbours, cell); 
  }
  
  void calcNextState() { 
    int liveCount = 0;    
    for (int i=0; i < neighbours.length; i++) {
       if (neighbours[i].state == true) {  
         liveCount++;      
       }        
     }      
    if (state == true) {          
        if ((liveCount == 2) || (liveCount == 3)) {  
          nextState = true;          
        } else {            
          nextState = false;        
        }            
     } else {            
        if (liveCount == 3) {        
          nextState = true;      
        } else {        
          nextState = false;    
        }        
     }       
  }

  
  void crystallization() {
    state = nextState;
    stroke(255);
    for (int i=0; i < neighbours.length; i++) {
      if (neighbours[i].state == true) {  
        line(x, y, neighbours[i].x, neighbours[i].y);
      }        
    }
  }
  
}




