
//if all the rectangles turn to black, that means that the variable 'lastSorted' hit zero. It will continue after a moment of pause.

int[] xnoty = new int[50];
int toBe = 1;
int lastSorted = 1;

void setup() {
  size(300, 600);
  background(255, 255, 255);
  frameRate(0.5);
  fill(0, 0, 0);
  //gets random heights for each of the rectangles
  for (int i = 0; i < 50; i++) {
    xnoty[i] = (int)random(0, 600);
  }
}

void draw() {
  background(255, 255, 255);
  //create each of the rectangles with a width of 6 and a height of the value in the array
  for (int i = 0; i < 50; i++) {
    rect(6 * i, 600 - xnoty[i], 6, xnoty[i]);
  }
  if (toBe < 50) {
    while (lastSorted != 0 && xnoty[lastSorted] < xnoty[lastSorted - 1]) {
      //have to constantly reset background to white else a black rectangle will appear on top the previously placed rectangle.
      background(255, 255, 255);
      //the temp is used to swap rectangles around (part of the sort algorithm for holding places)
      int temp = 0;
      //lastSorted is used for the rentangle that was just switched.
      temp = xnoty[lastSorted];
      xnoty[lastSorted] = xnoty[lastSorted-1];
      xnoty[lastSorted-1] = temp;
      lastSorted = lastSorted - 1;
      for (int i = 0; i < 50; i++) {
        fill(255, 255, 255);
        if (i > toBe) {
          //all of the blue rectangles are the unsorted ones to the right of the toBe
          fill(0, 0, 255);
        }
        //create the rectangle at 'i' and fill it with teal
        rect(6 * i, 600 - xnoty[i], 6, xnoty[i]);
        //teal rectangles (if on left) are just moved. teal rectangles on the right are the next to be moved.
        fill(0, 255, 255);
        //lastSorted keeps track of the rectangle that was just moved
        rect(6 * lastSorted, 600 - xnoty[lastSorted], 6, xnoty[lastSorted]);
        //all of the white rectangles are sorted.
        fill(0, 0, 0);
      }
      if (toBe < 49) {
        //teal rectangles (if on left) are just moved. teal rectangles on the right are the next to be moved.
        fill(0, 255, 255);
        //here, a rectangle is being created at the next location. toBe keeps track of the next rectangle to be sorted.
        rect(6 * toBe + 1, 600 - xnoty[toBe+1], 6, xnoty[toBe+1]);
        //all of the white rectangles are sorted
        fill(0, 0, 0);
      }
    }
  }
  toBe++;
  lastSorted = toBe;
}
