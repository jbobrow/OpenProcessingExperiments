
// 5x5 grid - Simple Space Men

int[][] grid = new int[5][5]; 

int gridsize = 50;


void setup(){
  size(350,350);
  background(255);
  grid[0][0] = 1;
  grid[0][2] = 1;
  randomGrid();
  symmetricalGrid();
}

void draw(){
  
 
  if(frameCount%100 == 0) symmetricalGrid(); 
  
   
  rotate(HALF_PI);
  translate(50,-300);
  
  for (int i=0; i<5; i++){ // i = columns
    for (int j=0; j<5; j++){ // j = rows
      int value = grid[j][i]; // get value for row 0, column i
      if (value == 1) fill(0);
      else fill(255);
      noStroke();
      rect(i*gridsize,j*gridsize,gridsize-2,gridsize-2); // draw the square
    }
  }

}


void randomGrid(){
  
    for (int i=0; i<5; i++){ // i = columns
    for (int j=0; j<5; j++){ // j = rows
      grid[j][i] = int(random(2));
    }
  }
  
}

void symmetricalGrid(){

  grid[4] = grid[0]; // make row 4 the same as row 2
  grid[3] = grid[1]; // make row 4 the same as row 2
  
  
}

void mouseReleased(){
  randomGrid();
  symmetricalGrid();
}

