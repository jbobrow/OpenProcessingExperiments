
import java.util.Random;
import java.util.Stack;


private int[] values = new int[100];
private int i = 1;
private int j = 0;
private int b;
private int delay = 2;
Random rand = new Random();
private boolean sortStart = false;
PFont font;
private boolean iterationDone = false;
private boolean iterationStart = false;

public void setup() {
  size(600, 600);
  background(0);
  for (int i = 0; i < values.length; i++) {
    values[i] = rand.nextInt(100);
  }
  font = createFont("Arial", 16, true);
}

public void draw() {
  this.background(0);
  this.fill(255, 255, 255, 255);
  if (values != null) {
    for (int i = 0; i < values.length; i++) {
      this.fill(255, 255, 255, 255);
      this.stroke(0, 0, 0, 255);
      this.rect(i * 6, 600 - values[i] * 3, 6, values[i] * 3);
      this.stroke(255, 0, 0, 255);
      this.fill(255, 0, 0, 255);
      this.stroke(0, 0, 0, 255);
      this.rect((j) * 6, 600 - values[(j)] * 3, 6, values[(j)] * 3);
      this.stroke(255, 0, 0, 255);
      if (j-1 > 0)
        this.line((j-1) * 6, 600 - values[(j-1)] * 3, j * 6, 
        600 - values[j] * 3);
    }
  } 
  else {
    for (int i = 0; i < values.length; i++) {
      this.rect(i * 6, 600 - values[i] * 3, 6, values[i] * 3);
    }
  }
  if (sortStart) {
    if (delay > 0) {
      delay--;
    } 
    else {
      if (iterationStart) {
        insertionSort(values);
        if (iterationDone) {
          i++;
          if (i >= values.length) {
            sortStart = false;
          }
          iterationDone = false;
          iterationStart = false;
        }
      } 
      else {
        iterationInitiate(values);
      }
      delay = 5;
    }
  } 
  else {
    textFont(font, 12);
    this.text("Press Space to Start", 230, 60);
  }
  this.fill(255, 255, 255, 255);
  textFont(font, 36);
  this.text("InsertionSort", 200, 40);
}

private void iterationInitiate(int array[]) {
  // TODO Auto-generated method stub
  j = i;
  b = array[i];
  iterationStart = true;
}

public void keyPressed() {
  if (this.key == ' ') {
    sortStart = true;
  }
}

public void insertionSort(int array[]) {
  if ((j > 0) && (array[j - 1] > b)) {
    array[j] = array[j - 1];
    array[j-1] = b;
    j--;
    return;
  }
  array[j] = b;
  iterationDone = true;
}


