
int cols = 20;
int rows = 20;
int[][] grid = new int[cols][rows];
float[][] col = new float[cols][rows];

void setup(){
  size(400,400);
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      grid[i][j] = (int)random(10,30);
      col[i][j] = random(255); 
    }
  }
}

void draw(){
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      fill(col[i][j]);
      rect(20*i, 20*j, grid[i][j], grid[i][j]);
    }
  }
}


