
void setup () {

  size (296, 296);
}

int shapeCount= 0;

void draw() {

  for(int x = 16; shapeCount< 9; x+=33) {
    if (shapeCount%2<=0) {

      rectMode (CENTER);
      fill (255, 0, 0);
      rect (x, width/2, 26, 26);
      shapeCount++;
    }
    else {

      ellipseMode (CENTER);
      fill (0, 255, 0);
      ellipse (x, width/2, 26, 26);
      shapeCount++;
    }
  }
}

