
//This sketch should be uploaded to OpenProcessing

//The current grid
boolean[][] grid = new boolean[50][50];
//The saved grids (an array of 2D arrays)
boolean[][][] saveGrid = new boolean[10][50][50];

void setup() {
  size(500, 500);
  
  //Set the default grid to be one of the grids
  grid = saveGrid[1];
}

void draw() {
  //Display the bacground and the grid
  drawBackground();
  //Display the rectangles inside the grid
  drawGrid();
}

void drawBackground() {
  background(0);
  stroke(51, 191, 42);
  
  //Draw a simple grid
  for(int i = 0; i < width; i += 10) {
    line(i, 0, i, 500);
    line(0, i, 500, i);
  }
}

void drawGrid() {
  //Loop through the grid elements
  for(int i = 0; i < 50; i += 1) {
    for(int j = 0; j < 50; j += 1) {
      //If the grid value is true, fill with green
      if(grid[i][j]) fill(51, 191, 42);
      //If not, fill with black
      else fill(0);
      
      //Display the rectangle
      rect(i * 10, j * 10, i + 10 * 10, j + 10 * 10);
    }
  }
}

void keyReleased() {
  if(key != CODED) {
    //Check to see if the character is a valid integer
    if(Character.isDigit(key)) {
      //Find the integer value from the char value by subtracting 42
      grid = saveGrid[key - 48];
    }
  }
}

void mouseClicked() {
  //Assign the current grid element to be the opposite of itself
  grid[(int) mouseX / 10][(int) mouseY / 10] = !grid[(int) mouseX / 10][(int) mouseY / 10];
}

