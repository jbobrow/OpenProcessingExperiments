
// Lecture 2.2.1 
// Allison Etheredge
// 4 September 2011

void setup() {
  size(300, 300);
  colorMode(HSB, width);
}

// Mouse Dragged shows four changing ellipse
// Ellipse changes shape upon dragging the mouse around the space
void mouseDragged() {
  fill(255, 90); // 90% transparancy 
  ellipse(width, height/2, mouseX, mouseY);
  ellipse(0, height/2, mouseX, mouseY);
  ellipse(width/2, 0, mouseY, mouseX);
  ellipse(width/2, height, mouseY, mouseX);
}

// Changing variable changes the starting position of the line
float x = 0; 

void draw() {
  background(150); 

  // White diagonal line
  // Moves across screen and follows circle
  stroke(255); 
  strokeWeight(5); 
  line(x, x, mouseY, mouseX);
  line(width, height, mouseY, mouseX);

  // Color changing circle moves as you move the mouse
  noStroke();
  fill(mouseX, mouseX, mouseX);
  rect(mouseY, mouseX, mouseY, mouseX);
} 


