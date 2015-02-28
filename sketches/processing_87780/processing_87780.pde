
void setup() {
  size(610, 610);
  smooth();
  strokeCap(ROUND);
  strokeWeight(5);
}

void draw() {

  float a = map(mouseX, 0, width, 0, 55);
  float b = map(mouseX, 0, width, 80, 255);


  stroke(220, a, 31, b);
  background(200);


  for (float i=0; i<width; i+=20) {
    for (float j=0; j<height; j+=20) {
      line(i, j, i+20, j+5);
    }
  }
}



