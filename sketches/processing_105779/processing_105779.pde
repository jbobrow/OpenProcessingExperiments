
// from Daniel Shiffman's Learning Processing
Cell[][] grid; 
// Number of columns and rows in the grid 
int cols = 10; 
int rows = 10; 
boolean colorchange = false;
void setup() { 
  size(200, 200); 
  grid = new Cell[cols][rows]; 
  for (int i = 0; i < cols; i++ ) { 
    for (int j = 0; j < rows; j++ ) { 
      // Initialize each object 
      grid[i][j] = new Cell(i*20, j*20, 20, 20, i + j);
    }
  }
} 
void draw() { 
  background(0); 
  for (int i = 0; i < cols; i++ ) { 
    for (int j = 0; j < rows; j++ ) { 
      
       
      grid[i][j].display();
      
      //when the mouse is pressed, begin oscillate function
      if(mousePressed==true){
        grid[i][j].oscillate();
      }
      
      
    }
  }
} 
// A Cell object 
class Cell { 
  float x, y; // x,y location 
  float w, h; // width and height 
  float angle; // angle for oscillating brightness 
  // Cell Constructor 
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) { 
    x = tempX; 
    y = tempY; 
    w = tempW; 
    h = tempH; 
    angle = tempAngle;
  } 
  // Oscillation means increase angle 
  void oscillate() { 
    
    angle += 0.30;
     
    
  } 
  void display() { 
    stroke(255); 
    // Color calculated using sine wave 
    fill(145,147 + 127*sin(angle),145); 
    //fill(50,50,200);
    rect(x, y, w, h);
  }
  
 

  
  
  
}
