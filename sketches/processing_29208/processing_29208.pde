
final int horizontalUnit = 30;
final int verticalUnit = 10;
final int horizontalOffset = 2 * horizontalUnit;
final int verticalOffset = 4 * verticalUnit;

final int amountOfData = 20;
final int maxOfData = 30;

PFont foregroundFont;
PFont backgroundFont;
PFont algoFont;

int[] data = new int[amountOfData];
List historyList;
int counter;

void setup() {
  
  size(700, 500);  
  foregroundFont = loadFont("ArialMT-16.vlw");
  backgroundFont = loadFont("Arial-BoldMT-64.vlw");
  algoFont = loadFont("Consolas-24.vlw");
  
  setData(data);
  counter = 0;
  historyList = new ArrayList();
  if (canSort(data)) {
    doInsertionSort(data);
  }

}

void draw() {

  // clear background to white each time draw is called
  background(255); 

  // the history list is the sequences of changes to array data as it gets sorted
  History history = (History) historyList.get(counter);

  // background shows the current key 
  drawBackground(history);

  // header contains title, step explanation and buttons
  drawHeader(history);

  // main body
  drawHistograms(history);   

  // footer contains the bottom line and buttons
  drawFooter();
  
}

// =========== Used in setup() =========== //

/**
 * Populate the data array with random integers from 1 to 30
 **/
void setData(int[] arr) {
  for (int i = 0; i < arr.length; i++) {
    arr[i] = int(random(1, maxOfData));
  }
}

/**
 * Simple check to determine whether the data array can be sorted or not
 **/
boolean canSort(int[] arr) {
  
  // nothing to sort if array is null
  if (arr == null) {
    return false;
  } 

  // nothing to sort for zero or single item
  if (arr.length == 0 || arr.length == 1) {
    return false;
  }

  // can sort the array if it is not already sorted
  boolean isSorted = true;
  for (int i = 0; i < arr.length-1; i++) {
    if (arr[i] > arr[i+1]) {
      isSorted = false;
    }
  }
  boolean canSort = !isSorted;
  return canSort;
  
}

/**
 * Perform the actual insertion sort.
 * The implementation is kept as similar as possible to Cormen, et al. 2009, p. 18
 * 
 * INSERTION-SORT (A)
 * 1 for j = 2 to A.length
 * 2   key = A[j]
 * 3   // Insert A[j] into sorted sequence A[1..j-1]
 * 4   i = j-1
 * 5   while i > 0 and A[i] > key
 * 6      A[i+1] = A[i]
 * 7      i = i-1
 * 8   A[i+1] = key
 **/
void doInsertionSort(int[] arr) {

  int startIndex = 1;
  int endIndex = arr.length-1;
  for (int j = startIndex; j <= endIndex; j++) {   // 1
    
    int key = arr[j];                              // 2
    int i = j - 1;                                 // 4
    saveHistory(j, key, -1, data, "looking at a[" + (j+1) + "]", false);

    while (i > -1 && arr[i] > key) {               // 5
  
      arr[i+1] = arr[i];                           // 6
    
      // (1+2) = (i+1)+1 
      // +1 the index when displaying, since index starts from 1 in the pseudocode 
      saveHistory(j, key, i+1, data, "a[" + (i+2) + "] = " + arr[i+1], false);
      
      i = i - 1;                                   // 7
    
  }
    
    arr[i + 1] = key;                              // 8

    saveHistory(j, key, -1, data, "inserted a[" + (i+2) + "] = " + key, true); 

  }
  
}

/**
 * A convenience method to take a snapshot of the data, 
 * and other variables to be displayed for informative purposes
 **/
void saveHistory(int key, int keyValue, int loopIndex, int[] data, String msg, boolean keyFound) {
  History hist = new History(key, keyValue, loopIndex, data);
  hist.setKeyFound(keyFound);
  hist.setMsg(msg);
  historyList.add(hist);
}

// =========== Used in draw() =========== //

/**
 * Draw background
 **/
void drawBackground(History history) {
  
  // key value
  textFont(backgroundFont, 64);  
  fill(128, 25); 
  text(history.keyValue, 8.2*horizontalUnit, 7.2*verticalUnit);
  if (history.keyFound) {
    fill(#4E026E, 100);         
  } else {
    fill(128, 80);     
  }
  text(history.keyValue, 8*horizontalUnit, 6.5*verticalUnit);

  // algorithm
  textFont(algoFont, 24);
  fill(128, 35);
  
  String[] algoMsg = {
    "INSERTION-SORT (A)",
    "1 for j = 2 to A.length",
    "2   key = A[j]",
    "3   // Insert A[j] into sorted sequence A[1..j-1]",
    "4   i = j-1",
    "5   while i > 0 and A[i] > key",
    "6      A[i+1] = A[i]",
    "7      i = i-1",
    "8   A[i+1] = key"   
  };
  for (int i = 0; i < algoMsg.length; i++) {
    text(algoMsg[i], horizontalUnit, (5*i)*verticalUnit);    
  }

}

/**
 * Draw header
 **/
void drawHeader(History history) {
  
  // status msg
  textFont(foregroundFont, 16);  
  fill(#4E026E);

  String msg = "Insertion Sort Demo";
  text(msg, horizontalUnit, 3*verticalUnit);

  msg = "j = " + (history.key+1) + ", key = " + history.keyValue;
  text(msg, horizontalUnit, 5*verticalUnit);

  msg = history.msg;
  text(msg, horizontalUnit, 7*verticalUnit);

  msg = "seq #" + (counter+1) + " ";
  if (counter == 0) {
    msg += "(start)";
  } else if (counter == historyList.size()-1) {
    msg += "(end)";
  }
  text(msg, horizontalUnit, 9*verticalUnit);

  // 1st box
  int x = 13 * horizontalUnit;
  int y = 2 * verticalUnit;
  int w = 2 * horizontalUnit;
  int h = 3 * verticalUnit;
  boolean overFirstButton = isInRectangleBound(x, y, w, h);
  boolean downArrowPressed = isArrowPressed(DOWN);
  if (overFirstButton || downArrowPressed) {
      fill(0, 128, 255);
  } else {
    fill(255);
  }
  rect(x, y, w, h);

  // 1st label
  if (overFirstButton || downArrowPressed) {
    fill(255);
  } else {
    fill(#4E026E);    
  }
  textFont(foregroundFont, 16);  
  text("<< 1", 13.5*horizontalUnit, 4*verticalUnit);

  // P box
  x = (int) (15.5 * horizontalUnit);
  y = 2 * verticalUnit;
  w = 2 * horizontalUnit;
  h = 3 * verticalUnit;
  boolean overPrevButton = isInRectangleBound(x, y, w, h);
  boolean leftArrowPressed = isArrowPressed(LEFT);
  if (overPrevButton || leftArrowPressed) {
    fill(0, 128, 255);
  } else {
    fill(255);
  }
  rect(x, y, w, h);

  // P label
  if (overPrevButton || leftArrowPressed) {
    fill(255);
  } else {
    fill(#4E026E);    
  }
  textFont(foregroundFont, 16);  
  text("< P", 16*horizontalUnit, 4*verticalUnit);

  // N box
  x = (int) (18 * horizontalUnit);
  y = 2 * verticalUnit;
  w = 2 * horizontalUnit;
  h = 3 * verticalUnit;
  boolean overNextButton = isInRectangleBound(x, y, w, h);
  boolean rightArrowPressed = isArrowPressed(RIGHT);
  if (overNextButton || rightArrowPressed) {
    fill(0, 128, 255);
  } else {
    fill(255);
  }
  rect(x, y, w, h);

  // N label
  if (overNextButton || rightArrowPressed) {
    fill(255);
  } else {
    fill(#4E026E);    
  }
  textFont(foregroundFont, 16);  
  text("> N", 18.5*horizontalUnit, 4*verticalUnit);  

  // L box
  x = (int) (20.5 * horizontalUnit);
  y = 2 * verticalUnit;
  w = 2 * horizontalUnit;
  h = 3 * verticalUnit;
  boolean upArrowPressed = isArrowPressed(UP);  
  boolean overLastButton = isInRectangleBound(x, y, w, h);
  if (overLastButton || upArrowPressed) {
    fill(0, 128, 255);
  } else {
    fill(255);
  }
  rect(x, y, w, h);

  // L label
  if (overLastButton || upArrowPressed) {
    fill(255);
  } else {
    fill(#4E026E);    
  }
  textFont(foregroundFont, 16);  
  text(">> L", 21*horizontalUnit, 4*verticalUnit);  
  
  fill(#4E026E);
  msg = "or hold the arrow keys";
  text(msg, 13*horizontalUnit, 7*verticalUnit);
  
  handleKeyPress();
  handleButtonClick(overPrevButton, overNextButton, overFirstButton, overLastButton);

}

/**
 * Handle keypress
 **/
void handleKeyPress() {
  if (isArrowPressed(LEFT)) {
    if (counter > 0) {
      counter--;
      delay(100);
    }    
  } else if (isArrowPressed(RIGHT)) {
    if (counter < historyList.size()-1) {
      counter++;
      delay(100);
    }
  } else if (isArrowPressed(DOWN)) {
    counter = 0;
    delay(100); 
  } else if (isArrowPressed(UP)) {
    counter = historyList.size() - 1;
    delay(100);
  }
}

/**
 * Handle mouse action when buttons are clicked
 **/
void handleButtonClick(boolean overPrevButton, boolean overNextButton, boolean overFirstButton, boolean overLastButton) {
  
  if (overPrevButton || overNextButton || overFirstButton || overLastButton) {
    cursor(HAND);         
  } else {
    cursor(ARROW); 
  }
  
  if (mousePressed && mouseButton == LEFT && overPrevButton) {
    if (counter > 0) {
      counter--;
      delay(100);
    }    
  } 
  
  if (mousePressed && mouseButton == LEFT && overNextButton) {
    if (counter < historyList.size()-1) {
      counter++;
      delay(100);
    }
  }

  if (mousePressed && mouseButton == LEFT && overFirstButton) {
    counter = 0;
    delay(100);
  } 
  
  if (mousePressed && mouseButton == LEFT && overLastButton) {
    counter = historyList.size() - 1;
    delay(100);
  }
    
}

/**
 * Check that a CODED key is pressed
 **/
boolean isArrowPressed(int myKey) {
  if (keyPressed && (key == CODED) && (keyCode == myKey)) {
    return true;
  }
  return false;
}

/**
 * Check that the current mouse cursor in inside a rectangle
 * bounded by a rectangle specified by rect(x, y, w, height)
 **/
boolean isInRectangleBound(int x, int y, int w, int h) {
 if ((mouseX > x) && (mouseX < x+w) && 
    (mouseY > y) && (mouseY < y+h)) {
      return true;
 }
 return false;
}

/**
 * Draw main body
 **/
void drawHistograms(History hist) {

  int index = hist.loopIndex;
  int key = hist.key;
  int[] arr = hist.arr;
  
  for (int i = 0; i < arr.length; i++) {
    drawHistogram(arr[i], i, index, key);
  }
  
}

/**
 * Called when drawing the main body
 **/
void drawHistogram(int value, int loopIndex, int highlightIndex, int keyIndex) {
  drawHistogramBox(value, loopIndex, highlightIndex, keyIndex);
  drawHistogramNumber(value, loopIndex, highlightIndex, keyIndex);
}

/**
 * Draw a box for each array entry
 * the height of the box is determined by the value of the entry
 **/
void drawHistogramBox(int value, int loopIndex, int highlightIndex, int keyIndex) {

  stroke(0);
  int boxWidth = horizontalUnit;
  int boxHeight = verticalUnit * value;
  int x = horizontalUnit * (loopIndex+1);
  int y = height - (4*verticalUnit) - boxHeight;  
  
  // TODO: put the check for highlighting inside the history object
  if (loopIndex == highlightIndex) {
    fill(255, 0, 0);
  } else if (loopIndex == keyIndex) {
    fill(0, 128, 255); 
  } else {
    fill(#4E026E);
  }
  rect(x, y, boxWidth, boxHeight);

}

/**
 * Draw number on top of each box
 **/
void drawHistogramNumber(int value, int loopIndex, int highlightIndex, int keyIndex) {

  int boxWidth = horizontalUnit;
  int boxHeight = verticalUnit * value;
  int x = horizontalUnit * (loopIndex+1);
  int y = height - verticalUnit - boxHeight;  
  textFont(foregroundFont, 16);

  // TODO: put the check for highlighting inside the history object
  if (loopIndex == highlightIndex) {
    fill(255, 0, 0);
  } else if (loopIndex == keyIndex) {
    fill(0, 128, 255); 
  } else {
    fill(#7908AA);
  }
  String display = Integer.toString(value);
  text(display, x+(horizontalUnit/3), y-(6*verticalUnit), x+(horizontalUnit/3), y-verticalUnit);  

}

/**
 * Draw footer
 **/
void drawFooter() {

  // draw array indices
  textFont(foregroundFont, 16);
  fill(#7908AA);
  for (int i = 0; i < amountOfData; i++) {
    String display = "[";
    int num = i+1;
    if (num > 0 && num < 10) {
      display += "0" + num;      
    } else {
      display += num; 
    }
    display += "]";
    int x = horizontalUnit * (i+1);
    text(display, x+(horizontalUnit/10), height-(2*verticalUnit));        
  }
  
  // draw an horizontal axis line
  stroke(102);
  line(horizontalUnit, height-verticalUnit, width-(2*horizontalUnit), height-verticalUnit);

}

/**
 * Stores the snapshot of the data values
 * and other states variables
 **/
class History {

  int key;
  int keyValue;
  int loopIndex;
  int[] arr;
  String msg;
  boolean keyFound;

  History(int key, int keyValue, int loopIndex, int[] arr) {
        
    // shallow copy the values in the data array
    int[] copyArr = (int[]) arr.clone();
    this.arr = copyArr;
  
    this.key = key;
    this.keyValue = keyValue;
    this.loopIndex = loopIndex;
  
  }
  
  void setKeyFound(boolean keyFound) {
    this.keyFound = keyFound; 
  }
  
  boolean getKeyFound() {
    return this.keyFound; 
  }
  
  void setMsg(String msg) {
    this.msg = msg; 
  }
  
  String getMsg() {
    return this.msg;
  }
  
}

