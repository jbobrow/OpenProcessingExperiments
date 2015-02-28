
//autor: Baran Güleşen
//nombre: Fibonacci numaraları ve renk paleti
//modificaciones en color y ancho de lineas
//Francisco Montero

color palet = HSB;
void setup() {
  size (900, 300);
  smooth();
}
 
void draw() {
  background (55,80,700,540);
  int [] fibonacci = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597};
  for (int i =0; i < fibonacci.length; i++) {
    for (int j =0; j < 450; j++) {
      strokeWeight(1);
      stroke(0, 30);
      float x = fibonacci[i];
      line (x+j, height, x+j, 0);
    }
  }
}

