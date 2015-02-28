
boolean[][] grid;
// Grid with the cells

// How many rows and cols it has
int rows = 30;
int cols = 30;

// Wich is the size of each cell
int cellHeight;
int cellWidth;

// Color of dead or alive
int dead = 255;
int alive = color(0, 150, 150);

// Color of the Grid
int gridColor = 100;

// Chance of surving at the beginning
float survivingChance = 0.1;

void setup(){
   size(500,500);
   noSmooth();

   grid = new boolean[rows][cols];
   cellHeight = height/rows;
   cellWidth = width/cols;
  
   for(int i = 0; i < rows; i++){
    for(int j = 0; j < cols; j++){
        grid[i][j] = random(1) < survivingChance ? true : false;
    }
   } 
}

void draw(){
 for(int i = 0; i < rows; i++){
    for(int j = 0; j < cols; j++){

        if(frameCount % 10 == 0){
          update(i,j);
        }

        fill(grid[i][j] ? alive : dead);
        stroke(255);
        rect(i * cellWidth,j * cellHeight, cellWidth, cellHeight );
    }
 }

}

void update(int _i, int _j){
   int aliveNeighbors = 0;
  
   for(int i = _i - 1; i <= _i + 1; i++){
    for(int j = _j - 1 ; j <= _j + 1; j++){
        if( i != _i || j != _j){
           if(i >= 0 && i < rows && j >= 0 && j < rows){
             if(grid[i][j]){
               aliveNeighbors++;
             }
           }
        }
    }
   } 

   if(grid[_i][_j] == true){
     if( aliveNeighbors < 2 || aliveNeighbors > 3)
       grid[_i][_j] = false;
   }else{
     if(aliveNeighbors == 3)
       grid[_i][_j] = true;
   }
}


