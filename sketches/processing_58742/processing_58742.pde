
/*
COMPOSIÇÃO 2D GRID
 */

int dX, dY; // Dimensões da tela
int nCol, nLin; // Número de colunas e linhas
int eCol, eLin; // Espaço entre colunas e linhas

void setup() {
  dX=500; 
  dY=500;

  nCol=10;
  nLin=10;
  
  eCol=dX/nCol;
  eLin=dY/nLin;

  size(dX, dY); // Criação da tela
  smooth(); // Suaviza o conteudo da tela
  background(255); // Cor de fundo
  noLoop(); // Sem repetição
}

void draw() {
  dX=width; 
  dY=height;

  stroke(255); // Traço AMARELO
  strokeWeight(5); // Espessura do traço de 5
  for (int x=0; x<nCol; x++) {
    for (int y=0; y<nLin; y++) {
      fill(200); // Preenchimento CINZA CLARO
      quad(10+(eCol*x), 0+(eLin*y), 40+(eCol*x), 20+(eLin*y), 40+(eCol*x), 40+(eLin*y), 10+(eCol*x), 20+(eLin*y)); // Criação da forma geométrica superior
      fill(150); // Preenchimento CINZA ESCURO
      quad(10+(eCol*x), 30+(eLin*y), 40+(eCol*x), 20+(eLin*y), 40+(eCol*x), 40+(eLin*y), 10+(eCol*x), 50+(eLin*y)); // Criação da forma geométrica superior

    }
  }
}

