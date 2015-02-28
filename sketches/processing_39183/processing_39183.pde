
// Allison Etheredge
// Lecture 5.1
// September 25, 2011 

// Simple practice of a nested heart function 
// Created with a helper function assigning a random color at 90% opacity



void setup() {
  size(400, 400);
  background(0);
}

void draw() {
}

void mousePressed() { 
  background(255);
  randomColor(); // Use of Helper Function to assign color variation (below) 
  for (int i = 0; i < width; i += 50) {
    for (int j = 0; j < height; j += 50) {
      heart(i, j); // Use of Heart Function (below)
    }
  }
}




//......"end of code" - Assign Function and Helper Function (below): 

// Assign Helper Function for random color

void randomColor() { 
  fill(random(255), random(255), random(255), 90);
}


// Assign Heart Function to facilitate the drawing of a repeated shape
// Researched "bezierVertex" in order to create the arcs defining a heart

void heart(float x, float y) { 
  pushMatrix(); 
  translate(x-25, y+8); // Center of Heart follows grid
  smooth();
  noStroke();
  //fill(255, 0, 0);
  beginShape();
  // Defines the right side of the heart - bezierVertex(cx1, cy1, cx2, cy2, x, y); 
  vertex(50, 15); 
  bezierVertex(50, 0, 70, 10, 50, 25); // cx1 and x stay constant with the x vertex
  // Defines the left side of the heart - bezierVertex(cx1, cy1, cx2, cy2, x, y);
  vertex(50, 15);   
  bezierVertex(50, 0, 30, 10, 50, 25); // cx1 and x stay constant with the x vertex
  endShape();
  popMatrix();
}

