
void setup() {
  size(800, 600);
  background(255);
  noStroke();
  smooth();
}

void draw() {
  noStroke();
  background(255);
  for (int i=0;i<width;i=i+100) {
    for (int j=0;j<height;j=j+100) {
      for (int k=255;k>0;k=k-5) {
        fill(k);
        ellipse(i+50, j+50, k/5, k/5);
      }
    }
  }
  for (int i=0;i<width;i=i+100) {
    for (int j=0;j<height;j=j+100) {
      stroke(0,100);
      line(i+50,j+50,mouseX,mouseY);
    }
  }
}
