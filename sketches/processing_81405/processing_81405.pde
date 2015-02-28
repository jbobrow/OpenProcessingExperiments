
/*
title: A3‐01
 
 description: Using procedural programming, generate a vector (one‐dimensional array) 
 that contains all the integers between [1:99] in random order and create an animation
 that visualizes a sorting algorithm while it orders them in increasing order.
 
 created: November 8th, 2012
 by: Xiaolan Wang xiaolanw@sfu.ca
 */


//globle varibles
int[] arr;
int len;
int size;
int left;
int right;

//initialize sketch
void setup() {
  //set sketch size and background color
  size(990, 500);
  background(255);
  //initialize the len, size
  len = 99;
  size = 99;

  //generate an array contains all the integers between [1:99] in random order
  //by using generateRandomArray() function
  arr = generateRandomArray();

  // start another thread "quickSort" to order the array in increasing order.
  thread("quickSort");
}

void draw() {
  // update background
  background(255);
  // call drawRect() to visulize the current arr
  drawRect(arr);
}

//function for generating an array including 1-99 in random order
int[] generateRandomArray() {
  // create an array original[], its type is int, its length is the value of len.
  int original[] = new int[len];  
  // assign 1-99 to original[]
  for (int i=0; i!= len; ++i)
    original[i] = i+1;

  // random number r which is between 0 and 100
  int r = int(random(0, 100));

  for (int i=0; i!=len; ++i) {
    //choose a random position
    int tmp = r%size;
    if (tmp < 0)
      tmp = -tmp;

    //copy the random value to output array
    int t =original[tmp];
    original[tmp] = original[size-1];
    original[size-1]=t;

    size--;
  }

  return original;
}

/* this function partition for returning the pivot 
  which is superior than the values on its let
  and interior than the ones on the its right
*/

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
      delay(1000);
    }
  };

  return i;
}

void quickSort() {
  quickSort(arr, 0, len-1);
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

//procedure for drawing rectangles to visulize the current array
void drawRect(int[] arr) {
  // use for-loop to read all the numbers in array
  for (int i=0;i!=len-1;++i) {
    // fill the rectangles in red
    fill(192, 0, 0);
    // draw rectangles
    rect(i*width/len, 0, width/len, arr[i]*5);
  }
}



