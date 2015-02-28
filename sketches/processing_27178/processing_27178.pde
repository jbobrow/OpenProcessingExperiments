
// Playing with bezier curves
// f to toggle fill
// click mouse to clear screen
 
  color bgColor = color(255);
  boolean f = false;
 
void setup() {
  size(400,400);
  background(bgColor);
  smooth();
  noFill();
}
  
void draw() {
  bezier(0,0, mouseX, mouseY, mouseX, mouseY, 400, 400);
}
  
void mousePressed() {
  background(bgColor);  // clear screen
}
 
void keyPressed() {
  f = !f;  // toggle f
  if (f){
    fill(255,255,0);  // fill with Yellow
  }
  else {
    noFill();
  }
 }
  
