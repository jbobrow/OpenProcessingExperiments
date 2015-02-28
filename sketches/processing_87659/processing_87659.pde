
void setup() {
  size(640, 480);
  smooth();
  noStroke();
}

void draw() {
  background(255);

  for (int i=0; i<width; i+=15) {
    for (int j=0; j<height; j+=15) {
      fill(50, 30);
      ellipse(i, j, 20, 10);
    }
  }
  
  fill(144, 156, 255, 80);
  ellipse(pmouseX, pmouseY, 45, 45);
}



