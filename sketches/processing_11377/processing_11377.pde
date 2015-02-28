
// Colorful Bugs
// Based on Example 09-02 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

// JitterBug class extended to include fillColor as a parameter
// Array of bugs added 

JitterBug bug[] = new JitterBug[30];

void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  background(100,0,0);  // black
  noStroke();
  smooth();
  for (int i = 0; i < bug.length; i++ ) {
      // Create a collection of bugs at the centre of the scrren with random colours
      bug[i] = new JitterBug(width/2 + int(random(-30, 30)), height/2 + int(random(-30, 30)), 
      3, int(random(100)));
  }
}

void draw() {
  for (int i = 0; i < bug.length; i++ ) {
     bug[i].move();
     bug[i].display();
  }
} 





