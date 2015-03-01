
import processing.video.*;

Capture cam;
GameOfLife game;
PImage img;

int cellSize = 15;

int[][] secondGeneration; 
int[][] thirdGeneration; 
int[][] fourthGeneration; 
int[][] fifthGeneration; 

void setup(){
    noStroke();
//    frameRate(10);
    smooth();
    img = loadImage("mieren.jpg");

    size(800,600);  
    game = new GameOfLife(cellSize);
    
    setupCamera();

}

void setupCamera(){
  String[] cameras = Capture.list();
    
    if (cameras.length == 0) {
      println("There are no cameras available for capture.");
      exit();
    } else {
      println("Available cameras:");
      for (int i = 0; i < cameras.length; i++) {
        println(cameras[i]);
      }
      
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, width, height);
    cam.start();     
  } 
}

void draw(){
  
   if (cam.available() == true) {
      cam.read();
    }  
    game.iteration();  
    
    println(cam.width);
    println(cam.height);
  
    fill(255,255,255,50);
    
    rect(0,0,width,height);
    
    
    for (int x=0; x<width/cellSize; x++) {
      for (int y=0; y<height/cellSize; y++) {
  
          int loc = x*cellSize + y*cellSize*cam.width;
          
          loadPixels();
          float r = red(cam.pixels[loc]);
          float g = green(cam.pixels[loc]);
          float b = blue(cam.pixels[loc]);
          noStroke();
//          
//          fill(255,255,255,50);
//          rect(x*cellSize,y*cellSize,cellSize*1,cellSize*1);
//          // Draw an ellipse at that location with that color

       if (game.cells[x][y]==1){
         float random = random(10,20);
          fill(r,g,b,250);
          ellipse(x*cellSize,y*cellSize,random,random);
       } 
    }
  }
}



class GameOfLife{
// Size of cells

int cellSize;

// How likely for a cell to be alive at start (in percentage)
float probabilityOfAliveAtStart = 30;

// Array of cells
int[][] cells; 
// Buffer to record the state of the cells and use this while changing the others in the interations
int[][] cellsBuffer; 

// Pause
boolean pause = false;

GameOfLife(int cellSizeFromSuper) {

  println(cellSizeFromSuper);

  cellSize = cellSizeFromSuper;
  // Instantiate arrays 
  cells = new int[width/cellSize][height/cellSize];
  cellsBuffer = new int[width/cellSize][height/cellSize];

  // Initialization of cells
  for (int x=0; x<width/cellSize; x++) {
    for (int y=0; y<height/cellSize; y++) {
      float state = random (100);
      if (state > probabilityOfAliveAtStart) { 
        state = 0;
      }
      else {
        state = 1;
      }
      cells[x][y] = int(state); // Save state of each cell
    }
  }
  background(255); // Fill in white in case cells don't cover all the windows
}


void iteration() { // When the clock ticks
  // Save cells to buffer (so we opeate with one array keeping the other intact)
  for (int x=0; x<width/cellSize; x++) {
    for (int y=0; y<height/cellSize; y++) {
      cellsBuffer[x][y] = cells[x][y];
    }
  }

  // Visit each cell:
  for (int x=0; x<width/cellSize; x++) {
    for (int y=0; y<height/cellSize; y++) {
      // And visit all the neighbours of each cell
      int neighbours = 0; // We'll count the neighbours
      for (int xx=x-1; xx<=x+1;xx++) {
        for (int yy=y-1; yy<=y+1;yy++) {  
          if (((xx>=0)&&(xx<width/cellSize))&&((yy>=0)&&(yy<height/cellSize))) { // Make sure you are not out of bounds
            if (!((xx==x)&&(yy==y))) { // Make sure to to check against self
              if (cellsBuffer[xx][yy]==1){
                neighbours ++; // Check alive neighbours and count them
              }
            } // End of if
          } // End of if
        } // End of yy loop
      } //End of xx loop
      // We've checked the neigbours: apply rules!
      if (cellsBuffer[x][y]==1) { // The cell is alive: kill it if necessary
        if (neighbours < 2 || neighbours > 3) {
          cells[x][y] = 0; // Die unless it has 2 or 3 neighbours
        }
      } 
      else { // The cell is dead: make it live if necessary      
        if (neighbours == 3 ) {
          cells[x][y] = 1; // Only if it has 3 neighbours
        }
      } // End of if
    } // End of y loop
  } // End of x loop
} // End of function
}



