
// second in-class exercise
// schien@mail.ncku.edu.tw
// drawlines when mouse pressed

void setup() {
  size(400, 400);
  //stroke(255);
  smooth();
  strokeWeight(0.3);
  background(92);
} 


void draw() {
  stroke(mouseY, mouseX, 100);
  // demonstrate conditions 1
  if (mousePressed == true) {
    line(25, 25, mouseX, mouseY);
    line(mouseX, mouseY, 375, 25);
  }
  
  if (keyPressed == true) {
    saveFrame("output-####.png");
  }
}







