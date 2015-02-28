
int x= 0;

void setup() {
  size (200, 200);
  strokeWeight(5);
}

void draw() {
  background(255);
  if (keyPressed == true) {
    if ((key>=48) && (key<=57)) {
    x= map (key, 48, 57, 0, width);
  line (x, 100, x+25, 100);
  }
  }   
}
