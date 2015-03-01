
int num = 60;
int[] x = new int[num];
int[] y = new int[num];
PImage img;

void setup() {
  size(800, 600);  // the size of my window
  smooth();   // this makes everything smooth
  img = loadImage("batman.jpg");
  noStroke();
}

void draw() {
  background(0);   // this make a black background
  // Copy array values from back to front
  for (int i = x.length-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  x[0] = mouseX; // Set the first element
  y[0] = mouseY; // Set the first element
  for (int i = 0; i < x.length; i++) {
    image(img, x[i]-20, y[i]-30, 50, 60);
  }
}



