
void setup() { 
  size(400,400); 
  smooth(); 
}

void draw() { 
  
  background(127); 
  
  // map the mouse x and y position on to a smaller
  // range of values 
  float x = map(mouseX, 0, width, 150, 250);
  float y = map(mouseY, 0, height, 180, 220);  
  ellipse(x, y, 40,40); 
  
}               
