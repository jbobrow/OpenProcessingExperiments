
int wRect;
int hRect;
color[][] rectColors;
int colRects = 10;
int rowRects = 10;
color selectedColor = color(0xffffff);

void setup() {
  size(800,800);
  background(#000000);
  // define rectangle width and heights
  wRect = width/(2*colRects);
  hRect = height/(2*rowRects);
  
  // initialize array 
  rectColors = new color[rowRects][colRects];
  
  // change color mode to HSB
  colorMode(HSB,rowRects*colRects);
  
  // fill array with colors
  for(int i = 0; i < rowRects; i++) {
    for(int j = 0; j < colRects; j++) {
      rectColors[i][j] = color((i+1)*(j+1),rowRects*colRects, rowRects*colRects);
    }
  }
  noStroke();
}

void draw() {
  background(#000000);
  
  // draw rectangles
    for(int j = 0; j < colRects; j++) {
  for(int i = 0; i < rowRects; i++) {
      fill(rectColors[i][j]);
      rect((i*2*wRect) + wRect/2,j*2*hRect + hRect/2,wRect,hRect);
    }
  }
  smooth();
  fill(selectedColor);
  // draw cursor
  ellipse(mouseX,mouseY,15,15);
}

void mouseClicked() {
  // find position of cursor in array
  // make sure cursor is on a colored rectangle
  if((((mouseX-wRect/2) % (wRect*2)) < wRect) &&
       (((mouseY-hRect/2) % (hRect*2) ) < hRect)) {
         // swap colors
         color temp = selectedColor;
         int i = (mouseY-hRect/2)/(hRect*2);
         int j = (mouseX-wRect/2)/(wRect*2);
         selectedColor = rectColors[j][i];
         rectColors[j][i] = temp;
       }
}

