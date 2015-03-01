
int counter;
int canvasHeight = 174;
int canvasWidth = 484;
int stripWidth = 11;
int blockWidth = 44;
int blockHeight = 20;
int yYellow = 40;
int yBlue = 130;

void setup() {  //setup function called initially, only once
  size(canvasWidth, canvasHeight);
  counter = 0;
}

void draw() {  //draw function loops 
  background(255);  //set background white
  if(mousePressed == false) { // make black stripes
    fill(0);
    for (int i=0; i<canvasWidth; i = i+2*stripWidth) {
      rect(i, 0, stripWidth, canvasHeight)
    }
  }
  counter++;
  noStroke();
  // draw yellow rectangle
  fill(255,255,0);
  rect(counter, yYellow, blockWidth, blockHeight);
  // draw yellow rectangle
  fill(0,0,255);
  rect(counter, yBlue, blockWidth, blockHeight);
  // after leaving the canvas restart at left
  if (counter == canvasWidth) {
    counter = 0
  }
}
