
void setup() {
  size (250, 250);
  background(255);
}

void draw() {
  for (int i=0; i< 250; i=i+20) { 

    line(0, i, width, i);
    line(i, 0, i, height);
  }
}

