
// Spirale
// Interpolation zwischen einen Kreis und einer Spirale
// mit sinus Funktion
// bei jedem Durchgang erhöht sich der Parameter für die Spirale
// Werte werden angezeigt

// 2D Array of objects 
Cell[] grid; 
 
// Number of columns and rows in the grid 
int cols = 400; 
int rows = 400; 
float sfac = 0; // initial factor for spiral
float mouseValue = HALF_PI; // initial value for movement
float colorFac = 0.24;
float colorStart = 4;
float esize = 4; // size of points
int DL = 0;
PFont font01;
color randomcol01 = color(random(255),random(255),random(255));


void setup() { 
  size(400,400); 
  colorMode(HSB, 100); 
  
  // load font
  font01 = loadFont("CKLetterman-48.vlw"); 
  textFont(font01); 
 
  grid = new Cell[cols]; 
  for (int i = 0; i < cols; i++) { 
      // Initialize each object 
      grid[i] = new Cell(i); 
  } 
} 
 
void draw() { 
  background(0); 
  
  // auto
  mouseValue=mouseValue+0.0157;
  
  // change value for sfac every cycle
  if (mouseValue > 2.5*PI )
  { mouseValue = HALF_PI;
    sfac = sfac + PI/240;
    colorFac = colorFac + 0.0002;
  
    for (int i = 0; i < cols; i++) { 
       // Initialize each object 
       grid[i] = new Cell(i); 
       }    
  }
  
  
  // Draw the image
  randomcol01 = color(random(255),random(255),random(255));
  fill(randomcol01);
  stroke(randomcol01); 
  
  text("Spiral!!", 120,210);
  // text(mouseValue, 120,240);
  text(sfac, 120,270);
  
  for (int i = 0; i < cols; i++) { 
      // Oscillate and display each object 
      // grid[i].oscillate(); 
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
    
    // grid
    // xb=10+20*(x1%20);
    // yb=10+20*floor(x1/20);
    
    // circle
    // xb=200+200*cos(PI*x1/200);
    // yb=200+200*sin(PI*x1/200);
    
    // line
    xb = x1;
    yb = x1;
    
    // spiral
    xa = 200+0.5*400*sin(2*2*PI*x1/400)*cos(sfac*x1);
    ya=  200+0.5*400*sin(2*2*PI*x1/400)*sin(sfac*x1);
    
  }  
   
  
  void display() { 
    // stroke color
    stroke((colorStart+colorFac*x1)%100,100,100); 
    // stroke(colorStart,100,100);
    // fill color
    fill((colorStart+colorFac*x1)%100,100,100,100); 
    
    xc=xa+0.5*(1+sin(mouseValue))*(xb-xa);
    yc=ya+0.5*(1+sin(mouseValue))*(yb-ya);
    
    // draw a point
    ellipse(xc,yc,esize,esize);
    if ( DL == 1 ) {
      stroke(22,22,22);
    line(xa,ya,xb,yb);
    }
  } 
} 
 
void mousePressed() {
  
       /* make gifs */
       // mouseValue=mouseValue+0.157;
       // colorStart=colorStart+0.1;
       
       /* save frame as png */
       // saveFrame("output-####.png");

       
       // colorFac = random(0,2); // modify color change value
       // colorStart = random(0,100); //modify start color
       // esize = random(1,7); // modify size of balls
       
       // set sfac to a random value
       sfac=random(PI); //modify factor for spiral
              
       // increase sfac
       // sfac = sfac + 0.01;
  
       // recalculate grid
       for (int i = 0; i < cols; i++) { 
       // Initialize each object 
       grid[i] = new Cell(i); 
       }    
         
            
     }
     
     

