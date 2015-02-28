
float xPos = 0; 
float xSpeed = 2; 

void setup() { 
  size(800,600);
}

void draw() { 
  // clear the background to black (0) 
  background(0);
  // set the fill colour to red
  fill(255,0,0); 
  
  // draw a circle that is 50 pixels wide and 50 pixels high
  ellipse(xPos, 300, 50, 50);   
  
  // add the speed to the position
  xPos = xPos + xSpeed;
 
  // if we get to the right hand side, reverse the speed
  if(xPos>width) {
    xSpeed = -xSpeed;     
  }
  
}
