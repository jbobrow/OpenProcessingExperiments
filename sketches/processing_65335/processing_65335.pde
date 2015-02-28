
// 2D Array of objects 
Cell[] grid; 
 
// Number of columns and rows in the grid 
int cols = 400; 
int rows = 400; 
float sfac = 0; // factor for spiral
float sfacInc = 0.0001;
float mouseValue = 0.00001; // initial value for movement
float colorFac = 0.4;
float colorStart = 4;
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
  
  
  
  // 
    sfac=sfac+sfacInc;
    // reinitialize grid
       
       for (int i = 0; i < cols; i++) { 
       // Initialize each object 
       grid[i] = new Cell(i); 
       }   
       
  
  // mouseValue=1.57;
  // mouseValue=mouseValue+0.01;
  //colorStart=colorStart+0.1;
  
  for (int i = 0; i < cols; i++) { 
      // Oscillate and display each object 
      grid[i].display(); 
  } 
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
    xa = 200+200*sin(sfac*PI*x1/400)*cos(sfac*x1);
    ya=  200+200*sin(sfac*PI*x1/400)*sin(sfac*x1);
    
  }  
   

 
  void display() { 
    
    // stroke color
    
    stroke((colorStart+colorFac*x1)%100,100,100,100);
    // fill color
    fill((colorStart+colorFac*x1)%100,100,100,100); 
   
    
    // draw a point
    ellipse(xa,ya,esize,esize);
    
    }
  } 
 
void mousePressed() {
  
       // sfac=0.0001; 
  
       /* make gifs */
       // mouseValue=mouseValue+0.157;
       // colorStart=colorStart+0.1;
       /* save frame as png */
       // saveFrame("output-####.png");
       // background(192, 64, 0);
       // reset colorFac
       
       colorFac = random(1); // modify color change value
       colorStart = random(0,100); //modify start color
       esize = random(3,7); // modify size of balls
       // sfac=random(2); //modify factor for spiral
      
       
       // increase mouseValue
       // sfac=sfac+0.002;
       
       // reinitialize grid
       
       for (int i = 0; i < cols; i++) { 
       // Initialize each object 
       grid[i] = new Cell(i); 
       }    
      
       
     }
     
     

