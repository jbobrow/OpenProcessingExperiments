
/*Mihir Khetarpal
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
void insertionSortSingleLoop(int i) {
  int val = array[i];
  int pos = i;
  int k = i;
  while (i > 0 && val < array[i - 1]) {
    array[i] = array[i - 1];
    i--;
    background(0);
    drawArray(i, k);
  }
  array[i] = val;
}

void draw() {
  insertionSortSingleLoop(i);
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

