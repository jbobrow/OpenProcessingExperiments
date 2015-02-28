

void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  background(0);

  for (int i = 1; i < 280; i = i *2 ) {
    for (int j = 1; j < 280; j = j*2 ) {
      
      fill(#FFFFFF);
      
      ellipse(i, j, i/2, j/2);
    }
  }
}


