
static final float goldenRatio = (1+sqrt(5))/2;

Sort sort;
int sortNum;

void setup() {
  size(600,600);
  textAlign(RIGHT,TOP);
  
  sort = new BubbleSort(randomIntArray(100));
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  
  text(int(frameRate)+" fps\n"+sort.num,width,0);
  
  sort.sortStep();
  sort.drawArray();
}

int[] randomIntArray(int n) {
  int[] data = new int[n];  
  for (int i = 0; i < n; i++)
    data[i] = int(random(n));
    
  return data;
}

void keyPressed() {
  if (key == '-') frameRate(frameRate/goldenRatio);
  else if (key == '=') frameRate(frameRate*goldenRatio);
  if (frameRate < 1) frameRate(1);
  
  // SORTING ALGORITHM SELECTION
  switch(key) {
    case '1':  sort = new BubbleSort(randomIntArray(100)); return;
    case '2':  sort = new OptimizedBubbleSort(randomIntArray(100)); return;
    case '3':  sort = new CocktailSort(randomIntArray(100)); return;
    case '4':  sort = new OddEvenSort(randomIntArray(100)); return;
    case '5':  sort = new GnomeSort(randomIntArray(100)); return;
    case '6':  sort = new BozoSort(randomIntArray(100)); return;
    case '7':  sort = new InsertionSort(randomIntArray(100)); return;
    case '8':  sort = new SelectionSort(randomIntArray(100)); return;
  }
  
}

abstract class Sort {
  protected int[] array;
  public int num;
  
  Sort (int[] a) {
    array = a;
  }
  
  abstract void sortStep();
  
  void drawArray() {
    for (int i = 0; i < array.length; i++)
      ellipse(6*(i+1),6*array[i],6,6);
  }
  
  void swap(int i, int j) {
    int temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }
}

class BubbleSort extends Sort {
  
  protected int current;
  
  BubbleSort(int[] arr) {
    super(arr);
    current = 0;
    num = 1;
  }
  
  void sortStep() {
    if (current+1 == array.length) current = 0;
    
    if (array[current] > array[current+1])
      swap(current,current+1);
    
    current++;
  }
  
}

class OptimizedBubbleSort extends BubbleSort {
  
  private int c = 0;
  
  OptimizedBubbleSort(int[] arr) {
    super(arr);
    int c = 0;
    num = 2;
  }
  
  void sortStep() {
    if (current+1 == array.length-c) {
      current = 0;
      c++;
    }
    super.sortStep();
  }
  
}

class CocktailSort extends Sort {
  
  private int current;
  private int a,b;
  private int dir;
  
  CocktailSort(int[] arr) {
    super(arr);
    current = 0;
    a = 0;
    b = 0;
    dir = 1;
    
    num = 3;
  }
  
  void sortStep() {
    if (dir == 1) {
      if (current+1 >= array.length-b) {
        dir = -1;
        b++;
      } else if (array[current] > array[current+1])
        swap(current,current+1);
    
    } else {
      if (current-1 < a) {
        dir = 1;
        a++;
      } 
      else if (array[current] < array[current-1])
        swap(current,current-1); 
    }
    
    current += dir;
  }
  
}

class OddEvenSort extends Sort {
  
  protected int current;
  private boolean even;
  
  OddEvenSort(int[] arr) {
    super(arr);
    current = 0;
    num = 4;
    even = true;
  }
  
  void sortStep() {
    if (current+1 >= array.length) {
      even = !even;
      current = even ? 0 : 1;
      return;
    }
    
    if (array[current] > array[current+1])
        swap(current,current+1);
    
    current += 2;
    
  }
  
}

class GnomeSort extends Sort {
  
  private int i,j;
  
  GnomeSort(int[] arr) {
    super(arr);
    i = 1;
    j = 1;
    
    num = 5;
  }
  
  void sortStep() {
    if (i == array.length) return;
    
    if (j > 0 && array[j] < array[j-1]) {
      swap(j,j-1);
      j--;
    } else {
      i++;
      j = i;
    }
    
  }
  
}

class BozoSort extends Sort {
  
  boolean sorted;
  
  BozoSort(int[] arr) {
    super(arr);
    sorted = false;
    num = 6;
  }
  
  void sortStep() {
    if (sorted) return;
    
    int i = int(random(array.length-1));
    int j = int(random(array.length-1));
    swap(i,j);
    
    int a = 0;
    for (int x : array)
      if (x < a) {
        sorted = false;
        return;
      } else a = x;
    
  }
  
}

class InsertionSort extends Sort {
  
  private int i,j;
  private int value;
  
  InsertionSort(int[] arr) {
    super(arr);
    i = 1;
    j = 1;
    value = array[1];
    
    num = 7;
  }
  
  void sortStep() {
    if (i == array.length) return;
    
    if (j > 0 && value < array[j-1]) {
      array[j] = array[j-1];
      j--;
    } else {
      array[j] = value;
      i++;
      j = i;
      if (i != array.length) value = array[i];
    }
    
  }
  
}

class SelectionSort extends Sort {
  
  private int current;
  private int i,j;
  
  SelectionSort(int[] arr) {
    super(arr);
    current = 0;
    
    i = 0;
    j = i;
    
    num = 8;
  }
  
  void sortStep() {
    if (i+1 == array.length) return;
    
    if (current == array.length) {
      swap(i,j);
      i++;
      j = i;
      current = i;
    }
    
    if (array[current] < array[j]) j = current;
    current++;
    
  }
  
  void drawArray() {
    for (int n = 0; n < array.length; n++) {
      if (n == current) fill(0,0,255);
      else if (n == j) fill(255,0,0);
      else fill(255);
      
      ellipse(6*(n+1),6*array[n],6,6);
    }   
  }
  
}
