
void setup() {
  size(600, 600);
  background(255);
          
}
 
void draw() {
  stroke(0, 200);                 
    if (mousePressed) {
      strokeWeight(10 / dist(mouseX, mouseY, pmouseX, pmouseY));  
      line(mouseX, mouseY, pmouseX, pmouseY);    
    }
}
 
void keyPressed() {
  if (key == ' ') background(255);  
}

