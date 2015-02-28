
int[] data;
int low;
int high;
int middle;
int target;
int randome;

void setup() {
  size(600, 600);
  background(0, 0, 0);
  data = new int[60];
  for (int i = 0; i < data.length; i++) {
    data[i] = i;
  }
  low = 0;
  high = data.length -1;
  middle = (high+low)/2;
  randome = (int) random(0, 60);
  target = randome;
  noStroke();
}

void draw() {
  if (high >= low) {
      background(0,0,0);
      fill(255, 255, 255);
      text("Searching for element " + target, 230, 200);

    middle = (high+low)/2;
    if (data[middle] == target) {
      fill(0, 255, 0);
      ellipse(10*middle, 300, 3, 3);
      fill(255, 255, 255);
    }
    if (data[middle] < target) {
      low = middle + 1;
    }
    if (data[middle] > target) {
      high = middle - 1;
    }
  }
  for (int i = 0; i < data.length; i++) {
    if (low <= i && i <= high) {
      fill(255, 0, 0,100);
    } 
    else {
      fill(255, 255, 255,100);
    }
    ellipse(10*i, 300, 3, 3);
  }
  for(int k = 0; k < 1000000000; k++){
    k++;
    k--;
  }
}


