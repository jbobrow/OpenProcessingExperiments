
void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  background (220);


  for (int i = 20; i <= 280; i = i + 20) { 
    for (int j = 15; j <= 280 ; j = j + 20) {
      stroke(255);
      line(i, j, i, j+10);
    }
  }
}
