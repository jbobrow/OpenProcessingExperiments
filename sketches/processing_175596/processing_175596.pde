
// Defining size of spatter, ink color, canvas color, 
// and the inkblot size tracker

float spattersize = 25;
color inkcolor = color(255, 153, 0);
int canvascolor = color(255); 
float inkblot;

// Setup

void setup(){
  size(1000,1000);
  background(canvascolor); 
  frameRate(500); 
}
 
 
// Draw
void draw(){
  
  // Determines speed at which cursor is moving
  
  float speed = abs(mouseX-pmouseX) + abs(mouseY-pmouseY);
  
  // If the cursor is not moving quickly, an inkblot will form.
  // Otherwise, a line with paint spatter will be drawn.
  
  if (speed < 5){
    spillInk();
    inkSpatter(inkblot);
  } else {
    drawLine(speed);
    inkSpatter(spattersize); 
    inkblot = 0;
  }
  
  // Refreshes the canvas when mouse is pressed
  
  if (mousePressed){
    background(canvascolor); 
    inkblot = 0; 
  }
  
  // Saves the frame if a key is pressed
  
  if (keyPressed){
    saveFrame("SpilledInk"+frameCount);
  }
}


// The spillInk function increases the inkblot size 
// incrementally to form increasingly large paint spatter

void spillInk(){
   inkblot = inkblot +.3;
}


// The inkSpatter function takes the size of the 
// current blot into account and randomly draws a series of 
// ellipses within a given range of the cursor

void inkSpatter(float blotsize){
  fill (inkcolor); 
  noStroke();
  float range = 10;
  float randX = random (-blotsize-range, blotsize+range);
  float randY = random (-blotsize-range, blotsize+range);
  float radius = random (1, blotsize/2); 
  ellipse(mouseX+randX, mouseY+randY, radius, radius);
}

// The drawLine function draws a continuous line
// when the cursor is moved. The faster the mouse 
// is moving, the thinner the line. 

void drawLine(float mouseSpeed){
  stroke(inkcolor);
  strokeWeight(100/mouseSpeed); 
  line(pmouseX, pmouseY, mouseX, mouseY);
}


