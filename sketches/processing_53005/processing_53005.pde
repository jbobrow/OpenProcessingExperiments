
PImage img;


void setup() {
  size(600, 400);
  img = loadImage("asianMan1.png");
  image(img, 0, 0, width, height);
  loadPixels();
}

void draw() {
   for (int y=1; y<height; y++) {
      for (int x=0; x<width; x++) {
         if (random(1000) > 950) {
            int j = int(random(1000));
                 if (j < 250) set(x, y, get(x, y-1));
            else if (j < 500) set(x, y, get(x, y+1));
            else if (j < 750) set(x, y, get(x-1, y));
            else              set(x, y, get(x+1, y));
         }
      }
   }
}

void mouseMoved() {
  image(img, 0, 0, width, height);
  loadPixels();
  int loc = int(mouseX*mouseY);
  quicksort(pixels, 0, loc);
  updatePixels();
}

int partition(int x[], int left, int right) {
  int i = left;
  int j = right;
  int temp;
  int pivot = x[(left+right)/2];
  while (i <= j) {
    while (x[i] < pivot) {
      i++;
    }
    while (x[j] > pivot) {
      j--;
    }
    if (i <= j) {
      temp = x[i];
      x[i] = x[j];
      x[j] = temp;
      i++;
      j--;
    }
  }
  return i;
}

void quicksort(int x[], int left, int right) {
  int index = partition(x, left, right);
  if (left < index - 1) {
    quicksort(x, left, index-1);
  }
  if (index < right) {
    quicksort(x, index, right);
  }
}


