
// turning spiral
// nice interference patterns 
// klick to restart and reset some paramaters
// - size of the dots
// - color scheme


Cell[] grid; 
 
// Number of columns and rows in the grid 
int cols = 400; 
int rows = 400; 
float sfac = random(10); // factor for spiral
float sfacInc = 0.00001;
float mouseValue = 1; // initial value for movement
float colorFac = 0.3;
float colorStart = 55;
float esize = 3; // size of points
int DL = 0;


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
  sfac=sfac+sfacInc;
  // reinitialize grid
       
  for (int i = 0; i < cols; i++) { 
       // Initialize each object 
       grid[i] = new Cell(i);    }   
   
  for (int i = 0; i < cols; i++) { 
      // display each object 
      grid[i].display();         } 
} 
 
// A Cell object 
class Cell { 
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h. 
  float xa,ya;   // coordinates of point A
  float xb,yb;   // coordinates of point B
  float xc,yc;   // coordinates of interpolated point C
  float x1;    // value / number of point
 
  // Cell Constructor 
  Cell(float tempX) { 
    x1=tempX;
    xb=10+20*(x1%20);
    yb=10+20*floor(x1/20);
    xa = 200+200*sin(PI*x1/400)*cos(sfac*x1);
    ya=  200+200*sin(PI*x1/400)*sin(sfac*x1);
    
  }  
   

  void display() { 
    
    // stroke color
    stroke((colorStart+colorFac*x1)%100,100,100,100);
    // fill color
    fill((colorStart+colorFac*x1)%100,100,100,100); 
    // draw a point
    ellipse(xa,ya,esize,esize);
    
               }
      } // end of class Cell
 
void mousePressed() {
  
       // sfac=0.0000; 
  
       /* make gifs */
       // mouseValue=mouseValue+0.157;
       // colorStart=colorStart+0.1;
       /* save frame as png */
       // saveFrame("output-####.png");

       // reset colorFac etc
       
       colorFac = random(0,2); // modify color change value
       colorStart = random(0,100); //modify start color
       esize = random(3,9); // modify size of balls
       sfac=random(100); //modify factor for spiral
 
       // reinitialize grid
       for (int i = 0; i < cols; i++) { 
       // Initialize each object 
       grid[i] = new Cell(i); 
       }    
       
      
       
     }  // end of mousePressed routine
     
     

