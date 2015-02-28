
void setup() {
  size(500, 500);
  smooth();
  background(0);
}

void draw() {
  fill(255);
  for (int i = 0; i <= width; i += 10) {
    for (int j = 0; j <= height; j += 10) {
      beginShape();
      vertex(i,j);
      vertex(i+1,j+1);
      vertex(i+2,i+2);
      vertex(i+3,i+3);
      vertex(i+4,i+4);
      endShape(CLOSE);
      
    }
  }
}


