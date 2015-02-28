
void setup() {
  size(300, 300);
  smooth();
}
 
void draw() {
  background (220);
 
 
  for (int i = 15; i <= 280; i = i + 20) {
    for (int j = 20; j <= 280 ; j = j + 20) {
      stroke(1);
      strokeCap(SQUARE);
      strokeWeight(10);
      line(i, j, i+10, j);
    }
  }
}
