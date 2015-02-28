
/*
COMPOSIÇÃO RANDOM
 */

int dX, dY; // Dimensões da tela
float cX, cY; // Coordenadas do centro da tela
int nC; // Número de arcos
float rA1, rA2; // Ângulos aleatórios dos arcos

void setup() {
  dX=500; 
  dY=500;

  size(dX, dY); // Criação da tela
  smooth(); // Suaviza o conteudo da tela
  //frameRate(3); // Número de frames por segundo
  noLoop(); // Sem repetição
}

void draw() {
  cX=dX*0.5;
  cY=dY*0.5;

  nC=50;

  background(0); // Cor de fundo

  noStroke(); // Sem traço
  fill(255, random(200, 255)); // Preenchimento da circunferência de BRANCO com alpha aleatório entre 200 e 255
  ellipse(cX, cY, 35, 35); // Criação da circunferência no centro da tela com diametro 35
  filter(BLUR); // Aplicação de filtro BLUR na círcunferência

  stroke(255, 75); // Traço BRANCO com alpha 75
  strokeWeight(5); // Espessura do traço de 5
  noFill(); // Sem preenchimento
  for (int x=3; x<nC; x++) {
    rA1=random(-PI*2, PI/2); // Primeiro ângulo aleatório
    rA2=rA1+random(PI, 3*(PI/2)); // Segundo ângulo, definido pelo primeiro ângulo mais um ângulo aleatório entre PI e 3/4 de 2PI, para criar arcos com diferentes comprimentos, mas nunca menores que um semi-círculo nem maiores que 3/4 de círculo 
    arc(cX, cY, 15*x, 15*x, rA1, rA2); // Arcos com coordenadas no centro da tela dimensões, com dimensões multiplas de 15 a cada iteração
  }
}

