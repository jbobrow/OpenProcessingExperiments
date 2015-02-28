
// declare a size for the array and use it
// to create 2 new arrays
int arraySize = 10;
int[] x = new int[arraySize];
int[] y = new int[arraySize];

// arrays now look like this
// x = {0, 0, 0, ...}
// y = {0, 0, 0, ...}

void setup() {
  size(800, 600);
  for (int i = 0; i < arraySize; i++) {
    x[i] = int(random(100, 200));
    y[i] = int(random(100, 200));
  }
}

// arrays now look like this
// x = {134, 145, 175, ...}
// y = {181, 112, 184, ...}

void draw() {
  background(255);
  for (int i = 0; i < arraySize; i++) {
    x[i] = x[i] + int(random(-5, 5));
    y[i] = y[i] + int(random(-5, 5));
    rect(x[i], y[i], 30, 30);
  }
}
