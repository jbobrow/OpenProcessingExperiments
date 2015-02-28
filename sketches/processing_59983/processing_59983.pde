
/*

Simple grid with lines.

@author Rafael Rinaldi (rafaelrinaldi.com)
@since Apr 20, 2012

*/

int LINE_THICKNESS = 2;
int LINE_PADDING = 10;

int pX = 0;
int pY = 0;

void setup() {
  
  // Setup canvas.
  size(300, 300);
  background(0xEEEEEE);
  
  // Setup lines.
  stroke(0);
  strokeWeight(LINE_THICKNESS);

  // Drawing on Y.
  while(pY < height) {
    line(0, pY, height, pY);
    pY += LINE_THICKNESS + LINE_PADDING;
  }
  
  // Drawing on X.
  while(pX < width) {
    line(pX, 0, pX, height);
    pX += LINE_THICKNESS + LINE_PADDING;
  }
  
}

