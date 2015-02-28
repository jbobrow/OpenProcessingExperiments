
int[] coords = new int[100];
int counter = 0;
int lowest = 999;
int minPos = -1;
int temp = 0;

void setup() {
  size(500,500);
  background(0, 0, 0);
  fill(255, 255, 255);
  frameRate(4);
  for(int i = 0; i < 100; i++) {
    coords[i] = (int) random(0,500);
  }
}

void draw() {
  background(0,0,0);
  fill(255, 255, 255);
  for(int i = 0; i < 100; i++) {
    rect(5*i, 500-coords[i], 5, coords[i]);
  }
  if (counter < 100) {
    for(int i = counter; i < 100; i++) {
      fill(255, 0, 0);
      rect(5*counter, 500-coords[counter], 5, coords[counter]);
      fill(255, 255, 0);
      rect(5*i, 500-coords[i], 5, coords[i]);
      fill(255, 255, 255);
      if(coords[i] < lowest) {
        fill(255, 255, 0);
        rect(5*i, 500-coords[i], 5, coords[i]);
        fill(255, 255, 255);
        lowest = coords[i];
        minPos = i;
      }
    }
    if (counter < 99) {
      fill(255, 0, 0);
      rect(5*counter, 500-coords[counter], 5, coords[counter]);
      fill(255, 255, 255);
      temp = coords[counter];
      coords[counter] = lowest;
      coords[minPos] = temp;
      counter++;
    }
  }
  lowest = 999;
  minPos = -1;
}


