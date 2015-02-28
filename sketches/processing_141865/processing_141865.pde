
/////////////////////////////////////////
//////////CHELSEA PATTEE/////////////////
/////////////////////////////////////////

//my start number is 10500

// Skeleton file for dome animations

// The following declarations/instantiations are needed for the skeletob
// counter is needed to count to 300 images produced
int counter = 0;
// your filename start number (this to be assigned)
int startNumber = 10500; // THIS IS THE VALUE TO EDIT with your assigned start number for file names
// the size of the screen and output images
int screenDimension = 640; // width *and* height (THIS IS THE VALUE TO EDIT FOR IMAGE/SCREEN size)
int w = screenDimension; // width
int h = screenDimension; // height
// This one may be useful!
// note that this is the center for a dome screen
int centerX = w/2;
int domeCenterY = int(h * .75); // dome center!

/////////// And you will need your "own" variables for your
/////////// Animation. 
// just using x and y here to maintain the drawing coordinates
// you may use another approach
int x = centerX;
int y = domeCenterY;

// 2D array of objects
Cell[][]grid;
PImage[]images = new PImage[21];
PImage img = new PImage();
int p;

//number of columns and rows in grid
int cols = 10;
int rows = 6;

float r = 0.001;
float theta1 = -5.0;
//float  = 5.0 //value for changing stroke

void setup(){
 // { 
  size(640,640,P3D);
  lights();
    for (int i = 0; i < images.length; i ++)
    {
      images[i] = loadImage( i +".jpg");
      images[i].resize(640,640);
    }

  grid = new Cell[cols][rows];
    for (int i = 0; i < cols; i++) 
    {
      for (int j = 0; j <rows; j++)
      {
      //initialize each new object
      grid[i][j] = new Cell(i*30, j*30, 30, 30, i+j);
      }
    }
   // background(images[0]);
   // scale(.04);
}

void draw() {
  /////////// You do drawing things - whatever that is between HERE
  stroke(0); //stroke for rect  
  //stroke(10); // stroke for sphere
  //noFill();
  // sphere(280);
 // fill(175, 10); 

  // Translate to center of window   
  translate(width/2,height/2); 
  
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
 for(int count = 0;count<21;count ++)
    {
     p=int(random(21));
     image(images[p],0,0);
     //scale(tan(r));
     //scale(r);
      scale(r*.005);
     //scale(.004);
      pushMatrix();
      scale(r*.005);
      translate(width/2,height/2);
      popMatrix();
     }
}
  
// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = (tempW)+1;
    h = tempH;
    angle = tempAngle;
  } 
  
  // Oscillation means increase angle
  void oscillate() {
    angle += 0.01; //increases speed of tiling
  }

  void display() {
    stroke(350); //change to 400, becomes an 'eye'(watching, surveillance, self-regulating system..)
    // Color of end pixels calculated using tan wave
    fill(20+15*tan(angle), 20+15*tan(angle), 20+15*tan(angle), 10);
    //fill(10+5*sin(angle), 10+5*sin(angle), 10+5*tan(angle), 5);
    //fill(10+3*cos(angle), 10+3*cos(angle), 10+3*cos(angle), 5);
    
    //sphere in center
    //sphere(x);
    
    //rect in center
    rect(x,y,w,h);  
 
    rotateZ(theta1*2); 
    
  // Increase the scale variable 
  r += 0.005; //use for showing as animation
 //   r += 0.01;  //use for dome 10 sec export  
  // r += 0.002;
  theta1 += 0.05;
  
  }// new in
  /////////// and HERE
  
  // save the image file - easy! and you might comment this out
  // for better testing performance because writing the image
  // to a file takes a lot of time
//  String nameStr = counter + startNumber + "";
//  while (nameStr.length() < 5) { 
//    // think about this... what does it do?
//    nameStr = "0" + nameStr;
//  }
//  save(nameStr + ".png"); 
//  // actually writes the screen to a file
//  
//  // exit if greater than the assigned range (yes it says 299 below... why do you think?)
//  if ((startNumber + counter) >= (startNumber + 299)) { 
//    exit();
//  } else {
//    counter++;
//  }
//} //new out
}
// just some end notes, sections are assigned these ranges
// section A01 000000-006599 (for example 000000.png to 000299.png, 000300-000599, etc)
// section A02 06600-013199
// section A03 013200-019799
// section A04 019800-026399
// section A05 026400-032999
// section A06 033000-039599
// for more info on dome production: http://spacetheater.wordpress.com/introduction-to-fulldome-attention-nweamo-producers/



