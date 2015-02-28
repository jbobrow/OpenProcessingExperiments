
/*
 * Visualizing Bubble Sort and Merge Sort Algorithms
 * CS350, Winter 2012
 * Author: Karl Hiner
 * Heap Sort: http://www.augustana.ca/~mohrj/courses/2004.winter/csc310/source/HeapSort.java.html
 * Bottom-up Merge Sort: http://andreinc.net/2010/12/26/bottom-up-merge-sort-non-recursive/
 */

import controlP5.*;

int[] list_1, list_2;
ArrayList<Integer> sortedIndices1 = new ArrayList<Integer>();
ArrayList<Integer> sortedIndices2 = new ArrayList<Integer>();
ArrayList<Integer> comparingIndices1 = new ArrayList<Integer>();
ArrayList<Integer> comparingIndices2 = new ArrayList<Integer>();
ControlP5 controlP5;
int n; // for bubbleSort
int heapN; // for heapSort
int step, startL, startR; // for mergeSort
boolean swapped;
boolean showInfo = true, bars = false;
int sort1TotalCount = 0, sort2TotalCount = 0;
int listLength = 256;
float scale; // for scaling drawing
Stack S = new Stack(); // for quickSort
String[] sortNames = {
  "Merge", "Bubble", "Quick", "Heap"
};
String sort1Name = "Quick";
String sort2Name = "Merge";

void setup() {
  size(900, 600, P2D);
  stroke(0);
  strokeWeight(2);
  textMode(SCREEN);
  //textFont(loadFont("CourierNew36.vstrolw"));
  textSize(16);
  frameRate(10);
  controlP5 = new ControlP5(this);
  DropdownList sort1List = controlP5.addDropdownList("sort1List", width - 325, 21, 45, 15);
  DropdownList sort2List = controlP5.addDropdownList("sort2List", width - 255, 21, 45, 15);
  sort1List.setBarHeight(15);
  sort2List.setBarHeight(15);
  sort1List.setHeight(45);
  sort2List.setHeight(45);
  sort1List.setLabel(sort1Name);
  sort2List.setLabel(sort2Name);
  for (int i = 0; i < sortNames.length; ++i) {
    sort1List.addItem(sortNames[i], i);
    sort2List.addItem(sortNames[i], i);
  }
  DropdownList lenList = controlP5.addDropdownList("lenList", width - 205, 21, 35, 15);
  lenList.captionLabel().style().marginTop = 3;
  lenList.setHeight(45);
  controlP5.addSlider("FPS", 3, 50, 10, width - 165, 5, 60, 15);
  controlP5.controller("FPS").captionLabel().style().marginLeft = -20;
  controlP5.addToggle("info", showInfo, width - 100, 5, 23, 15).captionLabel().style().marginTop = -15;
  controlP5.controller("info").captionLabel().style().marginLeft = 3;
  controlP5.addToggle("bars", bars, width - 75, 5, 23, 15).captionLabel().style().marginTop = -15;
  controlP5.controller("bars").captionLabel().style().marginLeft = 3;
  controlP5.addButton("reset", 1, width - 45, 5, 40, 15).captionLabel().style().marginLeft = 4;
  lenList.setBarHeight(15);
  lenList.addItem("8", 8);
  lenList.addItem("16", 16);
  lenList.addItem("32", 32);
  lenList.addItem("64", 64);
  lenList.addItem("128", 128);
  lenList.addItem("256", 256);
  lenList.addItem("512", 512);
  lenList.addItem("900", 900);
  lenList.setLabel(String.valueOf(listLength));
  reset();
}

void reset() {
  sort1TotalCount = 0;
  sort2TotalCount = 0;
  sortedIndices1.clear();
  sortedIndices2.clear();
  list_1 = new int[listLength];
  randomize(list_1);
  list_2 = copy(list_1);
  scale = (float)width/(float)listLength;
  n = listLength;
  heapN = listLength - 1;
  step = 1;
  startL = 0;
  startR = step;
  S.clear();
  S.push(0);
  S.push(listLength - 1);
}

int[] copy(int[] list) {
  int[] copy = new int[list.length];
  for (int i = 0; i < list.length; ++i)
    copy[i] = list[i];
  return copy;
}

void draw() {
  background(255);
  pushMatrix();
  scale(scale, 1);
  clearComparing();
  if (sortedIndices1.size() < listLength) {
    if (sort1Name.equals("Merge"))
      mergeSort(list_1);
    else if (sort1Name.equals("Bubble"))
      bubbleSort(list_1);
    else if (sort1Name.equals("Quick"))
      quickSort(list_1);
    else if (sort1Name.equals("Heap"))
      heapSort(list_1);
  }
  if (sortedIndices2.size() < listLength) {
    if (sort2Name.equals("Merge"))
      mergeSort(list_2);
    else if (sort2Name.equals("Bubble"))
      bubbleSort(list_2);
    else if (sort2Name.equals("Quick"))
      quickSort(list_2);
    else if (sort2Name.equals("Heap"))
      heapSort(list_2);
  } 
  fill(0);
  for (int i = 0; i < listLength; ++i) {
    int h = bars ? height/2 - 25 - list_1[i] : 3;
    rect(i, list_1[i] + 25, 1, h);
    h = bars ? height/2-list_2[i] : 3;
    rect(i, height/2 + list_2[i] + 25, 1, h);
  }
  if (showInfo) {
    fill(color(255, 0, 0, 150));
    for (int i : comparingIndices1)
        rect(i, 25, 1, height/2 - 25);
    for (int i : comparingIndices2)
      rect(i, height/2 + 25, 1, height/2 - 25);
    fill(color(0, 255, 0, 150));
    for (int i : sortedIndices1)
        rect(i, 25, 1, height/2 - 25);
    for (int i : sortedIndices2)
      rect(i, height/2 + 25, 1, height/2 - 25);
    fill(color(0, 0, 255, 200));
    int index = comparingIndices1.size();
    String indexString = index > 1 ? " Indices " : " Index ";
    text(sort1Name + " Sort: Comparing " + index + indexString + "Per Loop. Total Compares: " + sort1TotalCount, 5, 20);
    index = comparingIndices2.size();
    indexString = index > 1 ? " Indices " : " Index ";
    text(sort2Name + " Sort: Comparing " + index + indexString + "Per Loop. Total Compares: "+ sort2TotalCount, 5, height/2 + 20);
  }
  text("VS", controlP5.group("sort2List").getPosition().x - 22, 18);
  stroke(0);
  strokeWeight(1);
  line(0, 25, width, 25);
  line(0, height/2 + 25, width, height/2 + 25);
  strokeWeight(2);
  line(0, height/2, width, height/2);
  popMatrix();
  controlP5.draw();
}

public void randomize(int[] list) {
  for (int i = 0; i < list.length; ++i)
    list[i] = (int)random(height/2 - 27);
}

public void printList(int[] list) {
  for (int i : list)
    System.out.println(i);
}

public void spin(int time) {
  long start = System.currentTimeMillis();
  while (System.currentTimeMillis () - start < time) {
  }
}

public void FPS(float val) {
  frameRate((int)val);
}

public void info(boolean flag) {
  showInfo = flag;
}

public void bars(boolean flag) {
  bars = flag;
}

public void reset(int val) {
  reset();
}

void controlEvent(ControlEvent e) {
  if (e.isGroup()) {
    if (e.name().equals("lenList")) {
      listLength=(int)e.group().getValue();
      reset();
    } else if (e.name().equals("sort1List")) {
      String n = sortNames[(int)e.group().getValue()];
      if (!sort2Name.equals(n)) {
        sort1Name = n;
        reset();
      } else
        e.group().setLabel(sort1Name);
    } else if (e.name().equals("sort2List")) {
      String n = sortNames[(int)e.group().getValue()];
      if (!sort1Name.equals(n)) {
        sort2Name = n;
        reset();
      } else
        e.group().setLabel(sort2Name);
    }
  }
}


