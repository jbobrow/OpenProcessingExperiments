
void setup() {
  size(1905, 1005);
  smooth(); 
  
  background(65);

}


void draw() {
  
  
  
  if (mousePressed) {
    stroke(255);
    strokeWeight(3);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
 
 
 noStroke();
 
 fill(0,2);
  rect(0, 0, width, height);

  
}
