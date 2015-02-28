
// Variação Quadrática 
void setup() {
  size (200, 200);
  background (#164879);
}
void draw() {
  int y=3;
  stroke (255);
  fill (#A8B6C4);
  while (y<=255) { //Laço
    rect (15, y*y, 5,5);// Primeira coluna
    rect (45, y*y, 5,5);// Segunda coluna
    rect (75, y*y, 5,5);// Terceira coluna
    rect (105, y*y, 5,5);// Quarta coluna
    rect (135, y*y, 5,5);// Quinta coluna 
    rect (165, y*y, 5,5);// Sexta coluna

    y=y+2;
  }
}
