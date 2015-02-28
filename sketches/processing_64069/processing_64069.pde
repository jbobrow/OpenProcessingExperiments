
// oscillation between a grid and a spiral
// switches to new parameters for every cycle
// - just watch -
// click to reinitialize
// press l to show connection lines
// press n to hide connection lines

Cell[] grid; 
 
// Number of columns and rows in the grid 
int cols = 400; 
int rows = 400; 
float sfac=random(1); // factor for spiral
float mouseValue = HALF_PI; // initial value for movement
float colorFac = 0.1;
float colorStart = 0;
float colorH = 100;
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
  if(keyPressed) {
    if (key == 'l' || key == 'L') {
      DL = 1;
    }
  }
  if(keyPressed) {
    if (key == 'n' || key == 'N') {
      DL = 0;
    }
  }
  
  
  // mouseValue=1.57;
  mouseValue=mouseValue+0.01;
  colorStart=colorStart+0.1;
  for (int i = 0; i < cols; i++) { 
      // Oscillate and display each object 
      grid[i].oscillate(); 
      grid[i].display(); 
  } 
  
  
  if ( mouseValue > (2*PI+HALF_PI) ){
       colorFac = random(0,2); // modify color change value
       colorStart = random(0,100); //modify start color
       colorH = random(0,100);
       esize = random(3,7); // modify size of balls
       sfac=random(2); //modify factor for spiral
       mouseValue=HALF_PI;
       
       // reinitialize grid
       
       for (int i = 0; i < cols; i++) { 
       // Initialize each object 
       grid[i] = new Cell(i); 
       }      
      
       
    
  }
  
  
// A Cell object 

}
class Cell { 
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h. 
  float xa,ya;   // coordinates of point A
  float xb,yb;   // coordinates of point B
  float xc,yc;   // coordinates of interpolated point C
  float x1;    // value / number of point
 
  // Cell Constructor 
  Cell(float tempX) { 
    x1=tempX;
    // xb=20*(x1%20);
    // yb=x1;
    // xb=10+20*(x1%20);
    // yb=10+20*floor(x1/20);
    xb= 200+200*cos(x1);
    yb= 200+200*sin(x1);
    
    xa = 200+0.5*x1*cos(sfac*x1);
    ya=  200+0.5*x1*sin(sfac*x1);
    
  }  
   
  // fuction for modification of points
  void oscillate() { 
    
  // calculate mouseFactor and mouseValue
      
  } 
 
  void display() { 
    // stroke color
    stroke((colorStart+colorFac*x1)%100,colorH,100); 
    // stroke(colorStart,100,100);
    // fill color
    fill((colorStart+colorFac*x1)%100,colorH,100,100); 
    
    xc=xa+0.5*(1+sin(mouseValue))*(xb-xa);
    yc=ya+0.5*(1+sin(mouseValue))*(yb-ya);
    
    // draw a point
    
    if ( DL == 1 ) {
      stroke(22,22,22);
    line(xa,ya,xb,yb);
    }
    
    ellipse(xc,yc,esize,esize);
  } 
} 
 
void mousePressed() {
       /* save frame as png */
       // saveFrame("output-####.png");
       // background(192, 64, 0);
       // reset colorFac
       colorFac = random(0,2); // modify color change value
       colorStart = random(0,100); //modify start color
       colorH = random(0,100);
       esize = random(3,7); // modify size of balls
       sfac=random(1); //modify factor for spiral
       
       // reinitialize grid
       
       for (int i = 0; i < cols; i++) { 
       // Initialize each object 
       grid[i] = new Cell(i); 
       }      
       
     }
     
     

