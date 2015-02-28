
import java.util.Random;
import java.util.Stack;

private int[] numbers;
private int number;
private int[] values = new int[100];
private int top = -1;
private int bottom = -1;
private int h = -1;
private int l = -1;
private int p = -1;
private int pivot;
private int delay = 2;
private Stack<int[]> s = new Stack<int[]>();
Random rand = new Random();
private boolean sortStart = false;
private boolean quickSortProgress = false;
private boolean quickSortEnded = false;
private boolean exchange = false;
PFont font;

public void setup() {
  size(600, 600);
  background(0);
  for (int i = 0; i < values.length; i++) {
    values[i] = rand.nextInt(100);
  }
  top = values.length - 1;
  bottom = 0;
  font = createFont("Arial", 16, true);
}

public void draw() {
  this.background(0);
  this.fill(255, 255, 255, 255);
  if (numbers != null) {
    for (int i = 0; i < numbers.length; i++) {
      this.fill(255, 255, 255, 255);
      this.stroke(0, 0, 0, 255);
      if (sortStart) {
        if (i >= l && i <= h) {
          this.fill(0, 255, 0, 125);
        }
        if (i == p) {
          this.fill(255, 0, 0, 125);
        }
      }
      this.rect(i * 6, 600 - numbers[i] * 3, 6, numbers[i] * 3);
      if (exchange && sortStart) {
        this.stroke(255, 0, 0, 255);
        this.line(l * 6, 600 - numbers[l] * 3, h * 6, 
        600 - numbers[h] * 3);
      }
    }
  } 
  else {
    for (int i = 0; i < values.length; i++) {
      this.rect(i * 6, 600 - values[i] * 3, 6, values[i] * 3);
    }
  }
  if (sortStart) {
    // sortArray(values);
    if (delay > 0) {
      delay--;
    } 
    else {
      if (quickSortEnded) {
        if (s.size() > 0) {
          int[] temp = s.pop();
          if (Math.abs(temp[0] - temp[1]) > 1) {
            bottom = temp[0];
            top = temp[1];

            quickSortEnded = false;
          }
        } 
        else {
          sortStart = false;
        }
      }
      if (quickSortProgress) {
        if (exchange) {
          exchange(l, h);
          l++;
          h--;
          exchange = false;
        } 
        else {
          quicksortIteration(bottom, top);
        }
      } 
      else {
        quickSortInitiate(values);
      }
      delay = 2;
    }
  } 
  else {
    textFont(font, 12);
    this.text("Press Space to Start", 230, 60);
  }
  this.fill(255, 255, 255, 255);
  textFont(font, 36);
  this.text("QuickSort", 200, 40);
}

public void keyPressed() {
  if (this.key == ' ') {
    sortStart = true;
  }
}

private void quickSortInitiate(int[] v) {
  h = top;
  l = bottom;
  p = bottom + (top - bottom) / 2;
  if (v == null || v.length == 0) {
    return;
  }
  this.numbers = v;
  number = v.length;
  pivot = numbers[p];
  quickSortProgress = true;
}

private void quicksortIteration(int low, int high) {
  top = high;
  bottom = low;

  if (l <= h) {
    if (numbers[l] < pivot) {
      l++;
      return;
    }
    if (numbers[h] > pivot) {
      h--;
      return;
    }
    if (l <= h) {
      exchange = true;

      return;
    }
  }
  if (low < h) {
    int[] temp = new int[2];
    temp[0] = low;
    temp[1] = h;
    if (!stackContains(low, h))
      s.add(temp);
  }
  if (l < high) {
    int[] temp = new int[2];
    temp[0] = l;
    temp[1] = high;
    if (!stackContains(l, high))
      s.add(temp);
  }
  quickSortEnded = true;
  quickSortProgress = false;
}
private boolean stackContains(int i, int j) {
  for (int k = 0; k< s.size();k++) {
    if (s.get(k)[0] == i) {
      if (s.get(k)[1] == j) {
        return true;
      }
    }
  }
  return false;
}
private void exchange(int i, int j) {
  int temp = numbers[i];
  numbers[i] = numbers[j];
  numbers[j] = temp;
}


