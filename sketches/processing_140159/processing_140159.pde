
// Math 3: Trigonometry
// Create a composition with the data generated using sin()

void setup() {
  size(800,200);
  background(150);
}

void draw() {
  float a = mouseX;
  float b = mouseY;
  float offset = 100.0;
  float scaleVal = a/2;
  float angleInc = 0.111;
  float angle = 0.0;
  for (int x = 0; x <= width; x += 5) {
    println(sin(angle));
    float y = offset + (sin(angle) * scaleVal);
    //point(x,y);
    stroke(b,0,a);
    noFill();
    ellipse(x,y,250,250);
    angle += angleInc;
  }
}


