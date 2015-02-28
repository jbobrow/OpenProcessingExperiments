
void setup() {
  size(800, 800);
  smooth();
  background(31, 41, 98);
}

void draw() {

  for (int i=0; i<width; i=i+2) {
    for (int j=0; j<width; j=j+2) {
      ellipse(i*20, j*20, 10, 10);
      fill(31, 41, 246, 100);
      noStroke();
    }
  }
  
    for (int t=0; t<width; t=t+2) {
    for (int p=0; p<width; p=p+2) {
      ellipse(t*20, p*20, 40, 40);
      fill(202, 41, 246, 10);
      noStroke();
    }
  }
    for (int i=0; i<width; i=i+2) {
    for (int j=0; j<width; j=j+2) {
      ellipse(i*20, j*20, 2, 2);
       fill(202, 41, 246, 255);
      noStroke();
    }
  }
}



