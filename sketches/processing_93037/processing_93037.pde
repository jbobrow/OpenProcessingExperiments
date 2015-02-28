
void setup() {
  size(200, 200);
  noStroke();
}

void draw() {
  background(204);
  
  
  
  float  x1 = map(mouseX, 0, width, 90, 110);
   fill (255,0,0);
  ellipse(x1, mouseY, 50, 50); 
 
 
  
  
}
