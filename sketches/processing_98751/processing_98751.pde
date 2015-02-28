
boolean going = false;

int circleX = 0; 
int circleY = 100; 

void setup() { 
  size(200,200); 
  smooth();
} 
void draw() { 
  background(255); 
  stroke(0); 
  fill(175); 
  ellipse(circleX,circleY,50,50); 
  if (going) {
    circleX = circleX + 1;
  }
} 

void mousePressed() { 
  going = true;
} 


