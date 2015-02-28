
PImage img; 
int increment = 2; 

void setup() {
  size(700, 500);
  img = loadImage("beej.jpg");
  image(img, 0, 0, width, height);
  loadPixels();
  for (int x = 0; x < ((width*height)-(increment+2)); x+=increment) {
    quicksort(pixels, x, x+increment);
  }
  updatePixels();
  glitcher(); 
}
 
void draw() {
}
 
void glitchIt(int jump) {
  image(img, 0, 0, 700, 500);
  loadPixels();
  for (int x = 0; x < ((width*height)-(jump+1)); x+=jump) {
    quicksort(pixels, x, x+jump);
  }
  updatePixels();
}
 
void glitcher() {
  float x = 684;
  float y = 179;
  int val1 = int((sqrt(x*y))*2);
  glitchIt(val1);
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


