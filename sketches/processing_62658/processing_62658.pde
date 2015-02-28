

void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  fill (0);
  line (100, 0, 100, 200);
  line (0, 100, 200, 100);

  int x = 0;
  int w = width / 2;
  int y = 0;
  int h = height / 2;

  if (mouseX >= w) {
    x = 100;
  } 
  if (mouseY >= h) {
    y = 100;
  }
  
  rect (x, y, w, h);
}


