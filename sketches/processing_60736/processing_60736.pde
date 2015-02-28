
//Diana Chen
//cdiana@cmu.edu

void setup() {
  size(500,500);
  background(#ffffff);
  frameRate(120);
}

void draw() {
  
 stroke(0);
 strokeWeight(5);
 smooth();

 if (mousePressed) { 
   stroke(random(height), random(width), 220, 200); // Drag your mouse to draw in random colors
   line(pmouseX, pmouseY, mouseX, mouseY); // draw line from initial position to last
 } 
 
}

  void keyPressed() { // press a key to clear the screen
  background(#ffffff);
  
}

