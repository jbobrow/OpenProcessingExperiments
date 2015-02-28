
// 2D Array of objects 
Cell[] grid; 
 
// Number of columns and rows in the grid 
int cols = 400; 
int rows = 400; 
float maxFac = 4000;
float mouseFactorDecrease = random(0.93,0.99); // decrease per step 
float mouseFix = random (10,100);
float mouseRandom = random(1);
 
 
void setup() { 
  size(400,400); 
  colorMode(HSB, 100); 
 
  grid = new Cell[cols]; 
  for (int i = 0; i < cols; i++) { 
      // Initialize each object 
      grid[i] = new Cell(i); 
  } 
} 
 
void draw() { 
  background(0); 
  // The counter variables i and j are also the column and row numbers and  
  // are used as arguments to the constructor for each object in the grid.   
  for (int i = 0; i < cols; i++) { 
      // Oscillate and display each object 
      grid[i].oscillate(); 
      grid[i].display(); 
  } 
} 
 
// A Cell object 
class Cell { 
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h. 
  float x,y;   // coordinates of point
  float x1;    // value / number of point
  float mouseValue; 
  float mouseFactor; // inreased by mouse position 
  
 
  // Cell Constructor 
  Cell(float tempX) { 
    x1=tempX;
  }  
   
  // Oscillation means increase angle 
  void oscillate() { 
    
    // calculate mouseFactor and mouseValue
    // mouseFactor = mouseFix /( abs(x+200-mouseX) + abs(y+200-mouseY) + .0001); 
    // mouseValue = mouseFactorDecrease*mouseValue+mouseFactor; 
    mouseValue = 0.1*sqrt((200-mouseX)*(200-mouseX)+(200-mouseY)*(200-mouseY));
    
    // limit mouseValue
    // if ( mouseValue > maxFac ) { 
      // mouseValue = maxFac; } 
    
   
  } 
 
  void display() { 
    stroke(255); 
    // Color calculated using mouseValue
    fill(x1%100,100,100,100); 
    
    // calulate coordinates using mouseValue
    x = 0.5*x1*cos(x1/mouseValue+random(mouseRandom)); 
    y = 0.5*x1*sin(x1/mouseValue+random(mouseRandom)); 
    
    // without mouseValue
    // x = 0.5*x1*cos(x1); 
    // y = 0.5*x1*sin(x1); 
    
    // ellipse(x+200,y+200,2 + w*mouseValue/500,2 + h*mouseValue/500);  
    // ellipse(x+200,y+200,mouseValue,mouseValue);
    ellipse(x+200,y+200,mouseValue,mouseValue);
  } 
} 
 
void mousePressed() {
       /* save frame as png */
       // saveFrame("output-####.png");
       background(192, 64, 0);
       maxFac = random(2000,9000);
       mouseFactorDecrease = random(0.90,0.99); 
       mouseFix = random (10,100);
       mouseRandom = random (0,1);
     }

