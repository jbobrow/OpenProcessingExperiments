
/** Global Constants **/
// One image to be drawn at every location
/* @pjs preload="coin.png"; */
PImage COIN_IMAGE;

// Dead or Alive array
boolean IS_ALIVE_ARRAY[][];

// Position of last coin. Used in undo
int LAST_IMG_X, LAST_IMG_Y;

// Flag to set simulation to true when 'play' is pressed
boolean SIMULATE_FLAG;

// Timer to keep track of progess
int TIMER;

// Maximum timer. stop draw()ing after timer reaches this value
int MAX_TIMER;

void setup() {
  /** Set the values of global constants **/
  reset();
  SIMULATE_FLAG = false;
  TIMER = 0;
  MAX_TIMER = 100;
  COIN_IMAGE = loadImage("coin.png");
  IS_ALIVE_ARRAY = new boolean[max_grid_X()+2][max_grid_Y()+2];
  for (int i = min_grid_X(); i <= max_grid_X(); i++)
    for(int j = min_grid_X(); j <= max_grid_X(); j++)
      IS_ALIVE_ARRAY[i][j] = false;
}

void draw() {
  if (SIMULATE_FLAG) {
    advanceCells();
    TIMER++;
    if (TIMER >= MAX_TIMER)
      noLoop();
  }
}

void mousePressed() {
  if (mouseX > arena_width() - cell_width()) { 
     SIMULATE_FLAG = true;
  }
  else if (mouseX >= cell_width() && mouseY >= cell_height() && mouseY <= arena_height() - cell_height()) {
    if (!SIMULATE_FLAG) 
      placeCoin();
  }
}

/***
 * Implements the 'reset' button
 ***/
void resetPressed() {
  reset();
}

/***
 * Implements the 'undo' button
 ***/
void undoPressed() {
  undo();
}

/***
 * Place a coin at right co-ordinate given mous-click position
 ***/
void placeCoin() {
  int CELL_WIDTH = cell_width();
  int CELL_HEIGHT = cell_height();
  // Setup last position and alive array
  LAST_IMG_X =(int) (mouseX /  CELL_WIDTH);
  LAST_IMG_Y = (int) (mouseY / CELL_HEIGHT);
  IS_ALIVE_ARRAY[LAST_IMG_X][LAST_IMG_Y] = true;
  // Draw the coin
  imageMode(CORNER);
  image(COIN_IMAGE, LAST_IMG_X * CELL_WIDTH, LAST_IMG_Y * CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT);
}


/***
 * Use the rules of Game of life to check if the cell is alive in 
 * Next iteration. Wrap-around at the end of the screen in all directions
 ***/
boolean is_alive(int c_i, int c_j) {
  int alive_neighbors = 0;
  int MAX_X = max_grid_X();
  int MAX_Y = max_grid_Y();
  int MIN_X = min_grid_X();
  int MIN_Y = min_grid_Y();

  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      if (i == 0 && j == 0)
        continue;
      int new_ci = (c_i + i) % MAX_X;
      int new_cj = (c_j + j) % MAX_Y;
      // Adjust the indices if out of arena
      if (new_ci < MIN_X)
        new_ci += MAX_X;
      if (new_cj < MIN_Y)
        new_cj += MAX_Y;

      if (IS_ALIVE_ARRAY[new_ci][new_cj])
        alive_neighbors++;
    }
  }
  return ((IS_ALIVE_ARRAY[c_i][c_j] && alive_neighbors == 2) || alive_neighbors == 3);
}

/***
 * Advance the cells by killing/reviving them to next round
 ***/
void advanceCells() {
  reset();
  
  int CELL_WIDTH = cell_width();
  int CELL_HEIGHT = cell_height();
  
  boolean TEMP_IS_ALIVE_ARRAY[][] = new boolean[max_grid_X()+2][max_grid_Y()+2];
  
  for (int i = min_grid_X(); i <= max_grid_X(); i++) {
    for (int j = min_grid_Y(); j <= max_grid_Y(); j++) {
      if (is_alive(i, j)) 
        TEMP_IS_ALIVE_ARRAY[i][j] = true;
      else
        TEMP_IS_ALIVE_ARRAY[i][j] = false;
    }
  }
  
  arrayCopy(TEMP_IS_ALIVE_ARRAY, IS_ALIVE_ARRAY);
  drawCoins();
}
int arena_width() {
  return (int)(width * 0.75);
}

int arena_height() {
  return height;
}

int cell_width() {
  return 16;
}

int cell_height() {
  return (int)(cell_width() * float(arena_height()) / float(arena_width()));
}

int max_grid_X() {
  return arena_width() / cell_width() - 2;
}

int max_grid_Y() {
  return arena_height() / cell_height() - 2;
}

int min_grid_X() {
  return 1;
}

int min_grid_Y() {
  return 1;
}

/***
 * Redraw the entire coin_images array
 ***/
void drawCoins() {
  reset();
  int CELL_WIDTH = cell_width();
  int CELL_HEIGHT = cell_height();  
  
  for (int i = min_grid_X(); i <= max_grid_X(); i++) {
    for (int j = min_grid_Y(); j <= max_grid_Y(); j++) {
      if (IS_ALIVE_ARRAY[i][j]) {
        imageMode(CORNER);
        image(COIN_IMAGE, i * CELL_WIDTH, j * CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT);
      }
    }
  }
}


/***
 * Very important method. Call this method to clear the screen and redraw the grid
 ***/
void reset() {
  // Setting up background and colors
  background(0);
  size(640, 480);
  stroke(255);

  int ARENA_WIDTH = arena_width();
  int CELL_WIDTH = cell_width();
  int ARENA_HEIGHT = arena_height();
  int CELL_HEIGHT = cell_height();  

  for (int i = CELL_WIDTH; i < ARENA_WIDTH; i += CELL_WIDTH)  
    line(i, CELL_HEIGHT, i, ARENA_HEIGHT - CELL_HEIGHT);

  for (int i = CELL_HEIGHT; i < ARENA_HEIGHT; i += CELL_HEIGHT)
    line(CELL_WIDTH, i, ARENA_WIDTH - CELL_WIDTH, i);
    
}


/***
 * Undo the last placed coin. 
 * TODO: Can only be called once
 ***/
void undo() {
  IS_ALIVE_ARRAY[LAST_IMG_X][LAST_IMG_Y] = false;
  drawCoins();
}



