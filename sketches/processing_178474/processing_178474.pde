
float spaceBetween = 30; // space around the squares of marbles
float sz = 15; // size of one marble
float squareLength = 5*sz; // length of one square of marbles
float block = squareLength+spaceBetween;
int cols = 9;
int rows = 7;
color[] palette = { #F9F2BB, #E8D9B2, #D2ABAE, #B784A6, #E1AFB8 }; // defining an array of possible colors

void setup() {
  int w = int(spaceBetween+cols*block); // calculating the width of the sketch window, one spaceBetween has to be added 
  int h = int(spaceBetween+rows*block);  // calculating the height of the sketch window, one spaceBetween has to be added
  size(w, h);
  background( #E8D9B2);

  for (float x=spaceBetween; x<width; x+=block) {
    for (float y=spaceBetween; y<height; y+= block) {
      drawSquare(x, y);
    }
  }
}

void drawSquare(float ox, float oy) {
  for (int i=0; i<5; i++) {
    for (int j=0; j<5; j++) {
      float x = ox+(i+.5)*sz; 
      float y = oy+(j+.5)*sz; 
      int r = (int) random(palette.length); // picking a number between 0 and the length of the palette (in this case between 0 and 4.99999).
      color col = palette[r]; // get the corresponding color from the array
      fill(col); // use that color
      stroke(20);
      strokeWeight(1);
      ellipse(x, y, sz, sz);
    }
  }
}

