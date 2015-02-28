
// Created by Jasmine Li
// Arch 6509 Beyond Measurement: Generative Modeling in Architecture and Urbanism
// Department of Architecture, AAP, Cornell

void setup() { 
  // Defines document.
  size(600, 600);
  background(0);

  // Defines animation speed.
  frameRate(4); 

  // Defines stroke.
  smooth();
} 

void draw() { 

  for (
  int n = 0;
  n <= width;
  n += 100) {

    // Randomizes variables.

    float var = random(0, width);
    float varx = random(0, 10);

    if (n > 0 || n < width) {

      // Draws threads.

      stroke(60);
      strokeWeight(0);
      line (var, n, mouseX, mouseY);

      // Draws rectangles.

      stroke(255);
      strokeWeight(0);
      noFill();
      rectMode(CENTER);
      rect(mouseX, mouseY, varx, varx);
    }

    if (n == 300) {

      // Erases threads.

      stroke(0);
      strokeWeight(0);
      line (var, n, mouseX, mouseY);
    }
  }
}

void mousePressed ( ) {
  background(0);
  redraw();
}


