
int i = 0;
void setup() {
  size(100, 100);
}
 
void draw() {
  background(125);
  i= (i+1) % width;
  diagonals(70, 90);
  diagonals(60, 70);
  diagonals(30, 40);
}
 
void diagonals(int x, int y) {
  line(x, y, i, i);
}



