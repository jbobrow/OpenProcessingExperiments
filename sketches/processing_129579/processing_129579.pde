
// The x-location of pac-man
float pacX = -50;

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
  fill(random(255));
  rect(0, 0, width, height);
  
  // Draw the yellow circle
    noStroke();
  fill(random(255), random(255), random(255));
  ellipse(pacX, height/2, 50, 50);
  
  // Draw a black wedge representing his mouth
  fill(0); // black

  arc(pacX, height/2, 50, 50, 
      abs(sin(pacX/width * 24 * PI)) * (-PI/10), 
      abs(sin(pacX/width * 24 * PI)) * (PI/10) );
  
  // Update pac man's location
  pacX = (pacX + 2);
  if (pacX > width + 25)
    pacX = -25;
    
  // Put some food on the screen for pacman
  strokeWeight(5); 
  stroke(random(255),random(255),random(255)); // white 
  for (int i = 15; i <= width; i+= 15) {
    if (i > pacX + 3) 
    point(i, height/2);
  } 
    
}
