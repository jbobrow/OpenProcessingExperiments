
// Example 02-02 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

void setup() {
  size(500, 500);
  smooth();

background(255, 300, 0);
}
void draw() {
  if (mousePressed) {
    fill(37,255,50);
  } else {
    fill(25,433,455);
  }
  line(mouseX, 0, 0, mouseY);
 
}


