
void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  background(0);
  
  for (int i = 10; i < width; i = i + 20){
    for(int j = 10; j < height; j = j + 20){
      ellipse (i, j, 15, 15);
    }
  }
}
