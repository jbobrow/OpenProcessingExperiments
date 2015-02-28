
// Mouse trails
// Adapted from Fry and Reas, Processing p. 307

int digit = 50; // number of square
int[] x = new int[digit];
int[] y = new int[digit];

void setup() {
  size(300, 300);
  noFill();
  smooth();
  stroke(random(width), 50,random(width));
}

void draw() {
  background(30);

  // shift everything in the array forward one index
  // the last index in the array is "popped" out
  for (int i = digit-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }

  // add the current mouse position to the start of the array
  x[0] = mouseX;
  y[0] = mouseY;

  // draw ellipses using the data from the array
  // size is determined by the index in the array
  for (int i = 0; i < digit; i++) {
    rect(x[i], y[i], i/3.0, i/1.0);
     stroke(random(width), 70,random(width));
     rect(y[i], x[i], i/3.0, i/1.0);
  }
   
}


