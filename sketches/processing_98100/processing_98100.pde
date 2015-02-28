
int[] coords = new int[100];
int counter = 1;
int current = 1;
int temp = 0;

void setup() {
  size(500,500);
  background(0, 0, 0);
  frameRate(4);
  fill(255, 255, 255);
  for(int i = 0; i < 100; i++) {
    coords[i] = (int) random(0,500);
  }
}

void draw() {
  background(0,0,0);
  for(int i = 0; i < 100; i++) {
    rect(5*i, 500-coords[i], 5, coords[i]);
  }
  if (counter < 100) {
    while(current != 0 && coords[current] < coords[current - 1]) {
      temp = coords[current];
      coords[current] = coords[current-1];
      coords[current-1] = temp;
      current = current - 1;
      background(0,0,0);
      for(int i = 0; i < 100; i++) {
        fill(255, 255, 255);
        if(i > counter) {
          fill(255, 255, 0);
        }
        rect(5*i, 500-coords[i], 5, coords[i]);
        fill(255, 0, 0);
        rect(5*current, 500-coords[current], 5, coords[current]);
        fill(255, 255, 255);
      }
      if (counter < 99) {
        fill(255, 0, 0);
        rect(5*counter+1, 500-coords[counter+1], 5, coords[counter+1]);
        fill(255, 255, 255);
      }
    }
  }
  counter++;
  current = counter;
}


