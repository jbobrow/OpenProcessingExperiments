
// Math 4: Random
// Use three variables assigned to random values to create a composition that is different every time the program is run.

void setup() {
  size(600,600);
}

void draw() {
  background(255);
  float offset = height;
  float scaleVal = 50.0;
  float angleInc = PI/20.0;
  float angle = 0.0;
  float a = mouseX;
  float b = mouseY;
  float r = random(600);
  noFill();
  for (int x = 0; x <= width; x++) {
    float y = offset + (sin(angle) * scaleVal);
    if (r < 200) {
      stroke(0,250);
      bezier(x,y,b,a,a,b,width-x,height-y);
    } else if ((r > 200) && (r < 400)) {
      stroke(0,150);
      bezier(x,y,b,a,a,b,width-x,height-y);
    } else if (r > 400) {
      stroke(0,50);
      bezier(x,y,b,a,a,b,width-x,height-y);
    }
    angle += angleInc;
  }
}


