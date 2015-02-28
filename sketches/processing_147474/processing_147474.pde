
/* 
Super simple draw app tutorial (digital dinner napkin).
Created by R.A. Robertson for @P5Austin Processing-Austin meetup group, 2014.05.07.
*/

void setup() {
  size(600, 600);
  background(255);
//  strokeWeight(10);            // Use this to set a consistent line thickness. *
//  strokeCap(SQUARE);           // Change line terminus here (ROUND (default), SQUARE, PROJECT).
}

void draw() {
  stroke(0, 155);                 // Play with alpha value for watercolor effect.
    if (mousePressed) {
      strokeWeight(10 / dist(mouseX, mouseY, pmouseX, pmouseY));  // * Or use something like this.
      line(mouseX, mouseY, pmouseX, pmouseY);                     // Main business draw tool.
//      line(mouseX, mouseY, pmouseX - random(-10, 10), pmouseY - random(-10, 10));  // More fun...
//      ellipse(mouseX, mouseY, mouseX / 4, mouseY / 4);  // One more of endless possibilities.
    }
}

void keyPressed() {
  if (key == ' ') background(255);  // Press space bar to refresh canvas.
}
