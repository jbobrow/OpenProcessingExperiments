
// acd 20091105 remember remember...
// Fahrenheit 1105
// fractal squares and circles (based on a room divider seen in Trufaut's Fahrenheit 451)

color colour1, colour2;

void setup() {
  size(512, 512);
  noStroke();
  smooth();
  ellipseMode(CENTER);
  initColour();
}

void initColour() {
  colour1 = color(random(255), random(255), random(255));
  colour2 = color(random(255), random(255), random(255));
//  colour1 = #ff8800;
//  colour2 = #000000;
}

void draw() {
  drawSquare(0, 0, 512);
  noLoop();
}

void mouseClicked() {
  initColour();
  redraw();
}

// draw inscribed circle (or subdivide)
int count = 0;
void drawSquare(int x, int y, int s) {
//  println("DrawSquare: " + x + ", " + y + ", " + s);
  count++;
  if ((count % 100) == 0) {
//    println("Count: " + count);
  }
  boolean divide = false;
  // randomly divide space
  if (random(10) < 6) {
    divide = true;
  }
  // except when it's too small
  if (s == 8) {
    // don't subdivide
    divide = false;
  }
  // but force it when it's too big
  if (s >= 128) {
    divide = true;
  }
  if (divide) {
    // recurse using half the size
    s /= 2;
    drawSquare(x, y, s);
    drawSquare(x + s, y, s);
    drawSquare(x, y + s, s);
    drawSquare(x + s, y + s, s);
  } else {
    // draw circle (randomly swapping colours)
    color c1, c2;
    if (random(10) < 5) {
      c1 = colour1;
      c2 = colour2;
    } else {
      c1 = colour2;
      c2 = colour1;
    }
    fill(c1);
    rect(x, y, s, s);
    fill(c2);
    // circle should be half the area of the square
    // square is 1 x 1, circle = PI * r ^ 2 = .5
    // so r = sqrt(.5 / PI) = .39894...
    float d = .8;
    ellipse(x + s / 2, y + s / 2, s * d, s * d);
  }
}

