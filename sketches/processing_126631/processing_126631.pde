
// Pressing Control-R will render this sketch.
int i = 0;

//define variables
int canvasHeight = 400;
int canvasWidth = 800;

//sub blocks
//int numdBlocks = 32;
//int blockHeight = 100;
//int blockWidth = 100;


int prevX = 0;
int prevY = 0;
int currX = 0;
int currY = 0;

void setup() {  // this is run once.  
     
    // set the background color
    background(255);
     
    // canvas size (Variable aren't evaluated. Integers only, please.)
    size(800, 400);
       
    // smooth edges
    smooth();
    

    // limit the number of frames per second
    frameRate(30);     
}
void draw() {  // this is run repeatedly. 

  noFill();
  
    currX = (int)prevX+(int)random(2);
    currY = (int)prevY+(int)random(2);
    
    stroke(random(255), random(255), random(255));
    line(prevX, prevY, currX, currY);
         
    prevX = currX;
    prevY = currY;

    if(prevX > canvasWidth)
      prevX = 0;

    if(prevY > canvasHeight)
      prevY = 0;

}

