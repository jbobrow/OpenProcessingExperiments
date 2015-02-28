
void setup() {
  size(500,400);
  smooth();
}
 
void draw() {
   
  background(127);
   

  float x = map(mouseX, 0, width, 150, 250);
  float y = map(mouseY, 0, height, 180, 220); 
  ellipse(x, y, 40,40);
  
   
}
