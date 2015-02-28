
//Michael Tristan Importico
//Homework 3 - User Input With Mouse
//© 2013 by Michael Tristan Importico. All rights reserved

void setup () {
  size(600, 600);
  background (200);
}

void draw() {
  
  for (int i=0; i<20; i++) {
    float rx = random(0, width);
    float ry = random(0, height);
    line (mouseX, mouseY, rx, ry);
    fill(mouseX*random(0.9, 1.1), mouseY*random(0.9, 1.1), random(0, 255), random(100, 200));
    ellipse (rx, ry, random(20, 60), random(20, 60));
   
    if (mousePressed) {
    //  saveFrame("line-######.jpg");
    }
  }
}
