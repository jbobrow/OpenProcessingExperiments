
void setup() {
  size(500, 500);
  background(136, 45, 23);
  
   for (int i = 0; i < 100; i+=5) {
    fill(244, 240, 236);
  ellipse(125, 5*i, i, i);
  ellipse(500-5*i, 125, i, i);
  }
}

void draw() {
}
