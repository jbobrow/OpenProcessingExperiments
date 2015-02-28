
boolean moving = false;

// Circle starts here
int circleX = 0; 
int circleY = 100; 

void setup() { 
  size(200, 200); 
  smooth();
} 
void draw() { 
  background(100); 
  
  // Circle
  stroke(255); 
  fill(0); 
  ellipse(circleX, circleY, 50, 50); 
  
  if (moving) {
    circleX = circleX + 1;
  }
} 

// Circle starts to move when mouse clicked, i.e. "moving" = true
void mousePressed() { 
  moving = true;
} 


