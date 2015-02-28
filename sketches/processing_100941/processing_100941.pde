
String[] headlines = {
  "My Final Project",
  "Lets see how this works...",
  };
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 20;
int rows = 20;
 
PFont f;  // Global font variable
float x;
float i = 0;
float j = 0;// horizontal location of headline
int index = 0;
float a = 100;
float b = 100;
float aspeed = 1;
float bspeed = 3.3;
 
void setup() {
  size(400,400);
  f = createFont("Arial",16,true);  
  // Initialize headline offscreen to the right
  x = width;
  smooth();
  background(0);
  grid = new Cell[cols][rows];
  for (int r = 0; r < cols; r++) {
    for (int s = 0; s < rows; s++) {
      // Initialize each object
      grid[r][s] = new Cell(r*20,s*20,20,20,r+s);
    }
  }
}
 
void draw() {
 
  //ellipse(((int)(random(400))),((int)(random(360) + 40)),16,16);
 
  //explosion((int(random(255))),(int(random(255))));
  fill(255);
  for (int r = 0; r < cols; r++) {
    for (int s = 0; s < rows; s++) {
      // Oscillate and display each object
      grid[r][s].oscillate();
      grid[r][s].display();
    }
  }
  rect(0, 0, 400, 40);
  textFont(f,16);        
  textAlign(LEFT);
  fill(0);
  text(headlines[index],x,20);
  // Decrement x
  x = x - 2;
  // If x is less than the negative width,
  // then it is off the screen
  float w = textWidth(headlines[index]);
  ball();
  if (x < -w) {
    x = width;
    index = (index + 1) % headlines.length;
  }
}
 
 
void inAndOutCircles() {
  fill(0);
  goIn();
  goOut();
}
void goIn() {
    if(i < 301) {
      ellipseMode(CENTER);
      fill(int(random(255)), int(random(255)), int(random(255)));
      ellipse(200,200,i,i);
      iIncrement();
    }
}
void iIncrement() {
  j+=3;
  if (j < 301)
    i+=3;
  if(j>300)
    i-=3;
  if(j == 600) {
    j = 0;
    i = 0;
  }
}
void goOut(){
  if(i > 300) {
    ellipseMode(CENTER);
    fill(int(random(255)), int(random(255)), int(random(255)));
    ellipse(200,200,i,i);
    exploIncrement();
  }
}
void exploGoOut(int xLocation, int yLocation) {
  if(i > 99) {
    ellipseMode(CENTER);
    fill(int(random(255)), int(random(255)), int(random(255)));
    ellipse(xLocation,yLocation,i,i);
    exploIncrement();
  }
}
void exploGoIn(int xLocation, int yLocation) {
  if(i < 99) {
      ellipseMode(CENTER);
      fill(int(random(255)), int(random(255)), int(random(255)));
      ellipse(xLocation,yLocation,i,i);
      exploIncrement();
    }
}
void exploIncrement() {
  j+=3;
  if (j < 301)
    i+=3;
  if(j>300)
    i-=3;
}
void explosion() {
  fill(0);
  exploGoIn((int(random(400))), int(random(400)));
  //exploGoOut();
}
void ball() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  a = a + aspeed;
  b = b + bspeed;
  if((a < 0)||(a > width))
    aspeed = -aspeed;
  if((b < 40)||(b > width))
    bspeed = -bspeed;
  stroke(0);
  fill(175);
  ellipse(a,b,16,16);
  ballColorer();
}  
void ballColorer() {
  fill(0);
  ballColor();
}
void ballColor() {
  ellipseMode(CENTER);
  fill(int(random(255)), int(random(255)), int(random(255)));
  ellipse(a,b,16,16);
}
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float q,n;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness

  // Cell Constructor
  Cell(float tempQ, float tempN, float tempW, float tempH, float tempAngle) {
    q = tempQ;
    n = tempN;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  // Oscillation means increase angle
  void oscillate() {
    angle += 0.02; 
  }

  void display() {
    stroke(255);
    // Color calculated using sine wave
    fill(127+127*sin(angle),0,127+127*sin(angle));
    rect(q,n,w,h); 
  }
}
