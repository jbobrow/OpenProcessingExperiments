
// John Conway's Game of Life
// A version by Mike Smith using Processing
// 7/10/2014

int rows = 30;
int cols = 40;
int cellSize = 20;
boolean[] exgCells = new boolean[rows * cols];
boolean[] newCells = new boolean[rows * cols];
int[] hue = new int[rows * cols];
char[] greet = new char[rows * cols];
boolean stop = false;
boolean colour = true;
boolean grid = false;
int shape = 2;
int rand = 1;
int iterations = 0;
int newHue = 0;
String greeting = "Greetings from  Mike Smith     in sunny    Macclesfield ";
PFont spanish;


void setup()
{
  size(cols * cellSize, rows * cellSize);
  spanish = loadFont("Andalus-48.vlw");
  // initialise cells
  for(int r = 0; r < rows; r++) {
    for(int c = 0; c < cols; c++) {   
      exgCells[r*cols + c] = false;
      newCells[r*cols + c] = false;
      hue[r*cols + c] = 0;
    }
  }
  // load text into cells
  for(int h = 5; h < cols - 14; h = h + 16) {
    for(int v = 1; v < rows - 4; v = v + 6) {
      for(int c = 0; c < 14; c++) {
        for(int r = 0; r < 4; r++) {        
          greet[c + (r+v)*cols +h] = (greeting.charAt(c + r*14));
          if(greeting.charAt(c + r*14) != ' ') {
            exgCells[c + (r+v)*cols +h] = true;
          }
        }
      }
    }
  }  
}

void draw()
{
  colorMode(RGB, 255, 255, 255);
  background(255);
  frameRate(2);
  strokeWeight(3);
  stroke(150);
  fill(150);
  
  // draw grid
  if(grid) {    
    for(int r = 0; r < rows; r++) {
      line(0, r * cellSize, width, r * cellSize);
    }
    for(int c = 0; c < cols; c++) {
      line(c * cellSize, 0, c * cellSize, height);
    }
  }
  
  // draw command box
  rect(0, height - cellSize, width, height);
  
  // draw cells
  noStroke();
  colorMode(HSB, 360, 100, 100);
  for(int r = 0; r < rows; r++) {
    for(int c = 0; c < cols; c++) {    
      if(exgCells[r*cols + c]) {
        if(colour) {
          fill(hue[r*cols + c], 100, 100);
        } else fill(0);
        if(shape == 0) {
          rect(c*cellSize + 2, r*cellSize + 2,
               cellSize - 3 + random(50)*rand,
               cellSize - 3 + random(50)*rand);
        } else if (shape == 1) {
          int dia = cellSize*(1 + int(random(8))*rand);
          ellipse(c*cellSize + cellSize/2,
                  r*cellSize + cellSize/2,
                  dia, dia);
        } else if (shape == 2) {
          textFont(spanish, cellSize + random(50)*rand);
          text(greet[r*cols + c], c*cellSize + 2,
                                  (r+1)*cellSize - 2); 
        }
      }
    }
  }
  
  if(!stop) {
    // check parameters for newCells
    for(int r = 1; r < rows-1; r++) {
      for(int c = 1; c < cols-1; c++ ) {     
        // check how many neighbours
        int neighbours = 0;
        if(exgCells[(r-1)*cols + (c-1)]) neighbours++;
        if(exgCells[(r-1)*cols + (c)]) neighbours++;
        if(exgCells[(r-1)*cols + (c+1)]) neighbours++;
        if(exgCells[(r)*cols +  (c-1)])    neighbours++;
        if(exgCells[(r)*cols +  (c+1)])    neighbours++;
        if(exgCells[(r+1)*cols + (c-1)]) neighbours++;
        if(exgCells[(r+1)*cols + (c)]) neighbours++;
        if(exgCells[(r+1)*cols + (c+1)]) neighbours++;
        // apply rules
        if(neighbours == 2 && exgCells[r*cols + c]) {
          newCells[r*cols + c] = true;
        } else if(neighbours == 3) {
          newCells[r*cols + c] = true;
          if(!exgCells[r*cols + c]) hue[r*cols + c] = newHue;
        } else {
          newCells[r*cols + c] = false;
        }
      }
    }
    // exchange old cells for new
    for(int r = 0; r < rows; r++) {
      for(int c = 0; c < cols; c++) {      
        exgCells[r*cols + c] = newCells[r*cols + c];
      }
    }
    iterations++;
    newHue = (newHue + 1 + int(random(360))*rand) % 360;
  }
  // Print iterations
  textFont(spanish, 14);
  colorMode(RGB, 255, 255, 255);
  fill(0);  
  text(iterations, 5, height - 5);
  // Print commands
  text("LEFT to fill or erase cell", 50, height - 5);
  if(stop) {
    text("RIGHT to start", 200, height - 5);
  } else text("Right to stop", 200, height - 5);
  text("'c' to clear cells", 300, height - 5);
  text("'h' to change hue", 400, height - 5);
  text("'r' to randomise", 520, height -5);
  text("'x' to change mode", 620, height -5); 
}

void mousePressed()
{
  if(mouseButton == LEFT) {
    exgCells[(mouseY/cellSize)*cols + (mouseX/cellSize)] =
     !exgCells[(mouseY/cellSize)*cols + (mouseX/cellSize)];
  } else if (mouseButton == RIGHT) stop = !stop; 
}

void keyPressed()
{
  if(key == 'c') {
    for(int r = 0; r < rows; r++) {
      for(int c = 0; c < cols; c++) {      
        exgCells[r*cols + c] = false;
        newCells[r*cols + c] = false;
      }
    }
    iterations = 0;
    stop = true;
  }
  if(key == 'h') colour = !colour;
  if(key == 'g') grid = !grid;
  if(key == 'r') rand = (rand + 1) % 2;
  if(key == 'x') shape = (shape +1) % 3;
}
    


