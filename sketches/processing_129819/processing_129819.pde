
/*
Katie Manduca
 
 Draw a Sierpinski triangle
 */

void setup() {
  size(600, 600);
  background(0);
  noLoop();
}

void draw() {
  sierpinski(100, 500, 400, 160);
}

// draw a sierpinski triangle (with changing color based on level)
void sierpinski(float x, float y, float len, float blue) {
  if (len > 10) {
    stroke(100, 0, blue);
    fill(100, 0, blue);
    triangle(x, y, x + len, y, x + len * cos(PI/3), y - len * sin(PI/3));
    sierpinski(x, y, len/2, min(255, blue + 15));
    sierpinski(x + len/2, y, len/2, min(255, blue + 15));
    sierpinski(x + (len/2) * cos(PI/3), y - (len/2) * sin(PI/3), len/2, min(255, blue + 15));
  }
}



