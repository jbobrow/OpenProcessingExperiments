
// The x-location of pac-man
float pacX = 650;

// Black screen
void setup() {
  size(600, 300);
  smooth();
}

// Move pac-man left-to right, and let
// him tunnel around from the right
// back to the beginning
void draw() {
  stroke(0); // black
  fill(0);
  rect(0, 0, width, height);
  
  // Draw the yellow circle
  fill(255, 255, 0);
  ellipse(pacX, height/2, 50, 50);
  
  // Draw a black wedge representing his mouth
  fill(0); // black
  arc(pacX, height/2, 50, 50, 
      abs(sin(pacX/width * 24 * PI)) * (-PI/5), 
      abs(sin(pacX/width * 24 * PI)) * (PI/5) );
  
  // Update pac man's location
  pacX = (pacX - 2);
  if (pacX > width - 25)
    pacX = 650;
    
  // Put some food on the screen for pacman
  strokeWeight(5); 
  stroke(255); // white 
  for (int i = 15; i <= width; i+= 15) {
    if (i > pacX + 3) 
    point(i, height/2);
  } 
    
}
