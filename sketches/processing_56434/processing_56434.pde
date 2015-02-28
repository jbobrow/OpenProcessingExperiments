
void setup() {
  size(800, 800);
  smooth();
  background(255);
  frameRate(25);
  
}

void draw() {
  if (mousePressed == true) {
  
  fill(0, random(120), random(120), 20);
    triangle(mouseX, mouseY, dist (pmouseX, pmouseY, mouseX, mouseY), dist (pmouseX, pmouseY, mouseX, mouseY), pmouseY, pmouseX);
    
    
  triangle(pmouseX, mouseY, pmouseY, pmouseX, pmouseY, pmouseX);
  fill(120, random(255), random(255), 100);
  stroke(234,255,0);
    
  }
 
  float abstand = dist (pmouseX, pmouseY, mouseX, mouseY);
 
  if (abstand > 50) {
    abstand = 20;
  }
  
 
 
  triangle(pmouseX, pmouseY, pmouseY, pmouseX, pmouseY, pmouseX);
  fill(0, random(255), random(255), 260);
  stroke(0,0,0);
}
 

