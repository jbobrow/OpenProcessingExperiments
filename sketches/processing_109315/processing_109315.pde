
/**
 * Width and Height. 
 * 
 * The 'width' and 'height' variables contain the width and height 
 * of the display window as defined in the size() function. 
 */

void setup() {
  size(640, 890);
}

void draw() {
  background(608);
  noStroke();
  for (int i = 0; i < height; i += 20) {
    fill(300, 206, 15);
    rect(0, i, width, 10);
    fill(255,30,50);
    rect(i, 0, 10, height);
  }
}



