
// Pressing Control-R will render this sketch.
int i = 0; 
//define variables
int canvasHeight = 600;
int canvasWidth = 300;
//autodraw parameters
int masterCount = 10;
int count = 0;
//point prev(0,0);
int prevX = 0;
int prevY = 0;
int currX = 0;
int currY = 0;
void setup() {  // this is run once.   
    
    // set the background color
    background(255);
    
    // canvas size (Variable aren't evaluated. Integers only, please.)
    size(300, 600); 
      
    // smooth edges
    smooth();
    
    //randomize parameters
    //prev = (random(0, masterCount), random(0, masterCount));
    prevX = random(0, canvasWidth);
    prevY = random(0, canvasHeight);
    
    // limit the number of frames per second
    frameRate(5);
    
    // set the width of the line. 
    strokeWeight(12);
} 
void draw() {  // this is run repeatedly.  
 
   if(count == masterCount)
    {
        count = 0;
        background(random(255));
    }
    count++;
 
    // set the color
    stroke(random(255), random(255), random(255), 100);
    
    currX = random(0, canvasWidth);
    currY = random(0, canvasHeight);
    
    // draw the line
    line(prevX, prevY, currX, currY);
    
    prevX = currX;
    prevY = currY;
    
    
    //if(
    // move over a pixel
    /*if (i < width) {
        i++;
    } else {
        i = 0; 
    }*/
}
