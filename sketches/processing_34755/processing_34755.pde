




import processing.opengl.*;
void setup(){
  size(600, 600); 
  background(0); 
  smooth(); 
 
}

void draw(){
  noFill(); 
  stroke(255); 
  background(0); 
  bezier(0, 0, mouseX, mouseY, mouseY, mouseX, 600, 600); 
  fill(255); 
  ellipse(0, 0, 20, 20); 
  fill(100); 
  ellipse(mouseX, mouseY, 10, 10); 
  ellipse(mouseY, mouseX, 10, 10); 
  fill(255); 
  ellipse(600, 600, 20, 20); 
  stroke(0, 255, 0); 
  line(0, 0, mouseX, mouseY); 
  line(mouseY, mouseX, 600, 600); 
  
}

