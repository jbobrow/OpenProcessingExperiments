
//draw a blue green gradient square

void setup() {
  size(256, 256); // square size equals the max color points 256
  noLoop();
}

void draw () {
  for (int x=0; x<256; x=x+1) { // add 1 horizontally
    for (int y=0; y<256; y=y+1) { //add 1 vertically
      stroke(0, x, y); // draw the lines
      point(x, y); //change the points
    }
  }
}  


