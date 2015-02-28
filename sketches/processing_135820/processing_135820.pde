
/* Simple Flood Fill Example
 * for Math for Artists, Spring 2014
 * by Jaewoong
 *  - Drag left mouse button to draw black
 *  - Click right mouse button to flood fill
 */

final int rows = 20;      // number of rows
final int columns = 20;   // number of columns
int[][] tiles;            // stores type of tile
                          // 0: Black, 1: White, 2~8: Rainbow
int tileW;                // tile width
int tileH;                // tile height


void setup() {
  // Initialize sketch and settings
  size(400, 400);
  tiles = new int[rows][columns];
  tileW = width / columns;
  tileH = height / rows;
  background(255);
  
  // Initialize tiles
  for(int j = 0; j < rows; j++) {
    for(int i = 0; i < columns; i++) {
      tiles[j][i] = 1;
    }
  }
}

void draw() {
  // Draw tiles
  stroke(0, 127); strokeWeight(1);
  for(int j = 0; j < rows; j++) {
    for(int i = 0; i < columns; i++) {
      setFillColor(tiles[j][i]);
      rect(i * tileW, j * tileH, tileW, tileH);
    }
  }
  
  // Fill tiles with black when left mouse button is pressed
  if(mousePressed && mouseButton == LEFT) {
    tiles[floor(mouseY/tileH)][floor(mouseX/tileW)] = 0;
  }
}

// Start flood fill if right mouse button is clicked
void mousePressed() {
  if(mouseButton == RIGHT) {
    int x = floor(mouseX/tileW);
    int y = floor(mouseY/tileH);
    floodFill(x, y, tiles[y][x], tiles[y][x]+1);
  }
}

// Reset when key is pressed
void keyPressed() {
    for(j = 0; j < rows; j++) for(i = 0; i < columns; i++) tiles[j][i] = 1;
}

// Set fill color according to specific tile values
void setFillColor(int val) {
  switch(val) {
    case 0:  fill(0); break;
    case 1:  fill(255); break;
    case 2:  fill(255, 20, 20); break;
    case 3:  fill(255, 100, 0); break;
    case 4:  fill(255, 200, 0); break;
    case 5:  fill(20, 200, 0); break;
    case 6:  fill(0, 100, 255); break;
    case 7:  fill(0, 0, 155); break;
    case 8:  fill(100, 0, 255); break;
    default: println("Exception on setFillColor(): " + val);
  }
}

// Flood fill
void floodFill(int x, int y, int target, int replace) {
  // Check if the coordination is valid
  if(x < 0 || x >= columns || y < 0 || y >= rows) return;
  
  // Check if current coordination is equal to target
  if(tiles[y][x] != target) return;
  
  // Replace current tile value
  tiles[y][x] = (replace > 8) ? 1 : replace;
  
  // Do the same for four adjacent tiles
  floodFill(x-1, y, target, replace);  // LEFT
  floodFill(x+1, y, target, replace);  // RIGHT
  floodFill(x, y-1, target, replace);  // UP
  floodFill(x, y+1, target, replace);  // DOWN
}
