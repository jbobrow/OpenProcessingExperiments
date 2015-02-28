
// Example 04-01 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010
void setup() {
size(500,500);
smooth();
background(0);
}
void draw() {
  stroke(pmouseX,20,pmouseY,50);
if (mousePressed) {
fill(0);
} else {
fill(255);
}
strokeWeight(10);

int d = 50;
ellipse(mouseY,mouseX,90,d);   // Left
ellipse(mouseX, mouseY, d, 90);  // Right
}


