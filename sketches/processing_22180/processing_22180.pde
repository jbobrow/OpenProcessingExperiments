
// The same silly example, but this time we are using an Array 
// to store our variables.

// This version takes advantage of loops to automate 
// traversing the array..

float x[] = new float[15]; // this creates an array of 15 floats, more than we had!

void setup() {
  size(300, 300);
  fill(0, 100, 255, 100);
  smooth();
  
  // "i" will count from 0 to 14, allowing us to access each individual
  // variable in our array using a single loop!
  for (int i=0; i < 15; i++) {
    x[i] = random(width);
  }
}

void draw() {
  background(255);
  float dia;

  for (int i=0; i < 15; i++) {
    // we can use a similar loop here to draw the ellipses
    // using each variable in the array
    dia = dist(x[i], 150, mouseX, mouseY);
    ellipse(x[i], 150, dia, dia);
  }
}

