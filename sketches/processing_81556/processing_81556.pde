
// Example 02-02 from "Getting Started with Processing"
// by Reas & Fry. O'Reilly / Make 2010

PImage img;

void setup() {
  img = loadImage("in4.jpg");
  size(650, 510);
  image(img,0,0);
  smooth();
 
}
void draw() {
  line(mouseX, mouseY, 325, 0);
  stroke(255,10);
  strokeWeight(25);
}

void mousePressed() {
  image(img,0,0);
}


