
void setup() { 
  size(500, 500); 
  background(#445566); 
} 
 
void draw() { 
  stroke(#FF1122); 
  if(mousePressed) { 
    ellipse(mouseY, mouseX, 5, 5); 
    rect(mouseX, mouseY, 10,10); 
    fill (150, 100, 80, 50); 
    smooth(); 
  } 
} 


