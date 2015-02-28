
float y;

void setup() {
  size(640, 360);  
  stroke(255);     
  y = height/2;
}

void draw() { 
  background(200);   
  y = y - 1; 
  if (y < 0) { 
    y = height/2; 
  } 
  rectMode(CORNERS);
  rect(0, 180, width, y);  
}

