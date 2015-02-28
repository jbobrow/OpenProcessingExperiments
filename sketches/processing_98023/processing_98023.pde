
/*
Mihir Khetarpal
*/
int[] array = new int[50];
int i = 0;
void setup() {
  genArray();
  for (int i: array) {
    print(i + " ");
  }
  size(500, 500);
  frameRate(10);
  println();
  println();
  for (int i: array) {
    print(i + " ");
  }
}
void genArray() {
  for (int i = 0; i < 50; i++) {
    array[i] = (int)(random(25));
  }
}
void selectionSortSingleLoop(int i) {
  int val = array[i];
  int pos = i;
  int k = i;
  for (int ik = i; ik < array.length; ik++) {
    if (val > array[ik]) {
      val = array[ik];
      pos = ik;
    }
    background(0);
    drawArray(i, pos);
  }
  swap(array, i, pos);
}

void draw() {
  selectionSortSingleLoop(i);
  i++;
  if (i > 49) {
    rerun();
  }
  i %= 50;
}
void drawArray(int j, int k) {
  fill(255, 255, 255);
  for (int i = 0; i < 50; i++) {
    if (i == j || i == k) {
      fill(255, 0, 0);
    } 
    else {
      fill(255, 255, 255);
    }
    rect(i*10, 500, 10, - array[i] * 20);
  }
}
void rerun() {
  genArray();
  i = 0;
}
void swap(int[] array, int pos1, int pos2) {
  int temp = array[pos1];
  array[pos1] = array[pos2];
  array[pos2] = temp;
}

