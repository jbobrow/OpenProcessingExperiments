
void setup () {
  size (500,500);
  background (39,28,144);
}

void draw() {
  for (float i = 1.1; i<width ; i = i*1.1) {
    for (float j = 1.1 ; j<height ; j = j*1.1) {
    
    line(0, 0, i*1.5, j*1.5);
    }
  }
}
