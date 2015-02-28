
/*
COMPOSIÇÃO BOUNDING BOXES
 */

int dX, dY; // Dimensões da tela
float cX, cY; // Coordenadas do centro da tela
int nL; // Número de linhas
int lH, lV; // Limites horizontais e verticais

void setup() {
  dX=500; 
  dY=500;

  size(dX, dY); // Criação da tela
  smooth(); // Suaviza o conteudo da tela
  background(250, 250, 0); // Cor de fundo
  noLoop(); // Sem repetição
}

void draw() {
  dX=width; 
  dY=height;

  lH=150; 
  lV=150;

  cX=dX*0.5;
  cY=dY*0.5;

  nL=500;

  stroke(50, 75); // Traço de cor CINZENTA com alpha 75
  strokeWeight(20); // Espessura das linhas
  for (int i=0; i<nL; i++) { // Criação de cada conjunto com (nL) linhas
    line(cX, cY, random(cX-lH, cX+lH), random(cY-lV, cY+lV));
  }
}

