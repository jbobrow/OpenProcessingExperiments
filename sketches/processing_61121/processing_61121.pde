
void setup() {
  size(300,300);
  smooth();
}

void draw() {
  background (255);
  fill(0);
  for(int i=0; i < 20; i = i + 1) {
     rect (0, i*20 +5,width, i*1.7);
  }
}
