
PImage img;
int increment=2;

void setup() {
  size(800, 600);
  img = loadImage("cookiemonster.png");
  image(img, 0, 0, width, height);
  loadPixels();
  for (int x = 0; x < ((width*height)-(increment+2)); x+=increment) {
    quickSort(pixels, x, x+increment);
  }
  updatePixels();
}

void draw() {
}

void glitch(int jump) {
  image(img, 0, 0, width, height);
  loadPixels();
  for (int x = 0; x < ((width*height)-(jump+1)); x+=jump) {
    quickSort(pixels, x, x+jump);
  }

  updatePixels();
}

void mousePressed() {
  float x = mouseX;
  float y = mouseY;
  int val1 = int((sqrt(x*y)));
  glitch(val1);
}

void keyPressed() {
  if (key == 'n' || key == 'N') {
    int val2 = 1;
    glitch(val2);
  }
}


// Took the majority of the processing quickSort implementation from 
// this sketch here http://www.openprocessing.org/sketch/81405 
int partition(int[] arr, int left, int right)
{
  int i = left, j = right;
  int tmp;
  int pivot = arr[(left + right) / 2];
  //adjust the array from left to right by pivot
  while (i <= j) {
    //find the first value >= pivot in the left
    while (arr[i] < pivot)
      i++;
    //find the first value <= pivot in the right
    while (arr[j] > pivot)
      j--;
    //swap the value
    if (i <= j) {
      tmp = arr[i];
      arr[i] = arr[j];
      arr[j] = tmp;
      i++;
      j--;
    }
  };

  return i;
}


// quick sort procedure
void quickSort(int[] arr, int left, int right) {
  //find partition index
  int  index = partition(arr, left, right);
  //quicksort the array from left to index-1
  if (left < index - 1) {
    quickSort(arr, left, index - 1);
  }
  //quicksort the array from index to right
  if (index < right) {
    quickSort(arr, index, right);
  }
}



