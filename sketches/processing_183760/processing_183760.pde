
void setup() {
  size (250, 250);
  background(0);
}

void draw() {
  for (int i=0; i< 250; i=i+10) { 
    stroke(255+i, i, i);
    line(0, 0, width, i);
  }
}

