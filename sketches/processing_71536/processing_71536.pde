


// Generative pattern



// Declare and initialize two float variables
float circleX = 0;
float circleY = 0;


void setup() {
  size(400,400);
  smooth();
  background(255);
}

void draw() {
  
  stroke(0);
  fill(255, 255, 255, 0); // alpha transparent
  

  ellipse(circleX, circleY, 60, 60);
 
  // This will make the to the right on the next pass --
  // each move will increase from 0 to 30 pixels to the right
  circleX = circleX + (frameCount % 30); 
  //Keep it in range
  circleX = circleX % width;
  
  // Move circle down + keep it in range
  circleY = circleY + 0.5;
  circleY = circleY % width;
  
 
}

