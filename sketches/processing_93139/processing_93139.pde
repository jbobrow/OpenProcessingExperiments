
//Emanuele S. Reis - Exercício quadrados
void setup() {
  size (200, 200);
  background (0);
}
void draw() {
    int coord=3;
    stroke (255);
    noFill ();
  while (coord<=255) {
    rect ((coord*coord), 5, 5, 5);
    rect ((coord*coord), 50, 10,10);
    rect ((coord*coord), 100, 15,15);
    rect ((coord*coord), 150, 20,20);
    coord=coord+2;
  }
}
