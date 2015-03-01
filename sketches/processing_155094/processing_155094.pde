
void setup(){
  // Set the size of the window
  size(200,200);
}
void draw() {
  // Draw a white background
  background(255);
  
  // Set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  // Draw Zoog's body
  stroke(0);
  fill(150);
  rect(mouseX, mouseY, 20, 100);
  
  // Draw Zoog's head
  stroke(0);
  fill(255);
  ellipse(mouseX, mouseY - 30, 60, 60);
  
  // Draw Zoog's eyes
  fill(0);
  ellipse(mouseX - 19, mouseY - 30, 16, 32);
  ellipse(mouseX + 19, mouseY - 30, 16, 32);
  
  // Draw Zoog's legs
  stroke(0);
  line(mouseX - 10, mouseY + 50, 80, 160);
  line(mouseX + 10, mouseY + 50, 120, 160);
  
  // Draw Zoog's arms
  line(mouseX - 10, mouseY + 10, 80, 120);
  line(mouseX + 10, mouseY + 10, 120, 120);
}
