
/*
COMPOSIÇÃO 1D GRID
 */

int dX, dY; // Dimensões da tela
float cX, cY; // Coordenadas do centro da tela
int nL; // Número de linhas
int nCol; // Número de colunas
int eCol; // Espaço entre colunas

void setup() {
  dX=500; 
  dY=500;

  nCol=7;
  eCol=dX/nCol;

  size(dX, dY); // Criação da tela
  smooth(); // Suaviza o conteudo da tela
  background(250, 250, 0); // Cor de fundo
  noLoop(); // Sem repetição
}

void draw() {
  dX=width; 
  dY=height;

  cX=dX*0.5;
  cY=dY*0.5;

  nL=50;

  stroke(50, 75); // Traço de cor CINZENTA com alpha 75
  strokeWeight(10); // Espessura das linhas
  for (int x=1; x<nCol; x++) {
    for (int i=0; i<nL; i++) { // Criação de cada conjunto com (nL) linhas
      line(eCol*x, cY, random(eCol*x-30, eCol*x+30), random(cY-30, cY+30));
    }
  }
}

