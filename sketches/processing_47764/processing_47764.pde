
// variables to for position and size of rectangle
int x = 50; 
int y = 50; 
int w = 100; 
int h = 75; 


void setup() {
  size(400,400);
  
}

void draw() { 
  
  // black background
  background(0); 
  // white stroke
  stroke(255); 
  
  // if our mouseX and mouseY are within the bounds of the
  // rectangle, then... 
  if( mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h ) {
    
    // set the fill colour to black
    fill(0);
    
  } else {
    
    // otherwise set it to grey
    fill(127); 
  }
  
  // draw the rectangle
  rect(x,y,w,h);
  
}               
