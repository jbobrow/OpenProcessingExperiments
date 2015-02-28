
void setup() {
  size(300, 300);
}

void draw() {
  background(0);
  
  for (int i = 2; i < width; i = i + 20){
    for(int j = 2; j < height; j = j + 20){
      rect(i, j, 15, 15);
    }
  }
}
