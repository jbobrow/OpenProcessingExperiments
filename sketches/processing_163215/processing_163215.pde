
void setup() {
  size(400, 400);
  background(255);
  fill(0);
  noStroke();
}

void draw() {
  for (int i=0; i<=400; i+=30) {
    for (int j=0; j<=400; j+=30) {
      ellipse(i, j, j/10, j/10);
    }
  }
}

//A variável i determina que a posição horizontal das esferas deve aumentar, ou seja, elas serão desenhadas cada vez mais para a direita com o acréscimo da variável i pelo uso do laço for.
//Já a variável j, assim como a i, determina o deslocamento da posição onde as esferas devem ser pintadas na //vertical. Aproveitando o comportamente de aumentar tanto da posição vertical das esferas como do seu raio //para obter o efeito de "Halftone", utilizei a mesma variável para definir o raio crescente das esferas.

