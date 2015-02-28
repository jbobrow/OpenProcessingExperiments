
int cellSize = 50;
int cols, rows;
int[] grid = new int [64];
int blackSquare;
int moves;
PFont font;
StopWatchTimer sw;
String title = "Move all white squares to the left and all the grey squares to the right side of the grid using the black square.";

void setup(){
  size(600, 400);
  rectMode(CORNER);
  cols = 400/cellSize;          //defines the grid
  rows = 400/cellSize;
  moves = 0;                    // moves counter
  sw = new StopWatchTimer();    //inititating the timer
  sw.start();
  
  
  int grey = 0;
  int white = 0;
  
  // this for loop places grey and white squares randomly in the grid
  // every time the game starts.
  
  // picking up random cells and giving them a white or a grey color.
  for (int i=0; i < 64; i++){
     if (random(8) > random(8)){ //in a random number of row and column
      grid[i] = 100;     //pick up random cell in grid and give it a grey color
      grey++;           //increase the counter of number of grey squares
      if (grey == 31){ //if 31 squares are filled with grey, then fill the rest with white
        for (int j=i; j < 64; j++){
          grid[j] = 255;
        }
        break;
      }
      
     } else {
      grid[i] = 255;       //pick up random cell in grid and give it white color
      white++;            //increase the counter of number of white squares
      if (white == 32){  //if 32 squares are filled with white, then fill the rest with grey
        for (int j=i; j < 64; j++){
          grid[j] = 100;
        }
        break;
      }
  }  
}
  blackSquare = int(random(64)); // placing the blacksquare randomly in the grid
  grid[blackSquare] = 0;
}

void draw(){
  background(255);
  for (int i=0; i < cols; i++){
    for (int j=0; j < rows; j++){
      int x = i*cellSize; //defining position in pixels for each cell
      int y = j*cellSize;
                      //drawing the grid one cell at a time in the grid array
      fill(grid[i*8+j]); 
      stroke(0);
      rect(x,y,cellSize,cellSize);  
      
    }
  }
  time();
  text ("Moves: "+moves, 500, 300);
}

void mousePressed() {
  
  int x = mouseX/cellSize; //finding out the mouse position in a cell
  int y = mouseY/cellSize;
  
  // moving the blacksquare where the mouse is clicked
  // checking where the mouse is
  if(((x-1)*8 + y) == blackSquare ||   //left of black square
     ((x+1)*8 + y) == blackSquare ||   //right of black square
     (x*8 + y+1) == blackSquare ||     //top of black square
     (x*8 + y-1) == blackSquare )      //bottom of blacksquare
  {
    // interchanging positions of the blacksquare with the cell where the mouse is clicked
    int hold = grid[blackSquare];     //start something called hold, put blacksquare there
    grid[blackSquare] = grid[x*8+y]; //put the mouse position cell where the blacksquare was
    grid[x*8+y] = hold;             //where the mouse position was make that the blacksquare
    blackSquare=x*8+y;             //blacksquare is the mouse position
    
    fill(0);
    textAlign (CENTER);
    moves++; 
      
    //increasing the number of moves every time mouse is pressed
    
  }
    
}

// adding the timer function
void time() {
  fill(0); 
  textAlign(CENTER);

  text("Time Elapsed: " + nf(sw.hour(), 2)+":"+nf(sw.minute(), 2)+":"+nf(sw.second(), 2), 500, 350);
  text (title, 420, 20, 150, 150);
}


class StopWatchTimer {
  int startTime = 0, stopTime = 0;
  boolean running = false;  
  void start() {
    startTime = millis();
    running = true;
  }
  void stop() {
    stopTime = millis();
    running = false;
  }
  int getElapsedTime() {
    int elapsed;
    if (running) {
      elapsed = (millis() - startTime);
    }
    else {
      elapsed = (stopTime - startTime);
    }
    return elapsed;
  }
  int second() {
    return (getElapsedTime() / 1000) % 60;
  }
  int minute() {
    return (getElapsedTime() / (1000*60)) % 60;
  }
  int hour() {
    return (getElapsedTime() / (1000*60*60)) % 24;
  }
}

