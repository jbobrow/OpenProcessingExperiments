
void setup() {
  size(200, 200);
  smooth();
}

void draw() {
  background(255);
  
  ellipseMode(CENTER);
  rectMode(CENTER); 
  
  // Draw Zoog's body
  stroke(0);
  fill(175);
  // Zoog's body is drawn at the location (mouseX, mouseY).
  rect(mouseX, mouseY, 20, 100);

  // Draw Zoog's head
  stroke(0);
  fill(255);
  // Zoog's head is drawn above the body at the location (mouseX, mouseY - 30).
  ellipse(mouseX, mouseY-30, 60, 60); 
  
  //Draw Zoog's eyes
  fill(0);
  ellipse(mouseX-19, mouseY-30, 16, 32);
  ellipse(mouseX+19, mouseY-30, 16, 32);
  
  //Draw Zoog's legs
  stroke(0);
  line(mouseX-10, mouseY+50, mouseX-20, mouseY+60);
  line(mouseX+10, mouseY+50, mouseX+20, mouseY+60);
  
}

