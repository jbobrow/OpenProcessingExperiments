
void setup() { 
  size(500, 500);
  background(0);
}

void draw() {
  for ( int i=20;i< 500; i+= 75) {
    for ( int j=20; j<500;j += 75) {
      noFill();
      float a = map(i, 20, 500, 0, 255);
      float b= map(j, 20, 500, 0, 255);
      stroke(a, b, 255); 
      ellipse (i, j, 150, 150);
    }
  }
}


