
void setup() {
  size(600, 600);
}
void draw() {
  background(0);
  for (int h = 0;h<hour();h++) {
  ellipse(h*10,100,10,10);
  }
  for (int m = 0;m<minute();m++) {
  ellipse(m*10,200,10,10);
  }
  for (int s = 0;s<second();s++) {
  ellipse(s*10,300,10,10);
  }
}

