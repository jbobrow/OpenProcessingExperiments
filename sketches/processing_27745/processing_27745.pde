
int[] colors;
float mainY = 0;
int mainStep = 0;
int CURRENTSORTING = 0;
String sortingName = "quickSort";
PImage colorImage;
void setup() {
  size(1280, 720);
  colors = new int[width];
  colorImage = loadImage("blackwhite.png");
  doSort();
}

void draw() {
  smooth();
}

void doSort() {
  mainY = 0;
  mainStep = 0;
  background(0);
  // fill colors array
  int imageY = (int)random(colorImage.height);
  for(int i=0;i<width;i++) {
    colors[i] = colorImage.get(i, imageY);
  }
  background(255);
  smooth();
  switch(CURRENTSORTING) {
  case 0:
    quickSort(colors,0,colors.length-1);
    break;
  case 1:
    bubbleSort(colors);
    break;
  case 2:
    selectionSort(colors);
    break;
  case 3:
    insertionSort(colors);
    break;
  case 4:
    shellsort(colors);
    break;
  case 5:
    heapSort(colors);
    break;
  }
}

/*
 * draw the values of given array as colors
 */
void drawArray(int[] array) {
  for(int i=0;i<array.length;i++) {
    stroke(array[i]);
    line(i, mainY, i, mainY+1);
  }
  mainY++;
}

// ------ quicksort             --------- //

int partition(int arr[], int left, int right)
{
  int i = left, j = right;
  int tmp;
  int pivot = arr[(left + right) / 2];
  int counting = 0;
  while (i <= j) {
    if(mainStep++ % 8 == 0) drawArray(arr);
    while (arr[i] < pivot)
      i++;
    while (arr[j] > pivot)
      j--;
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

void quickSort(int arr[], int left, int right) {
  int index = partition(arr, left, right);
  if (left < index - 1) {
    quickSort(arr, left, index - 1);
  }
  if (index < right) {
    quickSort(arr, index, right);
  }
}


// ------ selection sort             --------- //

public void selectionSort(int[] arr) {
  int i, j, minIndex, tmp;
  int n = arr.length;
  for (i = 0; i < n - 1; i++) {
    minIndex = i;
    for (j = i + 1; j < n; j++)
      if (arr[j] < arr[minIndex])
        minIndex = j;
    if (minIndex != i) {
      tmp = arr[i];
      arr[i] = arr[minIndex];
      arr[minIndex] = tmp;
      if(mainStep++%2==0) drawArray(arr);
    }
  }
}

// ------ insertion sort             --------- //

void insertionSort(int[] arr) {
  int i, j, newValue;
  int counts = 0;
  for (i = 1; i < arr.length; i++) {
    newValue = arr[i];
    j = i;
    while (j > 0 && arr[j - 1] > newValue) {
      arr[j] = arr[j - 1];
      j--;
    }
    arr[j] = newValue;
    if(mainStep++%2==0) drawArray(arr);
  }
}

// ------ bubble sort             --------- //
public void bubbleSort(int[] a)
{
  int out, in;
  int nElems = a.length;
  int counts = 0;
  for(out=nElems-1; out>1; out--) {

    for(in=0; in<out; in++) {
      if( a[in] > a[in+1] ) {
        swap(a, in, in+1);
      }
    }
    if(counts++%2 == 0) drawArray(a);
  }
}

private void swap(int[] a, int one, int two)
{
  int temp = a[one];
  a[one] = a[two];
  a[two] = temp;
}


// ------ shell sort             --------- //

void shellsort(int[] a)
{
  int i, j, k, h, t;
  int n = n=a.length;
  int[] cols = {
    1391376, 463792, 198768, 86961, 33936,
    13776, 4592, 1968, 861, 336, 112, 48, 21, 7, 3, 1
  };
  int steps = 0;
  for (k=0; k<16; k++)
  {
    h=cols[k];
    steps++;
    for (i=h; i<n; i++)
    {
      j=i;
      t=a[j];
      steps++;
      while (j>=h && a[j-h]>t)
      {
        a[j]=a[j-h];
        j=j-h;
        steps++;
      }
      a[j]=t;
      if(steps % 12 == 0) drawArray(a);
    }
  }
}


// heapsort
void sift (int[] a, int l, int r) { 
  int i, j;
  int x;
  i = l; 
  x = a[l];
  j = 2*i+1;
  if ((j<r) && (a[j+1]<a[j])) j++;
  while ((j<=r) && (a[j] < x)) {
    a[i] = a[j];
    i    = j; 
    j    = j*2+1;
    if ((j<r) && (a[j+1]<a[j])) j++;
  }
  a[i] = x;
}

// ------ heap sort             --------- //
void heapSort (int[] a) { 
  int l,r,n,tmp;
  n = a.length;
  for (l=(n-2)/2; l>=0; l--)
      sift(a,l,n-1);
  for (r=n-1; r>0; r--) {
    tmp  = a[0];
    a[0] = a[r];
    a[r] = tmp;
    sift(a, 0, r-1);
    if(mainStep++%2==0)drawArray(a);
  }
}

void mousePressed() {
  // save(sortingName + "_" + (System.currentTimeMillis()/1000) + ".png");
}


void keyPressed() {
  if(key == '0') {
    CURRENTSORTING = 0;
    sortingName = "quickSort";
  }
  if(key == '1') {
    CURRENTSORTING = 1;
    sortingName = "bubbleSort";
  }
  if(key == '2') {
    CURRENTSORTING = 2;
    sortingName = "selectionSort";
  }
  if(key == '3') {
    CURRENTSORTING = 3;
    sortingName = "insertionSort";
  }
  if(key == '4') {
    CURRENTSORTING = 4;
    sortingName = "shellSort";
  }
  if(key == '5') {
    CURRENTSORTING = 5;
    sortingName = "heapSort";
  }
  doSort();
}


