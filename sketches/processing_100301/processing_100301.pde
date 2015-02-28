
// Fibonacci numaraları ve renk paleti 
color [] renkler = {#F22AB6, #2A64F2, #57F22A, #F2E92A, #F2302A};
color [] palet = renkler;
void setup() {
  size (900, 300);
  smooth();
}

void draw() {
  background (renkler[4]);
  int [] fibonacci = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597}; 
  for (int i =0; i < fibonacci.length; i++) {
    for (int j =0; j < 500; j++) {
      strokeWeight(1); 
      stroke(0, 30);
      float x = fibonacci[i];
      line (x+j, height, x+j, 0);
    }
  }
}
