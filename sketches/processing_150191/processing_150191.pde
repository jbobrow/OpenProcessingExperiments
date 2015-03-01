
// -----------------------------------
// --- Karl Salameh.com --------------
// --- 02.06.2014 --------------------
// -----------------------------------

float gridSize, mapSize; // size of each grid and size of the map in grids
PVector gridPos, pixelPos; // position on grid and position in pixels on window


void setup() {
  size(500, 500);
  smooth();
  frameRate(30);

  mapSize = 20; // 20 grids by 20 grids
  gridSize = width/mapSize; // assuming width and height are the same value
  gridPos = new PVector(10, 10); // start at 0, 0 (top left)
}

void draw() {
  background(0);

  stroke(127);
  noFill();
  rectMode(CORNER);
  // --- Drawing the grid
  for (int i = 0; i < gridSize; i++) { // rows
    for (int j = 0; j < gridSize; j++) { // columns
      rect(gridSize * i, gridSize * j, gridSize, gridSize);
    }
  }


  // --- Calculating pixelPos from gridPos
  pixelPos = new PVector(gridPos.x * gridSize + (gridSize/2), gridPos.y * gridSize + (gridSize/2));

  // --- Drawing player
  noStroke();
  fill(255, 0, 0);
  rectMode(CENTER);
  rect(pixelPos.x, pixelPos.y, gridSize/2, gridSize/2);
}

void mousePressed() {
  // Do we want to move vertically or horizontally? Lets see how close to the player in X Y we clicked
  if (abs(mouseX - pixelPos.x) > abs(mouseY - pixelPos.y)) { // we move in X
    if (mouseX - pixelPos.x > 0) {
      gridPos.x++;
    } else {
      gridPos.x--;
    }
  } else { // we move in Y
    if (mouseY - pixelPos.y > 0) {
      gridPos.y++;
    } else {
      gridPos.y--;
    }
  }
}

