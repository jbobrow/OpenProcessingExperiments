
float x;
float y;
float px;
float py;
float easing = 0.09;
float a;
float b;

void setup() {
  size (1200, 600);
  smooth();
  stroke(0, 255);
  background(0);
}

void draw() {
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  //float weight = dist(x, y, px, py);
  //strokeWeight(weight);
  if (mousePressed == true) {
  //line(x, y, px, py);
  float a = map(x, 0, width, 0, 255);
  float b = map(y, 0, height, 0, 255);
  fill(a, b, a+ b);
  tri(x, y);
  } else {
    //fill(x, y, x - y);
    //line(x, y, px, py);
    //circle(x, y);
  }
  py = y;
  px = x;
  if (keyPressed) {
    if (key == ENTER) {
    background(0);
  }
  }
  //if (keyPressed) {
   // if (key == 'q') {
  //    background(111, 32, 167);
 //   }
 // }
}

void circle(float a, float b) {
  a = x;
  b = y;
  ellipse(a, b, 10, 10);
}

void tri(float triX, float triY) {
  triX = x;
  triY = y;
  rect(triX, triY, 10, 10);
}

